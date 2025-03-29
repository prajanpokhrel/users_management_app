import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manage_app/features/users/provider/users_provider.dart';
import 'package:user_manage_app/features/users/screens/user_cards.dart';
import 'package:user_manage_app/features/users/screens/user_form.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 24, 23, 23),
          title: Center(
            child: Text(
              "User List",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserFormScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Consumer<UsersProvider>(
              builder: (BuildContext context, UserListProvider, child) =>
                  Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8, right: 8, bottom: 14),
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
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.white54),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 43, 42, 42),
      body: Consumer<UsersProvider>(
        builder: (BuildContext context, UserListProvider, child) => Column(
          children: [
            Expanded(
              child: UserListProvider.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : UserListProvider.users.isEmpty
                      ? Center(
                          child: Text(
                          "No users found",
                          style: TextStyle(color: Colors.white),
                        ))
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
