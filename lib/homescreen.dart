import 'package:flutter/material.dart';
import 'signin.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  void _getStarted(BuildContext context) {
    // Using pushReplacement to prevent going back to the splash screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignIn()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF1C120A,
      ), // Consistent dark brown background
      body: Stack(
        children: [
          // Background image with sophisticated gradient overlay
          Positioned.fill(
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.8), // Very dark at the top
                    const Color(
                      0xFF1C120A,
                    ).withOpacity(0.9), // Blends into main theme color
                    const Color(
                      0xFF1C120A,
                    ).withOpacity(0.95), // Even darker towards the bottom
                  ],
                  stops: const [0.0, 0.7, 1.0], // Control the fade intensity
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.darken, // Darken the image further
              child: Image.asset('assets/images/img1.jpg', fit: BoxFit.cover),
            ),
          ),

          // Content - Centered vertically and horizontally
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround, // Distribute space
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Spacer to push content down slightly
                  const Spacer(flex: 2),

                  // App Logo/Icon
                  const Column(
                    children: [
                      Icon(
                        Icons.coffee_maker_rounded, // Consistent coffee icon
                        color: Colors
                            .white, // White icon for better contrast on image
                        size: 90, // Larger icon
                        shadows: [
                          Shadow(
                            blurRadius: 15.0,
                            color: Colors.black87,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Brew Haven', // Your app name
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 44, // Very large and impactful
                          color: Colors.white,
                          fontWeight: FontWeight.w900, // Extra bold
                          letterSpacing: 2.0, // Increased spacing
                          shadows: [
                            Shadow(
                              blurRadius: 15.0,
                              color: Colors.black87,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Spacer to push main text up
                  const Spacer(flex: 1),

                  // Main Heading and Tagline
                  SizedBox(
                    width: 320, // Max width for text readability
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Coffee so good,\nyour taste buds will love it!', // Adjusted text for better flow
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 34, // Slightly larger
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.3, // Line height for readability
                            letterSpacing: 0.8,
                            shadows: [
                              // Subtle text shadow for depth
                              Shadow(
                                blurRadius: 8.0,
                                color: Colors.black54,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16), // Space between title and tagline
                        Text(
                          'Experience premium flavors and aroma tailored just for you.', // New tagline
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70, // Softer white
                            height: 1.5,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Spacer to push button down
                  const Spacer(flex: 3),

                  // Get Started Button
                  SizedBox(
                    width: double.infinity, // Full width button
                    child: ElevatedButton(
                      onPressed: () {
                        _getStarted(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.orange, // Consistent orange accent
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 18, // More vertical padding
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ), // Consistent rounded corners
                        ),
                        elevation: 10, // More pronounced shadow
                        shadowColor: Colors.orange.withOpacity(
                          0.5,
                        ), // Orange glow effect
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize
                            .min, // Shrink to fit content horizontally
                        children: const [
                          Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 22, // Larger font size
                              color: Colors.black, // Black text on orange
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                          SizedBox(width: 12), // Space between text and icon
                          Icon(
                            Icons
                                .arrow_forward_ios_rounded, // Modern forward arrow
                            color: Colors.black, // Black icon
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(flex: 1), // Final spacer
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
