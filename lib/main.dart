import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_training/Auth/login/login_view.dart';
import 'package:login_training/firebase_options.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform
);

  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );

    
  }
}
