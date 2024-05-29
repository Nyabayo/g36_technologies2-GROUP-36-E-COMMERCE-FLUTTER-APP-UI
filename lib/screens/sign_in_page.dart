import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome'),
            ElevatedButton(
              onPressed: () {
                // Navigate to Create Account Page
              },
              child: Text('Create Account'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Sign In Form
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
