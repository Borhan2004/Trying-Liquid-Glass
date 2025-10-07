import 'dart:ui';
import 'package:flutter/material.dart';

class GlassIconAppBar extends StatelessWidget {
  const GlassIconAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      extendBodyBehindAppBar: true, // for blur to show behind AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Liquid Glass Icon",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GlassIconButton(icon: Icons.notifications, onPressed: () {}),
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .10),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withValues(alpha: .2)),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              "iOS Style Liquid Glass Icon",

              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const GlassIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .15),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white.withValues(alpha: .2)),
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.white),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
