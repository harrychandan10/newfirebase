import 'package:flutter/material.dart';
import 'package:newfirebase/view/signupscreen.dart';

import '../model/authpage.dart';
import 'homescreen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();



  void login() async {
    final user = await _auth.loginWithEmailAndPassword(_email.text, _password.text);

    if(user != null){
      print('user logged in successfully');
      goToHome(context);
    }

  }

  @override
  void dispose(){
    super.dispose();
    _email.clear();
    _password.clear();


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: OverflowBar(
              overflowSpacing: 20,
              children: [
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
                    onPressed: login,
                    child: const Text('LogIn'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('create the account?'),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    }, child: Text('signup'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );

  }

  goToHome(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
  }
}
