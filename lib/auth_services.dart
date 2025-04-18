//import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taskstorm/main.dart';

class AuthServices {
  
  //signin
  Future<User?> signInService({required String email, required String password}) async {
    final res = await supabase.auth.signInWithPassword(email: email, password: password);
    return res.user;
  }

  //signup
  Future<User?> signUpService({required String email, required String password}) async {
    final res = await supabase.auth.signUp(email: email, password: password);
    return res.user;
  }

  //logout
  Future<void> signOutServices() async {
    await supabase.auth.signOut();
  }

  //get email can implement later if needed 

}