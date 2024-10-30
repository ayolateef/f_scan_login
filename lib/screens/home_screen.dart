import 'package:f_scan_login/widgets/custome_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/qrscanner_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _tagController = TextEditingController();
  bool _isScanned = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            CustomTextField(
              label: 'Enter Tag Number',
              controller: _tagController,
            ),
            SizedBox(height: 15),

            authProvider.scanLoading
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(
              label: 'Scan QR Code',
              onPressed: () async {
                await authProvider.scanQRCode(_tagController.text);
                setState(() {
                  _isScanned = true;
                });
                Future.delayed(Duration(seconds: 2)).then((_) {
                  setState(() {
                    _isScanned = false;
                  });
                });
              },
            ),

            _isScanned
                ? const Icon(Icons.check_circle, color: Colors.green, size: 100)
                : Container(), // Show success icon for 2 seconds
          ],
        ),
      ),
    );
  }
}
