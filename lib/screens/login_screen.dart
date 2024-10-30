import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custome_buttons.dart';
import 'home_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    BuildContext contextCopy = context;

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          children: [
            CustomTextField(
              label: 'Email',
              headerText: 'Enter your email',
              controller: _emailController,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              label: 'Password',
              headerText: 'Enter your password',
              controller: _passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (authProvider.loginLoading) const Center(child: CircularProgressIndicator()) else CustomButton(
              label: 'Login',
              onPressed: () async {
                await authProvider.loginUser(
                  _emailController.text,
                  _passwordController.text,
                );
                if (authProvider.token != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.green),
                          SizedBox(width: 10),
                          Text('Login successful'),
                        ],
                      ),
                      backgroundColor: Colors.greenAccent,
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Future.delayed(const Duration(seconds: 2)).then((_) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  });
                } else {
                  ScaffoldMessenger.of(contextCopy).showSnackBar(
                    const SnackBar(
                      content: Text('Login failed'),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
