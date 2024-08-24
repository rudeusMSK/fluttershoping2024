import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/ViewModel/User_View_Model.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/LoginBody.dart';

Widget showSessionExpiredDialog(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Session Expired'),
          content: const Text(
              'Your login session has expired. Please login again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // tắt alert
                UserViewModel userViewModel = UserViewModel();
                userViewModel.isLogin == true;
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginBody()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  });
  return Container(); // return an empty container so the rest of the UI is not disturbed
}
