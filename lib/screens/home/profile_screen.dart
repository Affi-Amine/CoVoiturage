import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('assets/user.png'),
                ),
                Positioned(
                  top: 100,
                  right: 10,
                  child: IconButton(
                    icon: Icon(Icons.camera),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Bard',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
            child: Text('Edit Profile'),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('My Account'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text('Help Center'),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
