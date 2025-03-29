import 'package:flutter/material.dart';
import 'package:user_manage_app/features/users/screens/user_profile.dart';

class UserCards extends StatelessWidget {
  const UserCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        ListTile(
          leading: CircleAvatar(),
          title: Text(
            "name",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text("surname"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserProfile()));
          },
        ),
      ]),
    );
  }
}
