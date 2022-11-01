
import 'package:flutter/material.dart';

double profileImageRadius = 90;
double borderThickness = 5;

double statCircleRadius = 50;
double statCircleBorderThickness = 4;

String avgRating = '4.5';

Widget getCircularProfileImage({@required imagePath}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        // stops: [0.1, 0.5, 0.7, 0.9],
        colors: [
          Color(0xff6A0EB1),
          Color(0xff8C2196),
        ],
      ),
    ),
    child: CircleAvatar(
      radius: 100,
      backgroundImage: AssetImage(imagePath),
    ),
  );
}

Widget getCircularStat({required String title, required String value}) {
  return Container(
    padding: EdgeInsets.all(statCircleBorderThickness),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // stops: [0.1, 0.5, 0.7, 0.9],
        colors: [
          Color(0xff7000FF),
          Color(0xffF01D1D),
        ],
      ),
    ),
    child: CircleAvatar(
      radius: statCircleRadius,
      backgroundColor: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('$title',
              textAlign: TextAlign.center,
              // style: CustomTextStyle.bodyTextStyle.copyWith(
              //     fontSize: 13,
              //     color: CustomColors.bottomNavBarUnselectedIconColor)
            // TextStyle(
            //   fontSize: 12,
            // ),
          ),
          Text(
            '$value',
            // style: CustomTextStyle.bodyTextStyle.copyWith(fontSize: 20),
          )
        ],
      ),
    ),
  );
}

Widget getCustomButton({required String title}){
  return SizedBox(
    width: 100,
    height: 50,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Colors.grey,
        shape: new RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.blueGrey,
              width: 2),
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        '$title',
        style: TextStyle(fontSize: 15),
      ),
    ),
  );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60,),

        getCircularProfileImage(imagePath: 'images/about01.png'),
        SizedBox(
          height: 30,
        ),
        Text(
          'John Doe',
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          height: 40,
        ),
        SizedBox(height: 60,),
        getCustomButton(title: 'Your Post'),
        SizedBox(height: 30,),
        getCustomButton(title: 'Upload'),
      ],
    );
  }
}
