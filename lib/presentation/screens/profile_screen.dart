import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khsomati/constants/app_colors.dart';
import 'package:khsomati/presentation/widget/text_feild.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // appBar: AppBar(
      //   backgroundColor: AppColors.primary,
      //   elevation: 0,
      //   title: Text("Profile", style: TextStyle(color: Colors.white)),
      //   centerTitle: true,
      // ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // ---------------- HEADER ----------------
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: AppColors.primary),
                ),
                SizedBox(height: 12),
                Text(
                  "Ammar Matarieh",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "ammar@gmail.com",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          // --------------- SECTIONS ----------------
          Text(
            "Account Info",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          ProfileTile(
            icon: CupertinoIcons.person,
            title: "First Name",
            value: "Ammar",
          ),
          ProfileTile(
            icon: CupertinoIcons.person,
            title: "Last Name",
            value: "Matarieh",
          ),
          ProfileTile(
            icon: CupertinoIcons.mail,
            title: "Email",
            value: "ammar@gmail.com",
          ),
          ProfileTile(
            icon: CupertinoIcons.phone,
            title: "Phone",
            value: "+962 7X XXX XXXX",
          ),

          SizedBox(height: 25),

          // Text(
          //   "Settings",
          //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(height: 10),

          // ProfileTile(
          //   icon: CupertinoIcons.lock,
          //   title: "Change Password",
          //   value: "*********",
          // ),
          // ProfileTile(
          //   icon: Icons.language,
          //   title: "Language",
          //   value: "English",
          // ),
          // ProfileTile(
          //   icon: Icons.dark_mode,
          //   title: "Theme",
          //   value: "Light Mode",
          // ),

          // SizedBox(height: 25),

          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.red,
          //     padding: EdgeInsets.symmetric(vertical: 14),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //   ),
          //   onPressed: () {},
          //   child: Text(
          //     "Logout",
          //     style: TextStyle(fontSize: 16, color: Colors.white),
          //   ),
          // ),
        ],
      ),
    );
  }
}

/// -------------------- CUSTOM TILE --------------------
class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 26, color: AppColors.primary),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 3),
                Text(
                  value,
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    title: Text("Update Info"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        CustomTextFormField(
                          prefixIcon: Icon(icon),
                          hintText: "E-mail",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Save",
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.edit, size: 16),
            color: Colors.black38,
          ),
        ],
      ),
    );
  }
}
