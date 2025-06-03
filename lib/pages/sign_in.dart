import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taskstorm/constants.dart';
//import 'package:taskstorm/main.dart';
import 'package:taskstorm/auth_services.dart';

var deviceHeight = height;
var deviceWidth = width;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  // final AuthServices auther = AuthServices();

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
    return SignInUI(context);
  }

  Scaffold SignInUI(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(color: backgroundBlack, height: 65, width: deviceWidth),
              Container(
                color: backgroundBlack,
                height: deviceHeight / 2.5,
                width: deviceWidth,
                child: Container(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: const Image(
                      image: AssetImage('lib/assets/neon_blue_tasklist.png'),
                    ),
                  ),
                ),
              ),
              Container(
                color: backgroundBlack,
                width: deviceWidth,
                height: deviceHeight - (deviceHeight / 2.5 + 65),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: deviceHeight / 4.5),
              Center(
                child: Text(
                  'Sign UP',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: blueText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: deviceHeight / 6.5),
              Padding(
                padding: EdgeInsets.all(deviceWidth / 15),
                child: Text(
                  'Email:',
                  style: TextStyle(
                    color: blueText,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//   Scaffold SignInUI(BuildContext context) {
//     return Scaffold(
//     backgroundColor: creamyPink,
//     appBar: AppBar(
//       backgroundColor: brownishPink,
//       title: Text('Task Storm', style: TextStyle(color: Colors.white)),
//     ),
//     body: Padding(
//       padding: const EdgeInsets.only(
//         top: 150,
//         bottom: 250,
//         left: 8.0,
//         right: 8.0,
//       ),
//       child: Stack(
//         children: [
//           // Container(color: Color(0xFFDDCCBB)),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text('Name:'),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Enter your name here',
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 2.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 2.0),
//                   ),
//                 ),
//                 controller: _name,
//               ),
//               SizedBox(height: 20),
//               const Text('Email'),
//               TextField(
//                 controller: _email,
//                 decoration: InputDecoration(
//                   hintText: 'johncena@example.com',
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 2.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 2.0),
//                   ),
//                 ),
//               ),
//               FilledButton(
//                 onPressed: () async {
//                   log(_email.text);
//                   log(_name.text);
//                   final user = await AuthServices().signInService(email: _email.text, password: _name.text.toLowerCase());
//                   log(user?.id.toString() ?? "error");
//                   if (context.mounted) {
//                     Navigator.pushNamedAndRemoveUntil(
//                       context,
//                       homePageRoute,
//                       (_) => false,
//                     );
//                   }
//                 },
//                 child: const Text('Sign In'),
//               ),
//               GestureDetector(
//                 child: const Text('Sign Up'),
//                 onTap: () {
//                   Navigator.pushNamedAndRemoveUntil(context, signUpRoute, (_) => false);
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
//   }
// }
