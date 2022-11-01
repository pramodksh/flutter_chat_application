import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flash_chat_flutter/screens/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'first_screen_pages/home_screen.dart';
import 'first_screen_pages/profileScreen.dart';

class FirstScreen extends StatefulWidget {





  const FirstScreen({Key? key}) : super(key: key);
  static String id = 'first_screen';

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

Card myCard = Card(
  elevation: 4.0,
  child: Column(
    children: [
      ListTile(
        title: Text('Mahesh'),
        // subtitle: Text('subheading'),
        trailing: Icon(Icons.favorite_outline),
      ),
      Container(
        height: 200.0,
        child: Ink.image(
          image: AssetImage('images/about02.png'),
          fit: BoxFit.cover,
        ),
      ),
      Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.centerLeft,
        child: Text('Description : Lorem Ipsum'),
      ),
      ButtonBar(
        children: [
          Icon(Icons.comment),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.share),
          SizedBox(
            width: 20,
          ),
        ],
      )
    ],
  ),
);



final List<int> numberofcontainers = [2, 7, 1];

class _FirstScreenState extends State<FirstScreen> {
  List<String> list = <String>['Coin', 'Stamp'];



  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Index 1: Trade',
      style: optionStyle,
    ),
    Text(
      'Index 2: Forum',
      style: optionStyle,
    ),
    ProfileScreen(),


  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin and Stamp'),
        actions: [
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.white),
            // underline: Container(
            //   height: 2,
            //   color: Colors.white,
            // ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.arrow_2_squarepath),
            label: 'Trade',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.app_badge_fill,
            ),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'User',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


