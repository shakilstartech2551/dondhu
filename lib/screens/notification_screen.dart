import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() =>
      _NotificationScreenState();
}

class _NotificationScreenState
    extends State<NotificationScreen> {
  bool showOnlyUnread = false;

  final List<Map<String, dynamic>> notifications = [
    {
      "name": "Rahim",
      "message": "liked your post.",
      "time": "2 minutes ago",
      "icon": Icons.thumb_up,
      "color": Colors.blue,
      "read": false,
    },
    {
      "name": "Karim",
      "message": "commented on your post.",
      "time": "10 minutes ago",
      "icon": Icons.comment,
      "color": Colors.green,
      "read": false,
    },
    {
      "name": "Sakib",
      "message": "sent you a friend request.",
      "time": "30 minutes ago",
      "icon": Icons.person_add,
      "color": Colors.orange,
      "read": false,
    },
    {
      "name": "Rafi",
      "message": "shared your post.",
      "time": "1 hour ago",
      "icon": Icons.share,
      "color": Colors.purple,
      "read": true,
    },
    {
      "name": "Hasan",
      "message": "mentioned you in a comment.",
      "time": "Yesterday",
      "icon": Icons.alternate_email,
      "color": Colors.red,
      "read": true,
    },
    {
      "name": "Mim",
      "message": "started following you.",
      "time": "Yesterday",
      "icon": Icons.person,
      "color": Colors.teal,
      "read": true,
    },
  ];

  void markAllAsRead() {
    setState(() {
      for (final notification in notifications) {
        notification["read"] = true;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "All notifications marked as read",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final visibleNotifications =
    showOnlyUnread
        ? notifications
        .where(
          (notification) =>
      notification["read"] == false,
    )
        .toList()
        : notifications;

    final unreadCount = notifications
        .where(
          (notification) =>
      notification["read"] == false,
    )
        .length;

    return Scaffold(
      backgroundColor: const Color(0xffF3F5F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: markAllAsRead,
            icon: const Icon(
              Icons.done_all,
              color: Color(0xff1877F2),
            ),
            tooltip: "Mark all as read",
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              12,
              16,
              10,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(
                      0xff1877F2,
                    ),
                    borderRadius:
                    BorderRadius.circular(20),
                  ),
                  child: Text(
                    "$unreadCount new",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),

                const Spacer(),

                TextButton(
                  onPressed: () {
                    setState(() {
                      showOnlyUnread =
                      !showOnlyUnread;
                    });
                  },
                  child: Text(
                    showOnlyUnread
                        ? "Show all"
                        : "Unread only",
                    style: const TextStyle(
                      color: Color(
                        0xff1877F2,
                      ),
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: visibleNotifications.isEmpty
                ? const Center(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment
                    .center,
                children: [
                  Icon(
                    Icons
                        .notifications_none,
                    size: 75,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 15),

                  Text(
                    "No new notifications",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding:
              const EdgeInsets.only(
                left: 14,
                right: 14,
                bottom: 20,
              ),

              itemCount:
              visibleNotifications
                  .length,

              itemBuilder:
                  (context, index) {
                final notification =
                visibleNotifications[
                index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      notification[
                      "read"] = true;
                    });
                  },

                  child: Container(
                    margin:
                    const EdgeInsets
                        .only(
                      bottom: 10,
                    ),

                    padding:
                    const EdgeInsets
                        .all(13),

                    decoration:
                    BoxDecoration(
                      color: notification[
                      "read"]
                          ? Colors.white
                          : const Color(
                        0xffEAF3FF,
                      ),

                      borderRadius:
                      BorderRadius
                          .circular(
                        18,
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors
                              .black
                              .withValues(
                            alpha: 0.04,
                          ),

                          blurRadius: 8,

                          offset:
                          const Offset(
                            0,
                            3,
                          ),
                        ),
                      ],
                    ),

                    child: Row(
                      children: [
                        Stack(
                          clipBehavior:
                          Clip.none,

                          children: [
                            CircleAvatar(
                              radius: 28,

                              backgroundColor:
                              const Color(
                                0xff1877F2,
                              ),

                              child: Text(
                                notification[
                                "name"]
                                    .substring(
                                  0,
                                  1,
                                )
                                    .toUpperCase(),

                                style:
                                const TextStyle(
                                  color:
                                  Colors
                                      .white,

                                  fontSize:
                                  21,

                                  fontWeight:
                                  FontWeight
                                      .bold,
                                ),
                              ),
                            ),

                            Positioned(
                              right: -3,
                              bottom: -3,

                              child:
                              Container(
                                width: 25,
                                height: 25,

                                decoration:
                                BoxDecoration(
                                  color:
                                  notification[
                                  "color"],

                                  shape:
                                  BoxShape
                                      .circle,

                                  border:
                                  Border.all(
                                    color:
                                    Colors
                                        .white,

                                    width: 2,
                                  ),
                                ),

                                child:
                                Icon(
                                  notification[
                                  "icon"],

                                  color:
                                  Colors
                                      .white,

                                  size: 14,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          width: 14,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                            children: [
                              RichText(
                                text:
                                TextSpan(
                                  style:
                                  const TextStyle(
                                    color:
                                    Colors
                                        .black,

                                    fontSize:
                                    15,
                                  ),

                                  children: [
                                    TextSpan(
                                      text:
                                      notification[
                                      "name"],

                                      style:
                                      const TextStyle(
                                        fontWeight:
                                        FontWeight
                                            .bold,
                                      ),
                                    ),

                                    TextSpan(
                                      text:
                                      " ${notification["message"]}",
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                height: 6,
                              ),

                              Text(
                                notification[
                                "time"],

                                style:
                                TextStyle(
                                  color:
                                  notification[
                                  "read"]
                                      ? Colors
                                      .grey
                                      : const Color(
                                    0xff1877F2,
                                  ),

                                  fontSize:
                                  12,

                                  fontWeight:
                                  notification[
                                  "read"]
                                      ? FontWeight
                                      .normal
                                      : FontWeight
                                      .bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        if (notification[
                        "read"] ==
                            false)
                          const Padding(
                            padding:
                            EdgeInsets
                                .only(
                              left: 8,
                            ),

                            child:
                            CircleAvatar(
                              radius: 5,

                              backgroundColor:
                              Color(
                                0xff1877F2,
                              ),
                            ),
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