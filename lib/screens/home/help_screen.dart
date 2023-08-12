import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FAQItem {
  final String question;
  final String answer;

  FAQItem(this.question, this.answer);
}

final List<FAQItem> faqList = [
  FAQItem('How does the carpooling app work?',
      'The app links drivers heading in the same direction with passengers needing rides, enabling shared travel by booking available seats.'),
  FAQItem('How can I find or offer a ride?',
      'Passengers can find rides by entering destinations and browsing driver listings. Drivers can create listings with departure, destination, and timing preferences.'),
  // ... Add more FAQ items
];

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSectionCard(
                icon: Icons.question_answer,
                title: 'FAQ',
                child: _buildFAQSection(),
              ),
              const SizedBox(height: 20),
              _buildSectionCard(
                icon: Icons.support_agent,
                title: 'Contact Support',
                child: _buildContactSupportSection(),
              ),
              const SizedBox(height: 20),
              _buildSectionCard(
                icon: Icons.report_problem,
                title: 'Report Issues',
                child: _buildReportIssuesSection(),
              ),
              const SizedBox(height: 20),
              _buildSectionCard(
                icon: Icons.safety_check,
                title: 'Safety Guidelines',
                child: _buildSafetyGuidelinesSection(),
              ),
              const SizedBox(height: 20),
              _buildSectionCard(
                icon: Icons.local_hospital,
                title: 'Emergency Help',
                child: _buildEmergencyHelpSection(),
              ),
              const SizedBox(height: 20),
              _buildSectionCard(
                icon: Icons.feedback,
                title: 'Feedback and Suggestions',
                child: _buildFeedbackSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(
      {IconData? icon, required String title, required Widget child}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

Widget _buildFAQSection() {
  return CarouselSlider(
    options: CarouselOptions(
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      enlargeCenterPage: true,
      autoPlay: true,
    ),
    items: faqList.map((faqItem) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              faqItem.question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),  // Adjust this spacing
            Flexible(
              child: Text(
                faqItem.answer,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}


  Widget _buildContactSupportSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Support',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'If you need further assistance, please feel free to contact our support team:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.email, color: Colors.grey),
              SizedBox(width: 10),
              Text(
                'support@example.com',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.phone, color: Colors.grey),
              SizedBox(width: 10),
              Text(
                '+1 (123) 456-7890',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReportIssuesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Report Issues',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'If you encounter any issues or problems with the app, please report them to us:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Implement your report issues functionality here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text(
              'REPORT ISSUES',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyGuidelinesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Safety Guidelines',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'To ensure a safe experience for all users, please adhere to the following safety guidelines:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.check, color: Colors.green),
            title: Text('Always wear seat belts while traveling.'),
          ),
          ListTile(
            leading: Icon(Icons.check, color: Colors.green),
            title: Text('Don\'t share personal information with strangers.'),
          ),
          ListTile(
            leading: Icon(Icons.check, color: Colors.green),
            title: Text('Report any suspicious behavior to authorities.'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyHelpSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Emergency Help',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'In case of emergencies or urgent situations while using our app, here\'s what you should do:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.blue),
            title: Text('Call 911 or your local emergency number immediately.'),
          ),
          ListTile(
            leading: Icon(Icons.message, color: Colors.blue),
            title: Text(
                'Contact the driver or passenger for assistance if safe to do so.'),
          ),
          ListTile(
            leading: Icon(Icons.report_problem, color: Colors.blue),
            title: Text('Report the incident to our support team via the app.'),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Feedback and Suggestions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'We value your feedback and suggestions to improve our app. Feel free to share your thoughts with us:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.email, color: Colors.blue),
            title: Text('Send us an email at feedback@carpoolapp.com'),
          ),
          ListTile(
            leading: Icon(Icons.message, color: Colors.blue),
            title: Text(
                'Use the in-app feedback form to provide detailed feedback.'),
          ),
          ListTile(
            leading: Icon(Icons.star, color: Colors.blue),
            title: Text(
                'If you enjoy using our app, leave a review on the app store.'),
          ),
        ],
      ),
    );
  }
}
