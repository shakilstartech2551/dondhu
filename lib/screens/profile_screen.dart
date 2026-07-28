import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "Shakil Hossain";
  String bio = "Flutter Developer | Dondhu Founder 💙";

  void editProfile() {
    final nameController =
    TextEditingController(text: userName);

    final bioController =
    TextEditingController(text: bio);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom:
            MediaQuery.of(context)
                .viewInsets
                .bottom +
                20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius:
                    BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: nameController,
                  decoration:
                  const InputDecoration(
                    labelText: "Name",
                    prefixIcon:
                    Icon(Icons.person),
                    border:
                    OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: bioController,
                  maxLines: 3,
                  decoration:
                  const InputDecoration(
                    labelText: "Bio",
                    prefixIcon:
                    Icon(Icons.info),
                    border:
                    OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        userName =
                            nameController.text
                                .trim();

                        bio =
                            bioController.text
                                .trim();
                      });

                      Navigator.pop(context);

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Profile updated successfully",
                          ),
                        ),
                      );
                    },

                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(
                        0xff1877F2,
                      ),

                      foregroundColor:
                      Colors.white,

                      padding:
                      const EdgeInsets
                          .symmetric(
                        vertical: 15,
                      ),

                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius
                            .circular(14),
                      ),
                    ),

                    child: const Text(
                      "Save Changes",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget statItem(
      String number,
      String title,
      ) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 20,
            fontWeight:
            FontWeight.bold,
          ),
        ),

        const SizedBox(height: 3),

        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(0xffF3F5F7),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Profile Header
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.only(
                  top: 25,
                  bottom: 25,
                ),

                decoration:
                const BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                  BorderRadius.vertical(
                    bottom:
                    Radius.circular(30),
                  ),
                ),

                child: Column(
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 60,

                          backgroundColor:
                          Color(
                            0xff1877F2,
                          ),

                          child: Icon(
                            Icons.person,
                            size: 70,
                            color:
                            Colors.white,
                          ),
                        ),

                        Positioned(
                          right: 0,
                          bottom: 0,

                          child: Container(
                            width: 38,
                            height: 38,

                            decoration:
                            BoxDecoration(
                              color:
                              const Color(
                                0xff1877F2,
                              ),

                              shape:
                              BoxShape.circle,

                              border:
                              Border.all(
                                color:
                                Colors.white,

                                width: 3,
                              ),
                            ),

                            child:
                            const Icon(
                              Icons.camera_alt,

                              color:
                              Colors.white,

                              size: 19,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    Text(
                      userName,

                      style:
                      const TextStyle(
                        fontSize: 25,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 6,
                    ),

                    Padding(
                      padding:
                      const EdgeInsets
                          .symmetric(
                        horizontal: 25,
                      ),

                      child: Text(
                        bio,

                        textAlign:
                        TextAlign.center,

                        style:
                        const TextStyle(
                          color:
                          Colors.grey,

                          fontSize: 14,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding:
                      const EdgeInsets
                          .symmetric(
                        horizontal: 20,
                      ),

                      child: SizedBox(
                        width:
                        double.infinity,

                        child:
                        ElevatedButton.icon(
                          onPressed:
                          editProfile,

                          icon:
                          const Icon(
                            Icons.edit,
                          ),

                          label:
                          const Text(
                            "Edit Profile",
                          ),

                          style:
                          ElevatedButton
                              .styleFrom(
                            backgroundColor:
                            const Color(
                              0xff1877F2,
                            ),

                            foregroundColor:
                            Colors.white,

                            padding:
                            const EdgeInsets
                                .symmetric(
                              vertical: 14,
                            ),

                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(
                                14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// Profile Statistics
              Container(
                margin:
                const EdgeInsets
                    .symmetric(
                  horizontal: 15,
                ),

                padding:
                const EdgeInsets
                    .symmetric(
                  vertical: 18,
                ),

                decoration:
                BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
                ),

                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceEvenly,

                  children: [
                    statItem(
                      "12",
                      "Posts",
                    ),

                    Container(
                      width: 1,
                      height: 45,
                      color:
                      Colors.grey.shade200,
                    ),

                    statItem(
                      "120",
                      "Friends",
                    ),

                    Container(
                      width: 1,
                      height: 45,
                      color:
                      Colors.grey.shade200,
                    ),

                    statItem(
                      "58",
                      "Followers",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              /// About Section
              Container(
                width: double.infinity,

                margin:
                const EdgeInsets
                    .symmetric(
                  horizontal: 15,
                ),

                padding:
                const EdgeInsets
                    .all(18),

                decoration:
                BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

                  children: [
                    const Text(
                      "About",
                      style:
                      TextStyle(
                        fontSize: 20,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    const Row(
                      children: [
                        Icon(
                          Icons.work_outline,
                          color:
                          Color(
                            0xff1877F2,
                          ),
                        ),

                        SizedBox(
                          width: 12,
                        ),

                        Text(
                          "Flutter Developer",
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 13,
                    ),

                    const Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color:
                          Color(
                            0xff1877F2,
                          ),
                        ),

                        SizedBox(
                          width: 12,
                        ),

                        Text(
                          "Bangladesh",
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 13,
                    ),

                    const Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color:
                          Color(
                            0xff1877F2,
                          ),
                        ),

                        SizedBox(
                          width: 12,
                        ),

                        Text(
                          "Building Dondhu 💙",
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              /// My Posts
              Container(
                width: double.infinity,

                margin:
                const EdgeInsets
                    .symmetric(
                  horizontal: 15,
                ),

                padding:
                const EdgeInsets
                    .all(18),

                decoration:
                BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

                  children: [
                    const Text(
                      "My Posts",
                      style:
                      TextStyle(
                        fontSize: 20,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    Container(
                      width:
                      double.infinity,

                      padding:
                      const EdgeInsets
                          .all(15),

                      decoration:
                      BoxDecoration(
                        color:
                        const Color(
                          0xffF3F5F7,
                        ),

                        borderRadius:
                        BorderRadius
                            .circular(
                          15,
                        ),
                      ),

                      child:
                      const Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                        children: [
                          Text(
                            "আজকে Dondhu App-এর নতুন Profile Design তৈরি করলাম! 🎉💙",
                            style:
                            TextStyle(
                              fontSize:
                              15,
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          Text(
                            "Just now",
                            style:
                            TextStyle(
                              color:
                              Colors
                                  .grey,

                              fontSize:
                              12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}