import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khsomati/firebase_options.dart';
import 'package:khsomati/router/route.dart';
import 'package:khsomati/router/route_string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
<<<<<<< HEAD

=======
>>>>>>> db43053897b4aa8dd0426ddf3e5436123ab6f603
  runApp(Khosomati());
}

class Khosomati extends StatelessWidget {
<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteString.splash,
=======
  const Khosomati({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Khosomati App",
      debugShowCheckedModeBanner: false,
>>>>>>> db43053897b4aa8dd0426ddf3e5436123ab6f603
      routes: routes,
    );
  }
}
