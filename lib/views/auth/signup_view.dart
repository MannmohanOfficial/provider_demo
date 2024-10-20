import 'package:flutter/material.dart';

import '../../providers/authProvider/auth_provider.dart';
import '../../utils/input_widget.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign UP"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputWidget(
                  labelText: "Email",
                  hintText: "Enter email",
                  onChange: auth.onChangeEmailText,
                ),
                const SizedBox(height: 23.0),
                InputWidget(
                  labelText: "Password",
                  hintText: "Enter Password",
                  isPass: true,
                  onChange: auth.onChangePasswordText,
                ),
                const SizedBox(height: 23),
                GestureDetector(
                  onTap: (){
                    auth.registerUser()
                        .then((value) {
                      if (value.message != "success") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(value.errorMessage!),
                            backgroundColor: Colors.red,
                          )
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Successfully registered!"),
                              backgroundColor: Colors.green,
                            )
                        );
                        Navigator.of(context).pushReplacementNamed('/login');
                      }
                    },);
                  },
                  child: SizedBox(
                    height: 52.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 52,
        child: Center(
          child: TextButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed('/login'),
            child: const Text("SignIn"),
          ),
        ),
      ),
    );
  }
}
