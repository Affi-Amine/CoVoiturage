import 'package:flutter/material.dart';

import '../../constants/widgets/elevated_container_row.dart';

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
  const ProfileContentCard({super.key});

  @override
  State<ProfileContentCard> createState() => _ProfileContentCardState();
}

class _ProfileContentCardState extends State<ProfileContentCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
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
                  height: 50,
                ),
                ElevatedContainerRow(
                  leadingIcon: Icons.edit,
                  label: 'EDIT PROFILE',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  onTap: () {
                    // l backend baba
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
                    // l backend baba
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
                    // l backend baba
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
}
