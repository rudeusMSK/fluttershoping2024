// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/ViewModel/User_View_Model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    userViewModel.fetch_User_Informations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, userViewModel, child) {
          if (!userViewModel.isUserInitialized) {
            return const Center(child: CircularProgressIndicator());
          }

          if (userViewModel.errorMessage != null) {
            return Center(child: Text(userViewModel.errorMessage!));
          }

          final user = userViewModel.user;

          if (user == null) {
            return const Center(child: Text('Không có thông tin người dùng.'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tên đăng nhập: ${user.tenDangNhap}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Email: ${user.email}', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Giới tính: ${user.gioiTinh}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('ID: ${user.iDND}', style: const TextStyle(fontSize: 20)),
              ],
            ),
          );
        },
      ),
    );
  }
}
