import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:taskstorm/auth_services.dart';
import 'package:taskstorm/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamyPink,
      appBar: AppBar(
        backgroundColor: brownishPink,
        title: Text('Task Storm', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 150,
          bottom: 0,
          left: 8.0,
          right: 8.0,
        ),
        child: Stack(
          children: [
            //Container(color: Color(0xFFDDCCBB), height: 350,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Name:'),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your name here',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                  controller: _name,
                ),
                SizedBox(height: 20),
                const Text('Email'),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    hintText: 'johncena@example.com',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () async {
                    log(_name.text);
                    log(_email.text);
                    AuthServices().signUpService(email: _email.text, password: _name.text.toLowerCase());
                  },
                  child: const Text('Sign Up'),
                ),
                GestureDetector(child: const Text('Sign In'), onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(signInRoute, (_) => false);
                },),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
