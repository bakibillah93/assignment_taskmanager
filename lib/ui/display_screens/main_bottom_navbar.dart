import 'package:flutter/material.dart';
import 'package:task_manager/ui/display_screens/progress_task_screen.dart';
import '../page/user_profile_bar.dart';
import 'add_new_task_screen.dart';
import 'cancelled_task_screen.dart';
import 'completed_task_screen.dart';
import 'new_task_screen.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _selectedScreen = 0;

  final List<Widget> _screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
    ProgressTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black38,
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          onTap: (index) {
            _selectedScreen = index;
            setState(() {
              //  _selectedScreen = index;
            });
          },
          elevation: 3,
          currentIndex: _selectedScreen,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_task_outlined), label: "New"),
            BottomNavigationBarItem(
                icon: Icon(Icons.done_outline_outlined), label: "Completed"),
            BottomNavigationBarItem(
                icon: Icon(Icons.cancel_outlined), label: "Cancelled"),
            BottomNavigationBarItem(icon: Icon(Icons.task), label: "Progress"),
          ]),

// floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddNewTaskScreen()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),

      // body page
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBar(),
            Expanded(child: _screens[_selectedScreen]),
          ],
        ),
      ),
    );
  }
}