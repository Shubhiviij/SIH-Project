
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    // Simple scale animation for icon
    _controller = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
    )..forward();
    _scaleAnim = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Stack(
        children: [
          // Radial gradient and subtle shapes
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.blue.shade300,
                  Colors.blue.shade900,
                ],
                center: Alignment.topCenter,
                radius: 1.0,
              ),
            ),
          ),
          // Decorative circles
          Positioned(
            top: -80,
            left: -60,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.07),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -30,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Main content
          Center(
            child: ScaleTransition(
              scale: _scaleAnim,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // App Logo/Icon (replace with your asset if available)
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 36, spreadRadius: 1)
                      ],
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade700, Colors.lightBlueAccent.shade200],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: EdgeInsets.all(28),
                    child: Icon(
                      Icons.notifications_active_rounded,
                      size: 82,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 34),
                  Text(
                    'Civic Alert',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      shadows: [
                        Shadow(color: Colors.black45, blurRadius: 10, offset: Offset(0, 2))
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Empowering Citizens',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 5,
                    ),
                  ),
                  Text(
                    'Enhancing Responsiveness',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 5,
                    ),
                  ),
                  SizedBox(height: 38),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent.shade200,
                      foregroundColor: Colors.white,
                      elevation: 10,
                      padding: EdgeInsets.symmetric(horizontal: 38, vertical: 12),
                      shape: StadiumBorder(),
                    ),
                    icon: Icon(Icons.arrow_forward_rounded),
                    label: Text(
                      'Get Started',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
