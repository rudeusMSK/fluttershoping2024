// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mainpage_detailuser_v1/ViewModel/User_View_Model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, userViewModel, child) {
          if (!userViewModel.isUserInitialized) {
            userViewModel.fetch_User_Informations();
            return Center(child: CircularProgressIndicator());
          }

          if (userViewModel.errorMessage != null) {
            return Center(child: Text(userViewModel.errorMessage!));
          }

          final user = userViewModel.user;

          if (user == null) {
            return Center(child: Text('Không có thông tin người dùng.'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${user.tenDangNhap}', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Text('Email: ${user.email}', style: TextStyle(fontSize: 20)),
                 SizedBox(height: 10),
                  Text('Email: ${user.gioiTinh}', style: TextStyle(fontSize: 20)),
                   SizedBox(height: 10),
                     Text('Email: ${user.iDND}', style: TextStyle(fontSize: 20)),
              ],
            ),
          );
        },
      ),
    );
  }
}
