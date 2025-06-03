//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taskstorm/auth_services.dart';
import 'package:taskstorm/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome now Sign Out Bish')),
      body: Center(
        child: FilledButton(
          onPressed: () async {
            await AuthServices().signOutServices();
            Navigator.of(
              // ignore: use_build_context_synchronously
              context,
            ).pushNamedAndRemoveUntil(signInRoute, (_) => false);
          },
          child: Text('SignOut'),
        ),
      ),
    );
  }
}
