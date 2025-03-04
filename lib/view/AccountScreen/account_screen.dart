import 'package:flutter/material.dart';
import 'package:liquor_brooze_user/utlis/assets/app_colors.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Profile Header
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
            ),
          ),
          SizedBox(height: 10),
          Text(
            "John Doe",
            style: TextStyle(
              fontSize: 18,
              color: AppColor.darkTextColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Monserat',
            ),
          ),
          Text(
            "johndoe@gmail.com",
            style: TextStyle(
              fontSize: 14,
              color: AppColor.darkTextColor,
              fontFamily: 'Monserat',
            ),
          ),
          SizedBox(height: 20),

          // Profile Menu
          _buildProfileOption(Icons.shopping_cart, "My Orders"),
          _buildProfileOption(Icons.favorite, "Wishlist"),
          _buildProfileOption(Icons.location_on, "Addresses"),
          _buildProfileOption(Icons.settings, "Settings"),
          _buildProfileOption(Icons.help, "Help & Support"),

          // Logout Button
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                // Handle Logout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Profile Menu Items
  Widget _buildProfileOption(IconData icon, String title) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColor.lightTextColor,
      child: ListTile(
        leading: Icon(icon, color: AppColor.secondaryColor),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: AppColor.darkTextColor,
            fontWeight: FontWeight.w500,
            fontFamily: 'Monserat',
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
