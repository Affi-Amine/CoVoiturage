import 'package:covoiturage/screens/authentication/BoxTextField.dart';
import 'package:flutter/material.dart';

class ChangePasswordBottomSheet extends StatefulWidget {
  const ChangePasswordBottomSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChangePasswordBottomSheetState createState() =>
      _ChangePasswordBottomSheetState();
}

class _ChangePasswordBottomSheetState extends State<ChangePasswordBottomSheet> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Change Password',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            BoxTextField(
              controller: _currentPasswordController,
              hintText: "Current Password",
              obscureText: false,
              icon: Icons.password,
            ),
            const SizedBox(height: 8),
            BoxTextField(
              controller: _newPasswordController,
              hintText: "New Password",
              obscureText: false,
              icon: Icons.password,
            ),
            const SizedBox(height: 8),
            BoxTextField(
              controller: _confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: false,
              icon: Icons.password,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle password change
                Navigator.pop(context); // Close the bottom sheet
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
              ),
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
