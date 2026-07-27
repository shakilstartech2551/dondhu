import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text("Friends")),
    const Center(child: Text("Create")),
    const Center(child: Text("Chat")),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(Icons.home, 0),
              navItem(Icons.group, 1),

              const SizedBox(width: 40),

              navItem(Icons.chat_bubble_outline, 3),
              navItem(Icons.person, 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, int index) {
    return IconButton(
      onPressed: () {
        setState(() {
          currentIndex = index;
        });
      },
      icon: Icon(
        icon,
        color: currentIndex == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}