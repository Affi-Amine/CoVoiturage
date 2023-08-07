import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(161, 232, 175, 1),
              Color.fromRGBO(58, 36, 73, 1),
            ],
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
            transform: GradientRotation(130 * 3.1415927 / 180),
          ),
        ),
        child: ProfileContentCard(),

      ),
    );
  }
}


class ProfileContentCard extends StatefulWidget {
  const ProfileContentCard({Key? key}) : super(key: key);

  @override
  State<ProfileContentCard> createState() => _ProfileContentCardState();
}

class _ProfileContentCardState extends State<ProfileContentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: CircleAvatar(
                // Replace this with the user's profile picture
                backgroundImage: AssetImage('assets/images/user_avatar.png'),
              ),
              title: Text(
                // Replace this with the user's name
                'John Doe',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            _buildClickableRow(
              icon: Icons.edit,
              label: 'EDIT PROFILE',
              onClick: () {
                // Edit profile functionality
              },
            ),
            SizedBox(height: 10),
            _buildClickableRow(
              icon: Icons.settings,
              label: 'SETTINGS',
              onClick: () {
                // Settings button functionality
              },
            ),
            SizedBox(height: 10),
            _buildClickableRow(
              icon: Icons.help,
              label: 'HELP',
              onClick: () {
                // Help button functionality
              },
            ),
            SizedBox(height: 10),
            _buildClickableRow(
              icon: Icons.logout,
              label: 'LOGOUT',
              backgroundColor: Colors.red,
              onClick: () {
                // Logout button functionality
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableRow({
    required IconData icon,
    required String label,
    Color? backgroundColor,
    required VoidCallback onClick,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ElevatedButton.icon(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          elevation: 4,
          shadowColor: Colors.black54,
        ),
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

