import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String searchText = "";

  final List<Map<String, dynamic>> chats = [
    {
      "name": "Rahim",
      "message": "কেমন আছো বন্ধু?",
      "time": "10:30 AM",
      "online": true,
      "unread": 2,
    },
    {
      "name": "Karim",
      "message": "আজকে দেখা হবে?",
      "time": "9:45 AM",
      "online": false,
      "unread": 0,
    },
    {
      "name": "Sakib",
      "message": "Dondhu App দেখতে অনেক সুন্দর! 🔥",
      "time": "Yesterday",
      "online": true,
      "unread": 1,
    },
    {
      "name": "Rafi",
      "message": "ঠিক আছে, পরে কথা হবে।",
      "time": "Yesterday",
      "online": false,
      "unread": 0,
    },
    {
      "name": "Hasan",
      "message": "নতুন Post দেখেছো?",
      "time": "Monday",
      "online": true,
      "unread": 3,
    },
  ];

  void openChat(Map<String, dynamic> chat) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChatDetailsScreen(
          name: chat["name"],
          online: chat["online"],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredChats = chats.where((chat) {
      return chat["name"]
          .toString()
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xffF3F5F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Chats",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(
              right: 15,
              top: 8,
              bottom: 8,
            ),
            decoration: const BoxDecoration(
              color: Color(0xffF0F2F5),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search chats...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
                bottom: 20,
              ),
              itemCount: filteredChats.length,
              itemBuilder: (context, index) {
                final chat = filteredChats[index];

                return GestureDetector(
                  onTap: () {
                    openChat(chat);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: 0.05,
                          ),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor:
                              const Color(0xff1877F2),
                              child: Text(
                                chat["name"]
                                    .substring(0, 1)
                                    .toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            if (chat["online"])
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),

                        const SizedBox(width: 13),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                chat["name"],
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                chat["message"],
                                maxLines: 1,
                                overflow:
                                TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),

                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            Text(
                              chat["time"],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            ),

                            const SizedBox(height: 8),

                            if (chat["unread"] > 0)
                              Container(
                                width: 21,
                                height: 21,
                                alignment:
                                Alignment.center,
                                decoration:
                                const BoxDecoration(
                                  color:
                                  Color(0xff1877F2),
                                  shape:
                                  BoxShape.circle,
                                ),
                                child: Text(
                                  "${chat["unread"]}",
                                  style:
                                  const TextStyle(
                                    color:
                                    Colors.white,
                                    fontSize: 11,
                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatDetailsScreen extends StatefulWidget {
  final String name;
  final bool online;

  const ChatDetailsScreen({
    super.key,
    required this.name,
    required this.online,
  });

  @override
  State<ChatDetailsScreen> createState() =>
      _ChatDetailsScreenState();
}

class _ChatDetailsScreenState
    extends State<ChatDetailsScreen> {
  final TextEditingController messageController =
  TextEditingController();

  final List<String> messages = [
    "হ্যালো 👋",
    "কেমন আছো বন্ধু?",
    "আমি ভালো আছি 😊",
    "তুমি কেমন আছো?",
    "আমিও ভালো আছি 😄",
    "আজকে Dondhu App-এর কাজ করছো?",
    "হ্যাঁ, আজকে Chat Screen বানাচ্ছি 🔥",
    "দারুণ! App দেখতে অনেক সুন্দর হচ্ছে 💙",
    "ধন্যবাদ বন্ধু 😄",
  ];

  void sendMessage() {
    final message =
    messageController.text.trim();

    if (message.isEmpty) return;

    setState(() {
      messages.add(message);
    });

    messageController.clear();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor:
              const Color(0xff1877F2),
              child: Text(
                widget.name
                    .substring(0, 1)
                    .toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 10),

            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                Text(
                  widget.online
                      ? "Active now"
                      : "Offline",
                  style: TextStyle(
                    color: widget.online
                        ? Colors.green
                        : Colors.grey,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final isMe =
                    index % 2 == 1;

                return Align(
                  alignment: isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 11,
                    ),
                    decoration: BoxDecoration(
                      color: isMe
                          ? const Color(
                        0xff1877F2,
                      )
                          : Colors.white,
                      borderRadius:
                      BorderRadius.circular(18),
                    ),
                    child: Text(
                      messages[index],
                      style: TextStyle(
                        color: isMe
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle,
                      color:
                      Color(0xff1877F2),
                    ),
                  ),

                  Expanded(
                    child: TextField(
                      controller:
                      messageController,
                      onSubmitted: (_) {
                        sendMessage();
                      },
                      decoration:
                      InputDecoration(
                        hintText:
                        "Write a message...",
                        filled: true,
                        fillColor:
                        const Color(
                          0xffF0F2F5,
                        ),
                        border:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius
                              .circular(25),
                          borderSide:
                          BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: sendMessage,
                    icon: const Icon(
                      Icons.send,
                      color:
                      Color(0xff1877F2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}