import 'dart:io';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final String name;
  final bool isAddStory;
  final String? imagePath;
  final VoidCallback? onTap;

  const StoryCard({
    super.key,
    required this.name,
    this.isAddStory = false,
    this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
      width: 100,
      height: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
            backgroundImage:
            imagePath != null ? FileImage(File(imagePath!)) : null,
            child: imagePath == null
                ? Icon(
              isAddStory ? Icons.add : Icons.person,
              color: Colors.white,
              size: 30,
            )
                : null,
          ),
          const SizedBox(height: 12),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
        ),
    );
  }
}