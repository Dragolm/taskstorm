import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taskstorm/constants.dart';
import 'package:taskstorm/main.dart';
//import 'package:taskstorm/sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
          bottom: 250,
          left: 8.0,
          right: 8.0,
        ),
        child: Stack(
          children: [
            // Container(color: Color(0xFFDDCCBB)),
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
                    log(_email.text);
                    log(_name.text);
                    final AuthResponse res = await supabase.auth
                        .signInWithPassword(
                          email: _email.text.toLowerCase(),
                          password: _name.text.toLowerCase(),
                        );
                    final Session? session = res.session;
                    final User? user = res.user;
                    log(user?.id.toString() ?? "error");
                    if (context.mounted) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        homePageRoute,
                        (_) => false,
                      );
                    }
                  },
                  child: const Text('Sign In'),
                ),
                GestureDetector(
                  child: const Text('Sign Up'),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context, signUpRoute, (_) => false);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
