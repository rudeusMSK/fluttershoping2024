import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/components/app_bar.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/LoginBody.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/sliderbody.dart';
import 'package:mainpage_detailuser_v1/components/bottom_navigationbar.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/editBody.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/homeBody.dart';

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
  Widget build(BuildContext context) {
    var hh = '00', mm = '01', ss = '00';
    List<Widget> bodyItem = [
      HomeBody(), // 0
      editbody(), // 1
      CarouselDemo(), // 2
      const SizedBox(), // Placeholder for future content if needed
      const LoginBody(), // 4
    ];

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          //AttendanceScreen(hh: hh, mm: mm, ss: ss),
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









/*
wanning:
:)) trường hợp count down Online ko thành => qui đùi lờ mờ (quay đầu là bờ)

*/ 








// // ignore_for_file: camel_case_types

// import 'package:flutter/material.dart';
// import 'package:mainpage_detailuser_v1/components/app_bar.dart';
// import 'package:mainpage_detailuser_v1/components/bodyWidgets/CountdownBody.dart';
// import 'package:mainpage_detailuser_v1/components/bodyWidgets/LoginBody.dart';
// import 'package:mainpage_detailuser_v1/components/bottom_navigationbar.dart';
// import 'package:mainpage_detailuser_v1/components/bodyWidgets/editBody.dart';
// import 'package:mainpage_detailuser_v1/components/bodyWidgets/homeBody.dart';

// class Main_screen extends StatefulWidget {
//   final String title;

//   const Main_screen({super.key, required this.title});

//   @override
//   State<Main_screen> createState() => _Main_screenState();
// }

// class _Main_screenState extends State<Main_screen> {
//   int _selectedIndex = 0;
//   final PageController _pageController = PageController();

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     _pageController.jumpToPage(index);
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {

//     // time : setup defaul 1mm
//     var hh = '00', mm = '01', ss = '00';
//     List<Widget> bodyItem = [
//       HomeBody(), // 0A
//       editbody(), // 1
//       editbody(), // 2
//       AttendanceScreen(hh: hh, mm: mm, ss: ss), // 3
//       const LoginBody(), // 4 test
//     ];

//     return Scaffold(
//       appBar: const CustomAppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             AttendanceScreen(hh: "00", mm: "01", ss: "00"),
//             PageView(
//               controller: _pageController,
//               onPageChanged: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//               children: bodyItem,
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(
//         selectedIndex: _selectedIndex,
//         onItemTapped: _onItemTapped,
//       ),
//       drawer: myDrawer(),
//     );
//   }

//   Drawer myDrawer() {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: const BoxDecoration(
//               color: Color.fromARGB(255, 0, 136, 255),
//             ),
//             child: Expanded(
//               child: Row(
//                 children: [
//                   const Icon(Icons.add),
//                   ListTile(
//                     title: const Text('Đoạn Chat'),
//                     selected: _selectedIndex == 0,
//                     onTap: () {
//                       _onItemTapped(0);
//                       Navigator.pop(context);
//                     },
//                   ),
//                   const Spacer(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void onClickButton() {}
// }