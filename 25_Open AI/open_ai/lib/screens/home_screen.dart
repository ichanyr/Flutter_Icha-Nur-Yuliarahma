import 'package:flutter/material.dart';
import 'package:open_ai/screens/result_screen.dart';
import 'package:open_ai/services/recommendation_service.dart';

const List<String> phoneRegions = <String>[
  'Asia',
  'Europe',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _camera = TextEditingController();
  final TextEditingController _internalStorageCapacity =
      TextEditingController();
  String phoneRegionValue = phoneRegions.first;
  bool isLoading = false;

  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationService.getRecommendation(
          phoneRegion: phoneRegionValue,
          price: _price.text,
          camera: _camera.text,
          storage: _internalStorageCapacity.text,
          internalStorageCapacity: '');

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            gptResponseData: result,
          ),
        ),
      );
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Gagal mendapatkan rekomendasi'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Handphone Recommendation"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    "Handphone Recommendation by AI",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Select Region"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: phoneRegionValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        phoneRegionValue = newValue!;
                      });
                    },
                    items: phoneRegions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Input Price"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _price,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Input Price",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Input Price';
                      }
                      return null;
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Input Camera Resolution"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _camera,
                    decoration: const InputDecoration(
                        hintText: "Input Camera Resolution (MP)"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Input Camera Resolution';
                      }
                      return null;
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Input Amount of Cellphone Storage"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _internalStorageCapacity,
                    decoration: const InputDecoration(
                        hintText: "Input Amount Storage (GB)"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Input Amount Storage';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _getRecommendations();
                            }
                          },
                          child: const Text("Get Recommendations"),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
