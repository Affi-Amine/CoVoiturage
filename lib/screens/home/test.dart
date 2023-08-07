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
            // Profile Picture and Name Row
            Row(
              children: [
                CircleAvatar(
                  // Replace this with the user's profile picture
                  backgroundImage: AssetImage('assets/profile_picture.png'),
                  radius: 40,
                ),
                const SizedBox(width: 20),
                Text(
                  'John Doe', // Replace this with the user's name
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Edit Profile Row
            ElevatedContainerRow(
              leadingIcon: Icons.edit,
              label: 'EDIT PROFILE',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              onTap: () {
                // Edit Profile functionality
              },
            ),
            const SizedBox(height: 10),

            // Settings Row
            ElevatedContainerRow(
              leadingIcon: Icons.settings,
              label: 'SETTINGS',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              onTap: () {
                // Settings functionality
              },
            ),
            const SizedBox(height: 10),

            // Help Row
            ElevatedContainerRow(
              leadingIcon: Icons.help,
              label: 'HELP',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              onTap: () {
                // Help functionality
              },
            ),
            const SizedBox(height: 10),

            // Logout Row
            ElevatedContainerRow(
              leadingIcon: Icons.logout,
              label: 'LOGOUT',
              backgroundColor: Colors.red,
              textColor: Colors.white,
              onTap: () {
                // Logout functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ElevatedContainerRow extends StatelessWidget {
  final IconData leadingIcon;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;

  const ElevatedContainerRow({
    required this.leadingIcon,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          children: [
            Icon(
              leadingIcon,
              color: textColor,
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
