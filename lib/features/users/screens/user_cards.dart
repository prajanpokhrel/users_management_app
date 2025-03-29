import 'package:flutter/material.dart';
import 'package:user_manage_app/core/models/user_model.dart';
import 'package:user_manage_app/features/users/screens/user_profile.dart';

class UserCards extends StatelessWidget {
  final UserModel user;
  const UserCards({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.avatar),
          ),
          title: Text(
            "  ${user.firstName} ${user.lastName}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            user.email,
            style: TextStyle(color: const Color.fromARGB(255, 202, 200, 200)),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserProfile()));
          },
        ),
      ]),
    );
  }
}
