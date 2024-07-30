// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/ViewModel/User_View_Model.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final UserNameController = TextEditingController();
  final UserPasswordController = TextEditingController();
  UserViewModel userViewModel = UserViewModel();
  String TextField_Invalid = '';
  String Textvalue = "xin chào!\nchúng tôi cần bạn nhập đầy đủ thông tin\nđể thực hiện đăng nhập, chân thành cảm ơn.";

  @override
  void dispose() {
    UserNameController.dispose();
    UserPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: UserNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: UserPasswordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your password',
              ),
              obscureText: true,
            ),
          ),

          if (TextField_Invalid.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                TextField_Invalid,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
          ElevatedButton(
            onPressed: () async {
              String username = UserNameController.text.trim();
              String password = UserPasswordController.text.trim();

              username.isNotEmpty && password.isNotEmpty
                  ? userViewModel.fetch_User_Account(username, password)
                  : setState(() {
                      TextField_Invalid = Textvalue;
                    });
            },
            child: const Text('Login'),
          ),
          // Consumer<UserViewModel>(
          //   builder: (context, userViewModel, child) {
          //     if (userViewModel. .isNotEmpty) {
          //       return Text("Cookies: ${userViewModel.userCookie}");
          //     } else {
          //       return const Text("No cookies fetched");
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
