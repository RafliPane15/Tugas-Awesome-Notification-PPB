import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tugas_awesome_notification/authentication/login.dart';
import 'package:tugas_awesome_notification/authentication/registration.dart';
import 'package:tugas_awesome_notification/firebase_options.dart';
import 'package:tugas_awesome_notification/screens/homescreen.dart';
import 'package:tugas_awesome_notification/screens/second_screen.dart';
import 'package:tugas_awesome_notification/services/notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.initializeNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Assignment',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      routes: {
        'home': (context) => const HomeScreen(),
        'second': (context) => const SecondScreen(),
        'login': (context) => const LoginScreen(),
        'register': (context) => const RegisterScreen(),
      },
      // Ganti initialRoute dengan pengecekan status login
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginScreen()
          : const HomeScreen(),
    );
  }
}
