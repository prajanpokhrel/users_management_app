import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manage_app/app/app.dart';
import 'package:user_manage_app/features/users/provider/users_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UsersProvider()),
  ], child: MyApp()));
}
