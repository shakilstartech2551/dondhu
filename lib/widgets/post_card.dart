import 'dart:io';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../models/post_model.dart';
import '../screens/comment_screen.dart';

class PostCard extends StatefulWidget {
  final PostModel post;
  final VoidCallback onDelete;

  const PostCard({
    super.key,
    required this.post,
    required this.onDelete,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  String reaction = "";
  int likeCount = 0;

  void setReaction(String value) {
    setState(() {
      if (reaction.isEmpty) {
        likeCount++;
      }
      reaction = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        "Just now",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SafeArea(
                          child: Wrap(
                            children: [
                              ListTile(
                                leading: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                title: const Text("Delete Post"),
                                onTap: () {
                                  Navigator.pop(context);
                                  widget.onDelete();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// Post Text
            if (widget.post.text.isNotEmpty)
              Text(
                widget.post.text,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),

            if (widget.post.text.isNotEmpty)
              const SizedBox(height: 15),

            /// Image
            if (widget.post.imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(widget.post.imagePath!),
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),

            const SizedBox(height: 15),

            Text(
              "$likeCount Likes",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {
                    setReaction("👍");
                  },
                  onLongPress: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SafeArea(
                          child: Wrap(
                            children: [
                              ListTile(
                                leading: const Text("👍", style: TextStyle(fontSize: 28)),
                                title: const Text("Like"),
                                onTap: () {
                                  Navigator.pop(context);
                                  setReaction("👍");
                                },
                              ),
                              ListTile(
                                leading: const Text("❤️", style: TextStyle(fontSize: 28)),
                                title: const Text("Love"),
                                onTap: () {
                                  Navigator.pop(context);
                                  setReaction("❤️");
                                },
                              ),
                              ListTile(
                                leading: const Text("😂", style: TextStyle(fontSize: 28)),
                                title: const Text("Haha"),
                                onTap: () {
                                  Navigator.pop(context);
                                  setReaction("😂");
                                },
                              ),
                              ListTile(
                                leading: const Text("😮", style: TextStyle(fontSize: 28)),
                                title: const Text("Wow"),
                                onTap: () {
                                  Navigator.pop(context);
                                  setReaction("😮");
                                },
                              ),
                              ListTile(
                                leading: const Text("😢", style: TextStyle(fontSize: 28)),
                                title: const Text("Sad"),
                                onTap: () {
                                  Navigator.pop(context);
                                  setReaction("😢");
                                },
                              ),
                              ListTile(
                                leading: const Text("😡", style: TextStyle(fontSize: 28)),
                                title: const Text("Angry"),
                                onTap: () {
                                  Navigator.pop(context);
                                  setReaction("😡");
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: Text(
                    reaction.isEmpty ? "👍" : reaction,
                    style: const TextStyle(fontSize: 20),
                  ),
                  label: const Text("React"),
                ),

                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CommentScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.comment_outlined),
                  label: const Text("Comment"),
                ),

                TextButton.icon(
                  onPressed: () async {
                    await SharePlus.instance.share(
                      ShareParams(
                        text: widget.post.text,
                      ),
                    );
                  },
                  icon: const Icon(Icons.share_outlined),
                  label: const Text("Share"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}