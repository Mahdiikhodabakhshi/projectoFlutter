import 'package:flutter/material.dart';
import 'package:mahdi_khodabakhshi/src/pages/home_page.dart';
import 'package:mahdi_khodabakhshi/src/pages/user_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPage = 0;
 // List _page = [HomePage(), UserPage()];
   List<Widget> _page =<Widget> [HomePage(), UserPage()];

    static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // body: _page[_selectedPage],
     body: IndexedStack(
      index: _selectedPage,
      children: _page,
     ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (index) => setState(() {
          _selectedPage = index;
        }),
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white70,
        items:<BottomNavigationBarItem> [
          BottomNavigationBarItem(icon:Icon(Icons.home) , label: 'Home ' ),
          BottomNavigationBarItem(icon:Icon(Icons.person) , label: 'User'),

        ],
      ),
    );
  }
}
