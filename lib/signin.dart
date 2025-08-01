import 'package:flutter/material.dart';
import 'homepage.dart'; // Assuming CoffeeHomePage is defined here

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  void _navigateToHomePage(BuildContext context) {
    Navigator.pushReplacement(
      // Use pushReplacement to prevent going back to sign-in
      context,
      MaterialPageRoute(builder: (context) => const CoffeeHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Gradient Overlay
          Positioned.fill(
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6), // Darker top
                    const Color(
                      0xFF1C120A,
                    ).withOpacity(0.9), // Blend into theme color at bottom
                  ],
                  stops: const [0.0, 1.0],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.darken, // Darken the image
              child: Image.asset('assets/images/img1.jpg', fit: BoxFit.cover),
            ),
          ),

          // Content (Logo, Form, Buttons)
          Center(
            child: SingleChildScrollView(
              // Allow scrolling if keyboard appears
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Logo/Title
                  const Padding(
                    padding: EdgeInsets.only(bottom: 40.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.coffee_maker_rounded, // A coffee-related icon
                          color: Colors.orange,
                          size: 80,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Brew Haven', // Your app name
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black54,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Semi-transparent form container
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 36,
                    ), // Increased padding
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFF2C2018,
                      ).withOpacity(0.9), // Lighter, more thematic brown
                      borderRadius: BorderRadius.circular(24), // More rounded
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.4,
                          ), // Stronger shadow for depth
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Welcome Back!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32, // Larger font size
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 30), // More vertical space
                        // Email Field
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                              color: Colors.white54,
                            ), // Softer hint text
                            prefixIcon: Icon(
                              Icons.email_rounded,
                              color: Colors.orange.shade300,
                            ), // Email icon
                            filled: true,
                            fillColor: Colors.black.withOpacity(
                              0.3,
                            ), // Darker, more translucent fill
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                15,
                              ), // More rounded
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 10,
                            ), // Adjust padding
                          ),
                        ),
                        const SizedBox(height: 20), // Consistent spacing
                        // Password Field
                        TextField(
                          obscureText: true,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.white54),
                            prefixIcon: Icon(
                              Icons.lock_rounded,
                              color: Colors.orange.shade300,
                            ), // Lock icon
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 10,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Handle forgot password
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.orange.shade300,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Sign In Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              _navigateToHomePage(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange, // Solid orange
                              padding: const EdgeInsets.symmetric(
                                vertical: 18,
                              ), // Increased padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ), // Consistent rounded corners
                              ),
                              elevation: 8, // More pronounced shadow
                              shadowColor: Colors.orange.withOpacity(
                                0.4,
                              ), // Orange shadow
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 20, // Larger font size
                                color: Colors.black, // Black text on orange
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),

                        // Or continue with
                        const Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.white60, fontSize: 14),
                        ),
                        const SizedBox(height: 20),

                        // Social Sign-in Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialButton(
                              icon: Icons
                                  .g_mobiledata_rounded, // Google icon (placeholder)
                              label: 'Google',
                              onPressed: () {
                                // Google sign-in logic
                              },
                            ),
                            const SizedBox(width: 20),
                            _buildSocialButton(
                              icon: Icons
                                  .facebook_rounded, // Facebook icon (placeholder)
                              label: 'Facebook',
                              onPressed: () {
                                // Facebook sign-in logic
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),

                        // Don't have an account? Sign Up
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigate to Sign Up page
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.orange,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for social sign-in buttons
  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade900, // Dark background
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.white12, width: 1), // Subtle border
        ),
        elevation: 5,
      ),
      icon: Icon(icon, color: Colors.white, size: 24),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
