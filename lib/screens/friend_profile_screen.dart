import 'package:flutter/material.dart';

class FriendProfileScreen extends StatefulWidget {
  final String name;
  final String mutualFriends;
  final bool online;

  const FriendProfileScreen({
    super.key,
    required this.name,
    required this.mutualFriends,
    required this.online,
  });

  @override
  State<FriendProfileScreen> createState() =>
      _FriendProfileScreenState();
}

class _FriendProfileScreenState
    extends State<FriendProfileScreen> {
  bool isFriend = false;

  @override
  Widget build(BuildContext context) {
    final firstLetter =
    widget.name.substring(0, 1).toUpperCase();

    return Scaffold(
      backgroundColor: const Color(0xffF3F5F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        title: Text(
          widget.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 35,
                bottom: 30,
              ),

              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),

              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 65,
                        backgroundColor:
                        const Color(0xff1877F2),

                        child: Text(
                          firstLetter,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      if (widget.online)
                        Positioned(
                          right: 3,
                          bottom: 3,

                          child: Container(
                            width: 20,
                            height: 20,

                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,

                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    widget.online
                        ? "Active now"
                        : "Offline",

                    style: TextStyle(
                      color: widget.online
                          ? Colors.green
                          : Colors.grey,

                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    widget.mutualFriends,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 22),

                  Padding(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),

                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                isFriend = !isFriend;
                              });
                            },

                            icon: Icon(
                              isFriend
                                  ? Icons.check
                                  : Icons.person_add,
                            ),

                            label: Text(
                              isFriend
                                  ? "Friends"
                                  : "Add Friend",
                            ),

                            style:
                            ElevatedButton.styleFrom(
                              backgroundColor:
                              isFriend
                                  ? const Color(
                                0xffE9EDF3,
                              )
                                  : const Color(
                                0xff1877F2,
                              ),

                              foregroundColor:
                              isFriend
                                  ? Colors.black87
                                  : Colors.white,

                              elevation: 0,

                              padding:
                              const EdgeInsets
                                  .symmetric(
                                vertical: 14,
                              ),

                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius
                                    .circular(14),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Opening chat with ${widget.name}",
                                  ),
                                ),
                              );
                            },

                            icon: const Icon(
                              Icons.message,
                            ),

                            label: const Text(
                              "Message",
                            ),

                            style:
                            ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color(
                                0xffE9EDF3,
                              ),

                              foregroundColor:
                              Colors.black87,

                              elevation: 0,

                              padding:
                              const EdgeInsets
                                  .symmetric(
                                vertical: 14,
                              ),

                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius
                                    .circular(14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            Container(
              width: double.infinity,
              margin:
              const EdgeInsets.symmetric(
                horizontal: 15,
              ),

              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(20),
              ),

              child: const Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 15),

                  Row(
                    children: [
                      Icon(
                        Icons.work_outline,
                        color:
                        Color(0xff1877F2),
                      ),

                      SizedBox(width: 12),

                      Text(
                        "Dondhu Community Member",
                      ),
                    ],
                  ),

                  SizedBox(height: 13),

                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color:
                        Color(0xff1877F2),
                      ),

                      SizedBox(width: 12),

                      Text(
                        "Bangladesh",
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            Container(
              width: double.infinity,
              margin:
              const EdgeInsets.symmetric(
                horizontal: 15,
              ),

              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  const Text(
                    "Posts",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "${widget.name} has not shared any posts yet.",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}