import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newfirebase/authpage.dart';
import 'loginscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<String?>(
              future: getUserDisplayName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return Text('Welcome, ${snapshot.data}!');
                } else {
                  return Text('Error fetching user data');
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                _authService.signOut();
                goToLogin(context);
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }

  // Method to retrieve user's display name
  Future<String?> getUserDisplayName() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await user.reload();
      return user.displayName;
    }

    return null;
  }

  // Navigate to login screen
  void goToLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
