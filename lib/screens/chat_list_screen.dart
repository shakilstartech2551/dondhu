import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  String searchText = "";

  final List<Map<String, dynamic>> chats = [
    {
      "name": "Rahim",
      "message": "Kemon acho? 👋",
      "time": "10:30 AM",
      "online": true,
      "unread": 2,
    },
    {
      "name": "Karim",
      "message": "Dondhu App-er kaj kemon cholche?",
      "time": "9:45 AM",
      "online": false,
      "unread": 0,
    },
    {
      "name": "Sakib",
      "message": "Ajke dekha hobe? 😊",
      "time": "Yesterday",
      "online": true,
      "unread": 1,
    },
    {
      "name": "Rafi",
      "message": "Thanks bhai 💙",
      "time": "Yesterday",
      "online": false,
      "unread": 0,
    },
    {
      "name": "Hasan",
      "message": "New update ta dekhecho?",
      "time": "Monday",
      "online": true,
      "unread": 3,
    },
  ];

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
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit_outlined,
              color: Colors.black,
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
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 20,
              ),
              itemCount: filteredChats.length,
              itemBuilder: (context, index) {
                final chat = filteredChats[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(18),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          friendName: chat["name"],
                        ),
                      ),
                    );
                  },

                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 8,
                    ),
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 29,
                              backgroundColor:
                              const Color(0xff1877F2),

                              child: Text(
                                chat["name"]
                                    .substring(0, 1)
                                    .toUpperCase(),

                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            if (chat["online"])
                              Positioned(
                                right: 0,
                                bottom: 0,

                                child: Container(
                                  width: 15,
                                  height: 15,

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
                                  fontWeight: FontWeight.bold,
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
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 10),

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
                                width: 22,
                                height: 22,

                                decoration: const BoxDecoration(
                                  color: Color(0xff1877F2),
                                  shape: BoxShape.circle,
                                ),

                                alignment: Alignment.center,

                                child: Text(
                                  chat["unread"].toString(),

                                  style: const TextStyle(
                                    color: Colors.white,
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