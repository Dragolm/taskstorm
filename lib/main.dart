//import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taskstorm/constants.dart';
import 'package:taskstorm/pages/home_page.dart';
import 'package:taskstorm/pages/sign_in.dart';
import 'package:taskstorm/pages/sign_up.dart';
//import 'package:taskstorm/constants.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: 'https://agpqpghwpacmogsxoojs.supabase.co',
    anonKey: dotenv.env['anon_key'].toString(),
  );
  runApp(MyApp());
}

// Get a reference to your Supabase client
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskStorm',
      home: AuthGate(),
      routes: {
        signUpRoute: (context) => SignUp(),
        signInRoute: (context) => SignIn(),
        homePageRoute: (context) => HomePage(),
      },
    );
  }
}


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: Supabase.instance.client.auth.onAuthStateChange,
     builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      //after snapshot is gotten to check is a valid session exists
      final session = snapshot.hasData ? snapshot.data!.session : null;
      if (session!=null) {
        return HomePage();
      } else {
        return SignIn();
      }
     } 
    ,);
  }
}