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
        width: 110,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                    child: imagePath != null
                        ? Image.file(
                      File(imagePath!),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                        : Container(
                      color: const Color(0xffE9EEF7),
                      child: const Center(
                        child: Icon(
                          Icons.person,
                          size: 45,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  if (isAddStory)
                    const Positioned(
                      bottom: 8,
                      right: 8,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Color(0xff1877F2),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}