import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  Widget _buildIcon(String assetName, int index) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (selectedIndex == index)
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
          ),
        Image.asset(
          assetName,
          width: 24,
          height: 24,
          color: selectedIndex == index ? Colors.white : Colors.grey,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10.0), // or 15.0 - 20.0
      margin: const EdgeInsets.only(bottom: 10.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            // home = 0
            BottomNavigationBarItem(
              icon: _buildIcon('lib/assets/icons/bottombar/Home.png', 0),
              label: "", //'Trang Chủ',
            ),
            // edit = 1
            BottomNavigationBarItem(
              icon: _buildIcon('lib/assets/icons/bottombar/Edit.png', 1),
              label: "",//'tìm kiếm',
            ),
            // love = 2
            BottomNavigationBarItem(
              icon: _buildIcon('lib/assets/icons/bottombar/Love.png', 2),
              label: "", //'tym💕',
            ),
            // chat = 3
            BottomNavigationBarItem(
              icon: _buildIcon('lib/assets/icons/bottombar/Chat.png', 3),
              label: "", //'đánh giá',
            ),
            // profile = 4
            BottomNavigationBarItem(
              icon: _buildIcon('lib/assets/icons/bottombar/Profile.png', 4),
              label: "", //'Thông tin',
            ),
          ],
          backgroundColor: const Color(0xFF152354),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          // icon select:
          selectedIconTheme: const IconThemeData(
            color: Colors.amber,
          ),
          // icon Unselect:
          unselectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
      ),
    );
  }
}
