import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String friendName;

  const ChatScreen({
    super.key,
    required this.friendName,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController =
  TextEditingController();

  final List<String> messages = [];

  void sendMessage() {
    final message = messageController.text.trim();

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

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        title: Row(
          children: [
            CircleAvatar(
              backgroundColor:
              const Color(0xff1877F2),
              child: Text(
                widget.friendName[0]
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
                  widget.friendName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const Text(
                  "Active now",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
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
            child: messages.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment
                    .center,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor:
                    const Color(
                      0xff1877F2,
                    ),
                    child: Text(
                      widget.friendName[0]
                          .toUpperCase(),
                      style:
                      const TextStyle(
                        color:
                        Colors.white,
                        fontSize: 35,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Text(
                    "Start chatting with ${widget.friendName}",
                    style:
                    const TextStyle(
                      fontSize: 17,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )

                : ListView.builder(
              padding:
              const EdgeInsets.all(
                15,
              ),

              itemCount:
              messages.length,

              itemBuilder:
                  (context, index) {
                return Align(
                  alignment:
                  Alignment
                      .centerRight,

                  child: Container(
                    margin:
                    const EdgeInsets
                        .only(
                      bottom: 10,
                    ),

                    padding:
                    const EdgeInsets
                        .symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),

                    decoration:
                    const BoxDecoration(
                      color: Color(
                        0xff1877F2,
                      ),

                      borderRadius:
                      BorderRadius
                          .only(
                        topLeft:
                        Radius.circular(
                          18,
                        ),

                        topRight:
                        Radius.circular(
                          18,
                        ),

                        bottomLeft:
                        Radius.circular(
                          18,
                        ),
                      ),
                    ),

                    child: Text(
                      messages[index],

                      style:
                      const TextStyle(
                        color:
                        Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),

            color: Colors.white,

            child: SafeArea(
              top: false,

              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller:
                      messageController,

                      onSubmitted:
                          (_) =>
                          sendMessage(),

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
                              .circular(
                            25,
                          ),

                          borderSide:
                          BorderSide
                              .none,
                        ),

                        contentPadding:
                        const EdgeInsets
                            .symmetric(
                          horizontal: 18,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 8,
                  ),

                  CircleAvatar(
                    backgroundColor:
                    const Color(
                      0xff1877F2,
                    ),

                    child: IconButton(
                      onPressed:
                      sendMessage,

                      icon:
                      const Icon(
                        Icons.send,
                        color:
                        Colors.white,
                      ),
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