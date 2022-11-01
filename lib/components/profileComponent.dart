import 'package:flutter/material.dart';

double profileImageRadius = 90;
double borderThickness = 5;

double statCircleRadius = 50;
double statCircleBorderThickness = 4;

String avgRating = '4.5';

Widget getCircularProfileImage({@required imagePath}) {
  return Container(
    padding: EdgeInsets.all(borderThickness),
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
      radius: profileImageRadius,
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
      backgroundColor: Colors.blue,
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

