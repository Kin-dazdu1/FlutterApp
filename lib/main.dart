import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_shop_app/views/login.dart';
import 'package:work_shop_app/views/navigation.dart';
import 'package:firedart/firedart.dart';

const apiKey = "Api Key";
const projectId = "Project Id";

Future<void> main() async {
  Firestore.initialize(projectId);
  FirebaseAuth.initialize(apiKey, VolatileStore());
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? email = preferences.getString("email");
  runApp(MyApp(isLoginReq: email == null ? true : false));
}


class MyApp extends StatelessWidget {
  final bool isLoginReq;
  const MyApp({Key? key, required this.isLoginReq}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edil-Oral App',
      home: isLoginReq ? const AuthGate() : const InitialWidget(),
      theme: ThemeData.dark(),
    );
  }
}
