import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName = 'Kaviraj M'; // Use your name
  final String userEmail = 'kavirajm@example.com'; // Example email

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.account_circle, size: 30, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Picture Section
            Center(
              child: GestureDetector(
                onTap: () {
                  // Implement logic for selecting a new profile image (if required)
                },
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/profile_image.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 20),

            // User Information
            Center(
              child: Column(
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    userEmail,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),

            // Edit Profile Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle edit profile action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Background color
                  foregroundColor: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Settings Section
            Divider(),
            SizedBox(height: 10),
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.black),
              title: Text('Notifications'),
              onTap: () {
                // Navigate to notifications settings
              },
            ),
            ListTile(
              leading: Icon(Icons.security, color: Colors.black),
              title: Text('Privacy Settings'),
              onTap: () {
                // Navigate to privacy settings
              },
            ),
            ListTile(
              leading: Icon(Icons.language, color: Colors.black),
              title: Text('Language'),
              onTap: () {
                // Navigate to language settings
              },
            ),
            Divider(),
            SizedBox(height: 10),

            // Logout Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle logout functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Background color
                  foregroundColor: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
