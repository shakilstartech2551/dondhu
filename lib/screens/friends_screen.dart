import 'package:flutter/material.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  final TextEditingController _searchController =
  TextEditingController();

  String searchText = "";

  final List<Map<String, dynamic>> friends = [
    {
      "name": "Rahim",
      "mutual": "12 mutual friends",
      "online": true,
      "added": false,
    },
    {
      "name": "Karim",
      "mutual": "8 mutual friends",
      "online": false,
      "added": false,
    },
    {
      "name": "Sakib",
      "mutual": "20 mutual friends",
      "online": true,
      "added": false,
    },
    {
      "name": "Rafi",
      "mutual": "5 mutual friends",
      "online": false,
      "added": false,
    },
    {
      "name": "Hasan",
      "mutual": "15 mutual friends",
      "online": true,
      "added": false,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredFriends = friends.where((friend) {
      return friend["name"]
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
          "Friends",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
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
                Icons.person_add_alt_1,
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
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search friends...",
                prefixIcon: const Icon(
                  Icons.search,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 5,
            ),
            child: Row(
              children: [
                const Text(
                  "People you may know",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                Text(
                  "${filteredFriends.length} people",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              itemCount: filteredFriends.length,
              itemBuilder: (context, index) {
                final friend = filteredFriends[index];

                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 7,
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withValues(alpha: 0.05),
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
                            radius: 29,
                            backgroundColor:
                            const Color(
                              0xff1877F2,
                            ),
                            child: Text(
                              friend["name"]
                                  .substring(0, 1)
                                  .toUpperCase(),
                              style:
                              const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ),

                          if (friend["online"])
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration:
                                BoxDecoration(
                                  color: Colors.green,
                                  shape:
                                  BoxShape.circle,
                                  border:
                                  Border.all(
                                    color:
                                    Colors.white,
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
                          CrossAxisAlignment
                              .start,
                          children: [
                            Text(
                              friend["name"],
                              style:
                              const TextStyle(
                                fontSize: 17,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            const SizedBox(
                              height: 4,
                            ),

                            Text(
                              friend["mutual"],
                              style:
                              const TextStyle(
                                color:
                                Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            friend["added"] =
                            !friend["added"];
                          });
                        },
                        style:
                        ElevatedButton
                            .styleFrom(
                          backgroundColor:
                          friend["added"]
                              ? const Color(
                            0xffE9EDF3,
                          )
                              : const Color(
                            0xff1877F2,
                          ),
                          foregroundColor:
                          friend["added"]
                              ? Colors.black87
                              : Colors.white,
                          elevation: 0,
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .circular(12),
                          ),
                        ),
                        child: Text(
                          friend["added"]
                              ? "Added"
                              : "Add",
                        ),
                      ),
                    ],
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