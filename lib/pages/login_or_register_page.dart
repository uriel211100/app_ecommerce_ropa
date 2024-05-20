import 'package:app_ecommerce/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {

  //Mostrar login page
  bool showLoginPage = true;

  //login y register page
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }



  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(
        onTab: togglePages,
      );
    } else {
      return RegisterPage(
        onTab: togglePages,
      );
    }
  }
}

