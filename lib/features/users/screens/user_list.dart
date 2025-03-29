import 'package:flutter/material.dart';
import 'package:user_manage_app/features/users/screens/user_cards.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 23, 23),
        title: Center(
          child: Text(
            "UserList",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 43, 42, 42),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                // userProvider.searchUser(value);
              },
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Color.fromARGB(213, 12, 12, 12),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.white54),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return UserCards();
                }),
          )
        ],
      ),
    );
  }
}
