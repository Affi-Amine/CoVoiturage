import 'package:flutter/material.dart';

class NotificationsBottomSheet extends StatefulWidget {
  const NotificationsBottomSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationsBottomSheetState createState() =>
      _NotificationsBottomSheetState();
}

class _NotificationsBottomSheetState extends State<NotificationsBottomSheet> {
  bool _emailNotifications = true;
  bool _pushNotifications = true;
  bool _quietHours = false;

  TimeOfDay _startQuietHours = const TimeOfDay(hour: 22, minute: 0);
  TimeOfDay _endQuietHours = const TimeOfDay(hour: 7, minute: 0);

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
              'Notifications',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Email Notifications'),
              value: _emailNotifications,
              onChanged: (newValue) {
                setState(() {
                  _emailNotifications = newValue;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Phone Notifications'),
              value: _pushNotifications,
              onChanged: (newValue) {
                setState(() {
                  _pushNotifications = newValue;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Quiet Hours'),
              value: _quietHours,
              onChanged: (newValue) {
                setState(() {
                  _quietHours = newValue;
                });
              },
            ),
            if (_quietHours)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Start Quiet Hours'),
                  InkWell(
                    onTap: () async {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: _startQuietHours,
                      );
                      if (selectedTime != null) {
                        setState(() {
                          _startQuietHours = selectedTime;
                        });
                      }
                    },
                    child: Text(
                      _startQuietHours.format(context),
                      style: const TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('End Quiet Hours'),
                  InkWell(
                    onTap: () async {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: _endQuietHours,
                      );
                      if (selectedTime != null) {
                        setState(() {
                          _endQuietHours = selectedTime;
                        });
                      }
                    },
                    child: Text(
                      _endQuietHours.format(context),
                      style: const TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save notification preferences
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
