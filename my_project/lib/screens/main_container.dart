import 'package:flutter/material.dart';
import 'package:my_project/screens/home_screen.dart';
import 'package:my_project/screens/login_screen.dart';

class Maincontainer extends StatefulWidget {
  const Maincontainer({super.key});
  @override
  State<Maincontainer> createState() => _Maincontainer();
}

class _Maincontainer extends State<Maincontainer> {
  int index = 0;
  final display = const [LoginScreen(), Homescreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD Operation"),
      ),
      body: display[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: index,
        onTap: (currnt) {
          setState(() {
            index = currnt;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: "Login"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home")
        ],
      ),
    );
  }
}
