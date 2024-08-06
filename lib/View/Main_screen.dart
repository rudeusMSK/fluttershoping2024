import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/View/view_chua_sai_toi_de_day_cho_zui/Profile_screen.dart';
import 'package:mainpage_detailuser_v1/components/app_bar.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/LoginBody.dart';
import 'package:mainpage_detailuser_v1/components/bottom_navigationbar.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/chatBody.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/editBody.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/homeBody.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/loveBody.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/Errorbody.dart';

class Main_screen extends StatefulWidget {
  final String title;

  const Main_screen({super.key, required this.title});

  @override
  State<Main_screen> createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyItem = [
      HomeBody(), // 0
      editbody(), // 1
      lovebody(), // 2
      LoginBody(), // 3
      ProfileScreen(),
      //profilebody(), // 4
    ];

    return Scaffold(
      appBar: const CustomAppBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: bodyItem,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      drawer: myDrawer(),
    );
  }

  // List<Widget> bodyFunction_(List<Widget> bodyItem) {
  //   return user.name != '🐸' ? [Errorbody(user)] : bodyItem;
  // }

  Drawer myDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 136, 255),
            ),
            child: Expanded(
              child: Row(
                children: [
                  const Icon(Icons.add),
                  ListTile(
                    title: const Text('Đoạn Chat'),
                    selected: _selectedIndex == 0,
                    onTap: () {
                      _onItemTapped(0);
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onClickButton() {}
}
