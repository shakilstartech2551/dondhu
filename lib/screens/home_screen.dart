import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../widgets/home_header.dart';
import '../widgets/story_card.dart';
import '../widgets/post_card.dart';
import '../widgets/create_post_box.dart';
import '../models/post_model.dart';
import '../models/story_model.dart';
import 'profile_screen.dart';
import 'friends_screen.dart';
import 'chat_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int _selectedIndex = 0;

List<StoryModel> stories = [
  StoryModel(
    userName: "Shakil",
    imagePath: null,
  ),
  StoryModel(
    userName: "Rahim",
    imagePath: null,
  ),
  StoryModel(
    userName: "Karim",
    imagePath: null,
  ),
];

final ImagePicker picker = ImagePicker();

List<PostModel> posts = [
  PostModel(
    text: "আজকে Dondhu App-এর প্রথম Professional Feed তৈরি করলাম! 🎉💙",
    imagePath: null,
    userName: "Shakil",
    createdAt: DateTime.now(),
  ),
];

void _onItemTapped(int index) {
setState(() {
_selectedIndex = index;
});
}

void addPost(PostModel post) {
  setState(() {
    posts.insert(0, post);
  });
}
Future<void> addStory() async {
  final XFile? image =
  await picker.pickImage(source: ImageSource.gallery);

  if (image == null) return;

  setState(() {
    stories.insert(
      0,
      StoryModel(
        userName: "Shakil",
        imagePath: image.path,
      ),
    );
  });
}

void deletePost(int index) {
  setState(() {
    posts.removeAt(index);
  });
}

Widget _buildHomePage() {
return SafeArea(
child: SingleChildScrollView(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

const HomeHeader(),

  CreatePostBox(
    onPost: addPost,
  ),

  const Padding(
    padding: EdgeInsets.symmetric(horizontal: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Stories",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "See All",
          style: TextStyle(
            color: Color(0xff1877F2),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),

const SizedBox(height: 10),

SizedBox(
height: 195,
child: ListView(
scrollDirection: Axis.horizontal,
padding: const EdgeInsets.symmetric(horizontal: 16),
children: [
  StoryCard(
    name: "Add Story",
    isAddStory: true,
    onTap: addStory,
  ),
  ...stories.map(
        (story) => StoryCard(
      name: story.userName,
      imagePath: story.imagePath,
    ),
  ),
],
),
),

const SizedBox(height: 20),

  const Padding(
    padding: EdgeInsets.symmetric(horizontal: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Latest Posts",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          Icons.tune,
          color: Colors.grey,
        ),
      ],
    ),
  ),

const SizedBox(height: 10),

  ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: posts.length,
    itemBuilder: (context, index) {
      return PostCard(
        post: posts[index],
        onDelete: () {
          deletePost(index);
        },
      );
    },
  ),

const SizedBox(height: 20),
],
),
),
);
}
Widget _buildFriendsPage() {
  return const FriendsScreen();
}

Widget _buildChatPage() {
  return const ChatScreen(
    friendName: "Chat",
  );
}

Widget _buildAlertsPage() {
  return const NotificationScreen();
}

Widget _buildProfilePage() {
  return const ProfileScreen();
}

@override
Widget build(BuildContext context) {
  final List<Widget> pages = [
    _buildHomePage(),
    _buildFriendsPage(),
    _buildChatPage(),
    _buildAlertsPage(),
    _buildProfilePage(),
  ];

  return Scaffold(
    backgroundColor: const Color(0xffF3F5F7),
    body: pages[_selectedIndex],
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xff1877F2),
      unselectedItemColor: Colors.black45,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: "Friends",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Alerts",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    ),
  );
}
}