
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newfirebase/authpage.dart';

import 'loginscreen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final _auth = AuthService();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();


  @override
  void dispose(){
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('REGISTER'),
            const SizedBox(height: 50,),
            TextFormField(
              controller: _name,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Name is empty';
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            TextFormField(
              controller: _email,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Email is empty';
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
              controller: _password,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Password is empty';
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 40.0,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _signUp,
                child: const Text('SignUp'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have a account?'),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                }, child: Text('login'))
              ],
            )
          ],
        ),
      ),
    );
  }

  //  _signUp() async {
  //   final user = await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
  // if(user != null){
  //   print('user success created');
  //   goToHome(context);
  // }
  //
  // }

  _signUp() async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );

      if (userCredential != null) {
        // Set the display name for the user
        await userCredential.user?.updateProfile(displayName: _name.text);

        print('User successfully created with display name: ${_name.text}');

        // Navigate to home screen or perform any other actions
        goToHome(context);
      }
    } catch (e) {
      print('Error signing up: $e');
      // Handle signup errors as needed
    }
  }


  goToHome(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
   }
}
