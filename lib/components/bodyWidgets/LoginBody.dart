import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/UserModel.dart';
import 'package:mainpage_detailuser_v1/ViewModel/User_View_Model.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/CountdownBody.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/ErrorBody.dart';
import 'package:mainpage_detailuser_v1/components/dialogWidgets/CookieInvalid_Dialog.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  // textfield controller:
  final userNameController = TextEditingController();
  final userPasswordController = TextEditingController();

  // user controller:
  UserViewModel userViewModel = UserViewModel();

  int? setStatus;

  // Status setup:
  String textFieldInvalid = '',
      //  titleView = 'LOGIN',
      wanning =
          "xin chào!\nchúng tôi cần bạn nhập đầy đủ thông tin\nđể thực hiện đăng nhập, chân thành cảm ơn.";

  @override
  void initState() {
    super.initState();
    // fetch user infor => user detail
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    userViewModel.fetch_User_Informations();
  }

  @override
  void dispose() {
    userNameController.dispose();
    userPasswordController.dispose();
    wanning = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //  title: Text(titleView),
          ),
      body: Consumer<UserViewModel>(
        builder: (context, userViewModel, child) {
          return checkStatus(userViewModel.getStateCode);
        },
      ),
    );
  }

  Widget loginView() {
    return Column(
      children: [
        const Text('LOGIN'),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: userNameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your username',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: userPasswordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your password',
            ),
            obscureText: true,
          ),
        ),
        if (textFieldInvalid.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              textFieldInvalid,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
        ElevatedButton(
          onPressed: () async {
            String username = userNameController.text.trim();
            String password = userPasswordController.text.trim();

            if (username.isNotEmpty && password.isNotEmpty) {
              if (!userViewModel.userIsLoading) {
                const Center(child: CircularProgressIndicator());
              }
              // Call API login account and wait for the response:
              await Provider.of<UserViewModel>(context, listen: false)
                  .fetch_User_Account(username, password);

              // xử lý đăng nhập sai thông tin tại đây
              // do somthing...
              if (userViewModel.getStateCode == 200) {
                print('đăng nhập thành công ! status Code 200');
                // If login is successful, fetch user information:
                if (Provider.of<UserViewModel>(context, listen: false)
                    .isUserLoggedIn()) {
                  // get user infor
                  await Provider.of<UserViewModel>(context, listen: false)
                      .fetch_User_Informations();
                }
              } else {
                setState(() {
                  textFieldInvalid =
                      "Sorry ! StatusCode is ${userViewModel.getStateCode} !";
                });
              }
              // xử lý đăng nhập sai thông tin tại view:
            } else {
              setState(() {
                textFieldInvalid = wanning;
              });
            }
          },
          child: const Text('Login'),
        ),
      ],
    );
  }

  Widget profileView() {
    return Consumer<UserViewModel>(builder: (context, userViewModel, child) {
      if (!userViewModel.userIsLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      // if (userViewModel.errorMessage != null) {
      //   return Center(child: Text(userViewModel.errorMessage!));
      // }

      User? user = userViewModel.user;

      return user == null
          ? const Center(child: Text('Không có thông tin người dùng.'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "PROFILE",
                    textAlign: TextAlign.center,
                  ),
                  Text('Tên đăng nhập: ${user.tenDangNhap}',
                      style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text('Email: ${user.email}',
                      style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text('Giới tính: ${user.gioiTinh}',
                      style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text('ID: ${user.iDND}',
                      style: const TextStyle(fontSize: 20)),
                ],
              ),
            );
    });
  }

  Widget checkStatus(int? repStateCode) {
    if (repStateCode == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (repStateCode == 200) {
      return profileView();
    } else if (repStateCode == 500) {
      return Errbody(repStateCode);
    } else {
      return loginView();
    }
  }
}
