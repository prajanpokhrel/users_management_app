import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:user_manage_app/core/models/user_model.dart';
import 'package:user_manage_app/features/users/provider/users_provider.dart';

class UserFormScreen extends StatefulWidget {
  final UserModel? user;

  const UserFormScreen({Key? key, this.user}) : super(key: key);

  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _firstNameController.text = widget.user!.firstName;
      _lastNameController.text = widget.user!.lastName;
      _emailController.text = widget.user!.email;
    }
  }

  void _saveUser() {
    if (_formKey.currentState!.validate()) {
      final userProvider = Provider.of<UsersProvider>(context, listen: false);
      final newUser = UserModel(
        id: widget.user?.id ?? DateTime.now().millisecondsSinceEpoch,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        avatar: "https://via.placeholder.com/150",
      );

      if (widget.user == null) {
        userProvider.addUsers(newUser);
      } else {
        userProvider.updateUsers(widget.user!.id, newUser);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 42, 42),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 24, 23, 23),
          title: Text(
            widget.user == null ? "Add User" : "Edit User",
            style: TextStyle(color: Colors.white),
          )),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                textInputAction: TextInputAction.next,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 78, 76, 76),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 87, 86, 86)),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    hintText: "Enter a first name",
                    hintStyle: TextStyle(color: Colors.white)),
                validator: (value) =>
                    value!.isEmpty ? "Enter first name" : null,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _lastNameController,
                textInputAction: TextInputAction.next,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 78, 76, 76),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 87, 86, 86)),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    hintText: "Enter a last name",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 14)),
                validator: (value) => value!.isEmpty ? "Enter last name" : null,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailController,
                textInputAction: TextInputAction.next,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 78, 76, 76),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 87, 86, 86)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: " Enter a email",
                  hintStyle: TextStyle(color: Colors.white),
                ),
                validator: (value) =>
                    value!.contains("@") ? null : "Enter valid email",
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: _saveUser,
                child: Text(
                  widget.user == null ? "Add User" : "Update User",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
