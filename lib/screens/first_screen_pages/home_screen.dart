import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
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
              itemCount: listOfUserName.length,
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
    );
  }
}

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


