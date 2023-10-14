import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String password = "123456789";

  late SharedPreferences loginData;
  late bool newUser;

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool("login") ?? true;
    print(newUser);

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //     // title: const Text("Login"),
        //     // elevation: 0,
        //     // centerTitle: true,
        //     // backgroundColor: Color(0XFF22668D),
        //     ),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 40),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Icon(Icons.phone_android_rounded, size: 100),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      hintText: "Enter your username",
                      icon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your username";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  // TextFormField(
                  //   controller: _emailController,
                  //   decoration: const InputDecoration(
                  //     labelText: "Email",
                  //     hintText: "Enter your email",
                  //     icon: Icon(Icons.email),
                  //   ),
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return "Please enter your email";
                  //     }
                  //     final isEmailValidation = EmailValidator.validate(value);
                  //     if (!isEmailValidation) {
                  //       return "Please enter a valid email";
                  //     }

                  //     return null;
                  //   },
                  // ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      final isValidation = formKey.currentState!.validate();
                      String username = _nameController.text;
                      print(username);
                      String passwordCurrent = _passwordController.text;

                      if (isValidation) {
                        if (passwordCurrent != password) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Password is incorrect"),
                            ),
                          );
                        } else {
                          loginData.setBool("login", false);
                          loginData.setString("username", username);

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            (route) => false,
                          );
                        }
                      }
                    },
                    child: const Text("Login"),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                          Size(double.infinity, 35)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0XFF22668D),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
