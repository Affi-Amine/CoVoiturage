import 'package:covoiturage/screens/profile/help_screen.dart';
import 'package:covoiturage/screens/profile/personal_info_settings.dart';
import 'package:flutter/material.dart';

import '../../constants/widgets/elevated_container_row.dart';
import 'change_pwd_screen.dart';
import 'notifications_sheet.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(224, 51, 224, 1),
              Color.fromRGBO(75, 3, 122, 1),
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
  const ProfileContentCard({super.key});

  @override
  State<ProfileContentCard> createState() => _ProfileContentCardState();
}

class _ProfileContentCardState extends State<ProfileContentCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          color: const Color.fromARGB(255, 228, 225, 225),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'MAYNEWI JEMLA',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileSettingsScreen()),
                    );
                  },
                  child: const ElevatedContainerRow(
                    leadingIcon: Icons.info,
                    label: 'Personal Information',
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                  ),
                ),

                const SizedBox(height: 10),
                ElevatedContainerRow(
                  leadingIcon: Icons.password,
                  label: 'Change Password',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  onTap: () {
                    _showChangePasswordBottomSheet(context);
                  },
                ),
                const SizedBox(height: 10),
                // Settings Row
                ElevatedContainerRow(
                  leadingIcon: Icons.notifications,
                  label: 'Notifications',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  onTap: () {
                    _showNotificationsBottomSheet(context);
                  },
                ),
                const SizedBox(height: 10),

                // Help Row
                ElevatedContainerRow(
                  leadingIcon: Icons.privacy_tip,
                  label: 'Privacy Settings',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  onTap: () {
                    // l backend baba
                  },
                ),
                const SizedBox(height: 10),
                ElevatedContainerRow(
                  leadingIcon: Icons.help,
                  label: 'Help',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HelpScreen(), // Navigate to the HelpScreen
                      ),
                    );
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
                    // l backend baba
                  },
                ),
              ],
            ),
          )),
    );
  }

  void _showChangePasswordBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const ChangePasswordBottomSheet();
      },
    );
  }
}

void _showNotificationsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return const NotificationsBottomSheet();
    },
  );
}
