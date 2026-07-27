import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(18, 50, 18, 15),
      child: Row(
        children: [
          Image.asset(
            "assets/images/logo.png",
            width: 42,
            height: 42,
          ),

          const SizedBox(width: 10),

          const Text(
            "Dondhu",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xff1877F2),
              letterSpacing: .5,
            ),
          ),

          const Spacer(),

          _circleButton(Icons.search),

          const SizedBox(width: 10),

          _circleButton(Icons.chat_bubble_outline),
        ],
      ),
    );
  }

  Widget _circleButton(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xffF1F2F6),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        icon,
        size: 22,
        color: Colors.black87,
      ),
    );
  }
}