import 'package:flutter/material.dart';
import 'package:shop_app/modules/Login/login_screen.dart';

class shopAppScreen extends StatelessWidget {
  const shopAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
          onPressed: ()
          {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context)=>LoginScreen()),
                (route) => false);
          },
            child: Icon(Icons.add)
          )],
      ),
    );
  }
}
