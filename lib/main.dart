//import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taskstorm/constants.dart';
import 'package:taskstorm/sign_in.dart';
import 'package:taskstorm/sign_up.dart';
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
      home: SignIn(),
      routes: {
        signUpRoute: (context) => SignUp(),
        signInRoute: (context) => SignIn(),
        homePageRoute: (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
