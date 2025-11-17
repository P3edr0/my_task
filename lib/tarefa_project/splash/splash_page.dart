import 'package:flutter/material.dart';
import 'package:my_task/tarefa_project/home/home_page.dart';
import 'package:my_task/utils/assets.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(builder: (BuildContext context) => HomePage()),
        ModalRoute.withName('/'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(Assets.splash, fit: BoxFit.cover, scale: 1),
    );
  }
}
