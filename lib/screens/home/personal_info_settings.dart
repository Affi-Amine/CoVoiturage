import 'package:covoiturage/screens/authentication/BoxTextField.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Settings'),
      ),
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
        child: const ProfileSettingsContentCard(),
      ),
    );
  }
}

class ProfileSettingsContentCard extends StatefulWidget {
  const ProfileSettingsContentCard({super.key});

  @override
  State<ProfileSettingsContentCard> createState() =>
      _ProfileSettingsContentCardState();
}

class _ProfileSettingsContentCardState
    extends State<ProfileSettingsContentCard> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

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
              // const Text(
              //   'Personal Information',
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'MAYNEWI JEMLA',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Change profile picture functionality
                        },
                        child: const Text(
                          'Change Profile Picture',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),

              BoxTextField(
                controller: _nameController,
                hintText: "Name",
                obscureText: false,
                icon: Icons.text_format,
              ),

              // TextFormField(
              //   controller: _nameController,
              //   decoration: const InputDecoration(
              //     labelText: 'Name',
              //   ),
              // ),
              const SizedBox(height: 10),

              BoxTextField(
                controller: _emailController,
                hintText: "Email",
                obscureText: false,
                icon: Icons.email,
              ),

              // TextFormField(
              //   controller: _emailController,
              //   decoration: const InputDecoration(
              //     labelText: 'Email',
              //   ),
              // ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    filled: true,
                    fillColor: Colors.white,
                    floatingLabelStyle: const TextStyle(color: Colors.grey),
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.purple)),
                  ),
                  initialCountryCode: 'TN',
                ),
              ),

              // TextFormField(
              //   controller: _phoneNumberController,
              //   decoration: const InputDecoration(
              //     labelText: 'Phone Number',
              //   ),
              // ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle save changes functionality
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple, // Text color
                ),
                child: const Text('Save Changes'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
