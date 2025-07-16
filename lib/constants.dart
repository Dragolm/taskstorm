import 'dart:ui';

import 'package:flutter/material.dart';

//Colors
const creamyPink = Color(0xFFFFEEDD);
const brownishPink = Color(0xFF452535);
const blueText = Color(0xFFB2D9F9);
const backgroundBlack = Color(0xFF010101);
const textFieldBlue = Color(0xFF22333C);
const faintDarkBlue = Color(0xFF5299C0);

//routes
const signUpRoute = '/signUp';
const signInRoute = '/signIn';
const homePageRoute = '/home';
const taskListRoute = '/taskList';

// First get the FlutterView.
FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

// // Dimensions in physical pixels (px)
// Size size = view.physicalSize;
// double width = size.width;
// double height = size.height;

// Dimensions in logical pixels (dp)
Size size = view.physicalSize / view.devicePixelRatio;
double width = size.width;
double height = size.height;