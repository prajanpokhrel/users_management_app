import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manage_app/app/app.dart';
import 'package:user_manage_app/features/users/provider/users_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UsersProvider()),
        ],
        child: EasyLocalization(
          supportedLocales: [Locale('en', 'US'), Locale('ne', 'NP')],
          path: 'assets/translations',
          fallbackLocale: Locale('en', 'US'),
          child: MyApp(),
        )),
  );
}
