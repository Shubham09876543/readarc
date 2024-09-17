import 'package:flutter/material.dart';
import 'login_page.dart'; // Ensure LoginPage exists
import 'register_page.dart'; // Ensure RegisterPage exists

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // E-book image
              Container(
                width: 150,
                height: 150,
                child: Image.asset(
                  'assets/ReadArc.png', // Ensure the asset exists and is declared in pubspec.yaml
                ),
              ),
              const SizedBox(height: 20),
              // Title
              const Text(
                'Welcome to ReadArc',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              // Subtitle
              Text(
                'Explore all the existing Books based on your interest',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Login button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the LoginPage when the Login button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text('Login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                      minimumSize: const Size(120, 50), // Button size
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Register button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the RegisterPage when the Register button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: const Text('Register'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                      minimumSize: const Size(120, 50), // Button size
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
