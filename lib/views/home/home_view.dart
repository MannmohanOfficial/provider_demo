import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/userProvider/user_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserProvider>().getUserProfile();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HOME"),
      ),
      body: Consumer<UserProvider>(
        builder: (context, user, child) {
          return user.isLoading ?
              Center(
                child: CircularProgressIndicator(),
              ) :
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(user.profile!.data.avatar),
                      ),
                      const SizedBox(height: 23),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("First Name   :"),
                          Text("   ${user.profile!.data.firstName}")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Last Name   :"),
                          Text("   ${user.profile!.data.lastName}")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Email   :"),
                          Text("   ${user.profile!.data.email}")
                        ],
                      ),
                    ],
                  ),
                ),
              );
        },
      ),
    );
  }
}
