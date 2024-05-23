import 'package:app_ecommerce/pages/autoiden_page.dart';
import 'package:app_ecommerce/pages/login_page.dart';
import 'package:app_ecommerce/pages/register_page.dart';  // Asegúrate de importar RegisterPage
import 'package:app_ecommerce/themes/light_mode.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'pages/intro_page.dart';

//holaaaaaaaaaaaaaaaa

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/login_page': (context) => LoginPage(
          onTab: () {
            Navigator.pushNamed(context, '/register_page');
          },
        ),
        '/register_page': (context) => RegisterPage(  // Añade esta línea
          onTab: () {
            Navigator.pushNamed(context, '/login_page');
          },
        ),
        '/autoiden_page': (context) => const AutoidenPage(),
      },
    );
  }
}