import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taskstorm/constants.dart';
//import 'package:taskstorm/main.dart';

var deviceHeight = height;
var deviceWidth = width;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  // final AuthServices auther = AuthServices();

  @override
  void initState() {
    // bool _passwordVisible = true;
    super.initState();
  }

  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return signInUI(context);
  }

  Scaffold signInUI(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(color: backgroundBlack, height: 65, width: deviceWidth),
                Container(
                  color: backgroundBlack,
                  height: deviceHeight / 2.5,
                  width: deviceWidth,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: const Image(
                      image: AssetImage('lib/assets/neon_blue_tasklist.png'),
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
                  'Sign In',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: blueText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: deviceHeight/8),
              textWithField(text: 'Email:', keyType: TextInputType.emailAddress, controller: _email),
              textWithField(text: 'Password:', keyType: TextInputType.visiblePassword, controller: _password)
            ],
          ),
          ],
        ),
      ),
    );
  }

  Column textWithField({required String text, required TextInputType keyType, required TextEditingController controller}) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, top: deviceHeight/25, bottom: 8.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: blueText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      keyboardType: keyType,
                      controller: controller,
                      style: TextStyle(color: blueText),
                      textAlignVertical: TextAlignVertical(y: -0.0),
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        fillColor: textFieldBlue,
                        filled: true,
                        contentPadding: EdgeInsets.only(left: 12, bottom: 0.0),// bottom: -25.0, top: 40),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
