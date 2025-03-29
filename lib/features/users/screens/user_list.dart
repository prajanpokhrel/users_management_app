import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manage_app/features/users/provider/users_provider.dart';
import 'package:user_manage_app/features/users/screens/user_cards.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<UsersProvider>(context, listen: false).loadUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 23, 23),
        title: Center(
          child: Text(
            "User List",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 43, 42, 42),
      body: Consumer<UsersProvider>(
        builder: (BuildContext context, UserListProvider, child) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  UserListProvider.searchUser(value);
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
              child: UserListProvider.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : UserListProvider.users.isEmpty
                      ? Center(child: Text("No users found"))
                      : ListView.builder(
                          itemCount: UserListProvider.users.length,
                          itemBuilder: (context, index) {
                            return UserCards(
                                user: UserListProvider.users[index]);
                          }),
            )
          ],
        ),
      ),
    );
  }
}
