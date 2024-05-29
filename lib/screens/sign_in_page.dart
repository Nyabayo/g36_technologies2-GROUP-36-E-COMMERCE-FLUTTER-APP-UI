import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isCreatingAccount = false;

  void _toggleFormType() {
    setState(() {
      _isCreatingAccount = !_isCreatingAccount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isCreatingAccount ? 'Create Account' : 'Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isCreatingAccount ? _buildCreateAccountForm() : _buildSignInForm(),
      ),
    );
  }

  Widget _buildSignInForm() {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email or Phone Number'),
        ),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle sign-in logic
          },
          child: Text('Sign In'),
        ),
        TextButton(
          onPressed: () {
            // Handle forgot password logic
          },
          child: Text('Forgot Password?'),
        ),
        TextButton(
          onPressed: _toggleFormType,
          child: Text('New to G_36? Create an account'),
        ),
      ],
    );
  }

  Widget _buildCreateAccountForm() {
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();
    bool _showPassword = false;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _firstNameController,
          decoration: InputDecoration(labelText: 'First Name'),
        ),
        TextField(
          controller: _lastNameController,
          decoration: InputDecoration(labelText: 'Last Name'),
        ),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email or Mobile Number'),
        ),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Create Password'),
          obscureText: !_showPassword,
        ),
        TextField(
          controller: _confirmPasswordController,
          decoration: InputDecoration(labelText: 'Confirm Password'),
          obscureText: !_showPassword,
        ),
        Row(
          children: [
            Checkbox(
              value: _showPassword,
              onChanged: (value) {
                setState(() {
                  _showPassword = value!;
                });
              },
            ),
            Text('Show Password'),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle create account logic
          },
          child: Text('Create Account'),
        ),
        TextButton(
          onPressed: _toggleFormType,
          child: Text('Already a customer? Sign in'),
        ),
      ],
    );
  }
}
