import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //property
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  late SharedPreferences loginData;
  late bool newUser;

  @override
  //method dispose untuk menghindari kebocoran data
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  //method checkLogin
  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool('login') ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

//widget tree
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       final isValidation = formKey.currentState!.validate();

              //       String username = _nameController.text;
              //       if (isValidation) {
              //         loginData.setBool('login', false);
              //         loginData.setString('username', username);

              //         Navigator.pushAndRemoveUntil(
              //             context,
              //             MaterialPageRoute(builder: (context)),
              //             (route) => HomeScreen());
              //       }
              //     },
              //     child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
