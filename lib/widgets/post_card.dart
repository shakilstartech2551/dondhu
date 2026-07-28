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

  void removeReaction() {
    setState(() {
      if (reaction.isNotEmpty && likeCount > 0) {
        likeCount--;
      }

      reaction = "";
    });
  }

  void showReactionMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                reactionButton("👍"),
                reactionButton("❤️"),
                reactionButton("😂"),
                reactionButton("😮"),
                reactionButton("😢"),
                reactionButton("😡"),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget reactionButton(String emoji) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        setReaction(emoji);
      },
      child: Text(
        emoji,
        style: const TextStyle(
          fontSize: 32,
        ),
      ),
    );
  }

  void openFullScreenImage() {
    if (widget.post.imagePath == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              title: const Text("Photo"),
            ),
            body: Center(
              child: InteractiveViewer(
                minScale: 0.8,
                maxScale: 4,
                child: Image.file(
                  File(widget.post.imagePath!),
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void showPostMenu() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.bookmark_border,
                ),
                title: const Text("Save Post"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                title: const Text(
                  "Delete Post",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// পোস্টের উপরের অংশ
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: const Color(0xff1877F2),
                  child: Text(
                    widget.post.userName
                        .substring(0, 1)
                        .toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(width: 11),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.post.userName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(width: 5),

                          const Icon(
                            Icons.verified,
                            color: Color(0xff1877F2),
                            size: 17,
                          ),
                        ],
                      ),

                      const SizedBox(height: 2),

                      const Row(
                        children: [
                          Text(
                            "Just now",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),

                          SizedBox(width: 4),

                          Icon(
                            Icons.public,
                            size: 13,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: showPostMenu,
                  icon: const Icon(
                    Icons.more_horiz,
                  ),
                ),
              ],
            ),

            if (widget.post.text.isNotEmpty) ...[
              const SizedBox(height: 16),

              Text(
                widget.post.text,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.45,
                ),
              ),
            ],

            if (widget.post.imagePath != null) ...[
              const SizedBox(height: 16),

              GestureDetector(
                onTap: openFullScreenImage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 460,
                    ),
                    child: Image.file(
                      File(widget.post.imagePath!),
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],

            const SizedBox(height: 15),

            /// Like ও Comment সংখ্যা
            Row(
              children: [
                if (likeCount > 0)
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Color(0xff1877F2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.thumb_up,
                      size: 13,
                      color: Colors.white,
                    ),
                  ),

                if (likeCount > 0)
                  const SizedBox(width: 6),

                Text(
                  likeCount == 0
                      ? "Be the first to react"
                      : "$likeCount reactions",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),

                const Spacer(),

                const Text(
                  "0 Comments",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Divider(
                height: 1,
              ),
            ),

            /// নিচের Button
            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      if (reaction.isEmpty) {
                        setReaction("👍");
                      } else {
                        removeReaction();
                      }
                    },
                    onLongPress: showReactionMenu,
                    icon: Text(
                      reaction.isEmpty
                          ? "👍"
                          : reaction,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    label: Text(
                      reaction.isEmpty
                          ? "Like"
                          : "Reacted",
                      style: TextStyle(
                        color: reaction.isEmpty
                            ? Colors.grey.shade700
                            : const Color(
                          0xff1877F2,
                        ),
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const CommentScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.comment_outlined,
                    ),
                    label: const Text(
                      "Comment",
                      style: TextStyle(
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: TextButton.icon(
                    onPressed: () async {
                      await SharePlus.instance.share(
                        ShareParams(
                          text: widget.post.text,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.share_outlined,
                    ),
                    label: const Text(
                      "Share",
                      style: TextStyle(
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
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