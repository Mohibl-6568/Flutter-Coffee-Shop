import 'package:flutter/material.dart';
import 'dart:async';
import 'homepage.dart';

class CheckoutConfirmationPage extends StatefulWidget {
  final double totalAmount;

  const CheckoutConfirmationPage({super.key, required this.totalAmount});

  @override
  State<CheckoutConfirmationPage> createState() =>
      _CheckoutConfirmationPageState();
}

class _CheckoutConfirmationPageState extends State<CheckoutConfirmationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  int _remainingMinutes = 25; // Example delivery time in minutes
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Animation setup for the checkmark icon
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut, // A bouncy elastic effect
      ),
    );

    // Start the animation
    _animationController.forward();

    // Start the countdown timer
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (_remainingMinutes > 0) {
        setState(() {
          _remainingMinutes--;
        });
      } else {
        _timer?.cancel(); // Stop the timer when countdown reaches 0
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the animation controller
    _timer?.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF120C08,
      ), // Deep coffee brown/black for dark theme
      appBar: AppBar(
        backgroundColor: const Color(0xFF120C08),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close_rounded,
            color: Colors.white,
            size: 28,
          ), // Close button
          onPressed: () {
            // Navigate back to home page, clearing previous routes
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const CoffeeHomePage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        title: const Text(
          'Order Confirmation',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTransition(
              // Apply scale animation to the icon
              scale: _scaleAnimation,
              child: Icon(
                Icons.check_circle_outline, // Checkmark icon
                color: Colors.green.shade400,
                size: 150, // Large icon
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Order Placed Successfully!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30, // Larger font
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Thank you for your purchase. Your order for \$${widget.totalAmount.toStringAsFixed(2)} has been confirmed and will be prepared shortly.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18, // Larger font
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30), // Space before delivery info
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delivery_dining, // Delivery icon
                  color: Colors.orange.shade400,
                  size: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  _remainingMinutes > 0
                      ? 'Estimated Delivery: $_remainingMinutes minutes'
                      : 'Delivered!',
                  style: TextStyle(
                    color: _remainingMinutes > 0
                        ? Colors.orange.shade300
                        : Colors.green.shade400,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to home page, clearing previous routes
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const CoffeeHomePage(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade600,
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 8,
                ),
                child: const Text(
                  'Continue Shopping',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
