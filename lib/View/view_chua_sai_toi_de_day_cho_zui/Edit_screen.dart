import 'package:flutter/material.dart';

class Edit_screen extends StatefulWidget {
  const Edit_screen({super.key});

  @override
  State<Edit_screen> createState() => _Main_screenState();
}

class _Main_screenState extends State<Edit_screen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: const CustomAppBar(),
      body: body(),
     // bottomNavigationBar: const CustomBottomNavigationBar(),
      drawer: myDrawer(),
    );
  }

  Widget body() {
    return const SafeArea(
      child: Center(
        child: Text("Edit Screen Body"),
      ),
    );
  }

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
