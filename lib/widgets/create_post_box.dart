import 'package:flutter/material.dart';
import 'dart:io';
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
  File? selectedImage;

  final ImagePicker picker = ImagePicker();

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
    if (_controller.text.trim().isEmpty && selectedImage == null) {
      return;
    }

    final post = PostModel(
      text: _controller.text.trim(),
      imagePath: selectedImage?.path,
      userName: "Shakil",
      createdAt: DateTime.now(),
    );

    widget.onPost(post);

    setState(() {
      _controller.clear();
      selectedImage = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "What's on your mind?",
                border: InputBorder.none,
              ),
            ),
            if (selectedImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  selectedImage!,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            const SizedBox(height: 10),


    Row(
    children: [
    Expanded(
    child: OutlinedButton.icon(
    onPressed: pickImage,
    icon: const Icon(Icons.photo),
    label: const Text("Gallery"),
    ),
    ),

    const SizedBox(width: 10),

    Expanded(
    child: ElevatedButton.icon(
    onPressed: createPost,
    icon: const Icon(Icons.send),
    label: const Text("POST"),
    ),
    ),
    ],
            ),
          ],
        ),
      ),
    );
  }
}
