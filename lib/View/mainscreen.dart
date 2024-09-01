import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/components/appbars/app_bar.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/user_body.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/edit_body.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/home_body.dart';
import 'package:mainpage_detailuser_v1/components/bottombars/bottom_navigationbar.dart';

class MainScreen extends StatefulWidget {
  final String title;

  const MainScreen({super.key, required this.title});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    // distroy PageController
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyItem = [
      const HomeBody(), // 0
      editbody(), // 1
      editbody(), // 2
      editbody(), // 3
      const UserBody(), // 4
    ];

    return Scaffold(
      // Appbar customs:
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: bodyItem,
            ),
          ),
        ],
      ),
      // custom Bottom Navigation bar:
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      drawer: myDrawer(),
    );
  }

  Drawer myDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 136, 255),
            ),
            child: Text('Đoạn Chat'),
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Đoạn Chat'),
            selected: _selectedIndex == 0,
            onTap: () {
              _onItemTapped(0);
              Navigator.pop(context);
            },
          ),
          // Add more Drawer options here
        ],
      ),
    );
  }
}