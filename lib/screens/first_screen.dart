import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat_flutter/screens/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

List<String> listOfUserName = ['John', 'Joe', 'Adam'];
List<String> listOfDescription = [
  'As designers attempting to creating functional work',
  'Oftentimes we are required to make our designs look as finished as possible.',
  'Make sure the prototype looks finished by inserting text or photos or what have you.'
];

List<String> listOfImages = [
  'images/about01.png',
  'images/about02.png',
  'images/about03.png',
  'images/about04.png'
];

final List<int> numberofcontainers = [2, 7, 1];

class _FirstScreenState extends State<FirstScreen> {
  List<String> list = <String>['Coin', 'Stamp'];



  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    Container(
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 240.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: listOfImages.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Image(image: AssetImage(i)));
                  },
                );
              }).toList(),
            ),
            Text("News"),
            // ===============================
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: numberofcontainers.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 1000,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(listOfUserName[index]),
                        // subtitle: Text('subheading'),
                        trailing: Icon(Icons.favorite_outline),
                      ),
                      Container(
                        height: 200.0,
                        child: Ink.image(
                          image: AssetImage(listOfImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.centerLeft,
                        child: Text(listOfDescription[index]),
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
              },
            ),
            // ==================================
            // SizedBox(height: 30,),
            // myCard,
            // SizedBox(height: 30,),
            // myCard,
            // SizedBox(height: 30,),
            // myCard,
          ],
        ),
      ),
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
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


