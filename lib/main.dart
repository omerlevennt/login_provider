import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_provider/feature/login/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Provider',
      theme: Theme.of(context).copyWith(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.dark),
          scaffoldBackgroundColor: Colors.grey[300]),
      home: const LoginView(),
    );
  }
}
