import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat_flutter/screens/first_screen.dart';
import 'package:flash_chat_flutter/screens/first_screen_pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/screens/welcome_screen.dart';
import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:flash_chat_flutter/testWorkspace.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          // body1: TextStyle(color: Colors.black54),
        ),
      ),
      //   home: Test(),
        //TODO: Uncomment this

      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        FirstScreen.id: (context) =>FirstScreen(),
      }
    );
  }
}
