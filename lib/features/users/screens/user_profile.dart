import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manage_app/core/models/user_model.dart';
import 'package:user_manage_app/features/users/provider/users_provider.dart';
import 'package:user_manage_app/features/users/screens/user_form.dart';

class UserProfile extends StatelessWidget {
  final UserModel user;

  const UserProfile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 42, 42),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "${user.firstName} ${user.lastName}",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 24, 23, 23),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 50, backgroundImage: NetworkImage(user.avatar)),
            SizedBox(height: 20),
            Text("${user.firstName} ${user.lastName}",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 10),
            Text(user.email,
                style: TextStyle(fontSize: 18, color: Colors.grey[600])),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserFormScreen(user: user),
                      ),
                    );
                  },
                  icon: Icon(Icons.edit, color: Colors.white),
                  label: Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    userProvider.deleteUser(user.id);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.delete, color: Colors.white),
                  label: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
