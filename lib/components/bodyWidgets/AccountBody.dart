// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Services/UserServices.dart';
import 'package:mainpage_detailuser_v1/View/view_chua_sai_toi_de_day_cho_zui/Profile_screen.dart';
import 'package:mainpage_detailuser_v1/ViewModel/User_View_Model.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/ErrorBody.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/LoginBody.dart';
import 'package:provider/provider.dart';

class AccountBody extends StatefulWidget {
  const AccountBody({super.key});

  @override
  State<StatefulWidget> createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  var repStateCode;

  @override
  void initState() {
    super.initState();
    //final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    // if (userViewModel.isUserLoggedIn()) {
    //   userViewModel.fetch_User_Informations();
    // }
    repStateCode = UserServices.getStatusCode();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    // checkStatus: lấy giao diện tương ứng
    return Scaffold(
      body: checkStatus(context, repStateCode),
    );
  }
}

// Widget checkStatus(BuildContext context, var repStateCode) {
//   //var repStateCode = UserServices.getStatusCode();
//   if (repStateCode == 200) {
//     return const ProfileScreen();
//   // ignore: curly_braces_in_flow_control_structures
//   } else if (repStateCode == 500)  {
//     return Errorbody(repStateCode);
//   }
//   // ignore: curly_braces_in_flow_control_structures
//   else  return const LoginBody();
// }

Widget checkStatus(BuildContext context, var repStateCode) {
  if (repStateCode == 200) {
    return const ProfileScreen();
  } else if (repStateCode == 500) {
    return Errbody(repStateCode);
  } else {
    return const LoginBody();
  }
}