import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpotiftySearchScreen extends StatelessWidget {
  const SpotiftySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_buildTopBar(), const SizedBox(height: 20)],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTopBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/cicek.png',
            ), // Örnek kullanıcı görseli
            radius: 20,
          ),
          const SizedBox(width: 10),
          Text(
            'Ara',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const Row(
        children: [
          Icon(Icons.mic, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.camera_alt, color: Colors.white),
        ],
      ),
    ],
  );
}
