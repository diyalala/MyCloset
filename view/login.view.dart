import 'package:flutter/material.dart';
import 'package:mycolset/view/dashboard.view.dart';
import 'package:mycolset/view/signup.view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top Image and NEW Text
              Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset("assets/images/hang.png",
                        width: 250,
                        height: 300,
                     ),
                      ),
                      Container(
                        height: 200,
                        width: 100,
                        color: Colors.white,
                        child: const RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: Text(
                              'NEW\nNEW\nNEW',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                'Sign In',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              // Email field
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  fillColor: Color(0xFFFBEAFF),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password field
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  fillColor: Color(0xFFFBEAFF),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Sign In Button
              ElevatedButton(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()),);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.redAccent),
                  ),
                ),
                child: const Text('Sign In', style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 30),

              // Sign Up link
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpApp()),);
                },
                child: const Text(
                  "Didn't have an account? Sign Up ",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}