import 'package:flutter/material.dart';
import 'package:provider_demo/providers/authProvider/auth_provider.dart';
import '../../utils/input_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign IN"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputWidget(
                  labelText: "Email",
                  hintText: "Enter email",
                  onChange: auth.onChangeEmailText,
                ),
                SizedBox(height: 23.0),
                InputWidget(
                  labelText: "Password",
                  hintText: "Enter Password",
                  isPass: true,
                  onChange: auth.onChangePasswordText,
                ),
                const SizedBox(height: 23),
                GestureDetector(
                  onTap: (){
                    auth.loginUser()
                        .then((value) {
                      if (value.message != "success") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(value.errorMessage!),
                              backgroundColor: Colors.red,
                            )
                        );
                      } else {
                        Navigator.of(context).pushReplacementNamed('/home');
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
                          "LOGIN",
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
              onPressed: () => Navigator.of(context).pushReplacementNamed('/register'),
              child: Text("SignUp"),
          ),
        ),
      ),
    );
  }
}


