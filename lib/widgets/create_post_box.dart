import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/post_model.dart';

class CreatePostBox extends StatefulWidget {
  final Function(PostModel) onPost;

  const CreatePostBox({
    super.key,
    required this.onPost,
  });

  @override
  State<CreatePostBox> createState() => _CreatePostBoxState();
}

class _CreatePostBoxState extends State<CreatePostBox> {
  final TextEditingController _controller = TextEditingController();

  final ImagePicker picker = ImagePicker();

  File? selectedImage;

  Future<void> pickImage() async {
    final XFile? image =
    await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  void createPost() {
    if (_controller.text.trim().isEmpty && selectedImage == null) return;

    widget.onPost(
      PostModel(
        text: _controller.text.trim(),
        imagePath: selectedImage?.path,
        userName: "Shakil",
        createdAt: DateTime.now(),
      ),
    );

    setState(() {
      _controller.clear();
      selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "What's on your mind?",
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            if (selectedImage != null) ...[
              const SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  selectedImage!,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],

            const SizedBox(height: 15),

            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: pickImage,
                  icon: const Icon(Icons.photo, color: Colors.green),
                  label: const Text("Photo"),
                ),

                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.videocam, color: Colors.red),
                  label: const Text("Video"),
                ),

                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.emoji_emotions, color: Colors.orange),
                  label: const Text("Feeling"),
                ),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1877F2),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: createPost,
                  icon: const Icon(Icons.send),
                  label: const Text("Post"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}