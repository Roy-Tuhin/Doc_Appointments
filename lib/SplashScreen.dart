import 'dart:async';
import 'package:flutter/material.dart';
import 'API/Login/loginAtFirst.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      lowerBound: 0,
      upperBound: 1,
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: false);
    loadData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Theme.of(context).accentColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.6, 1],
          ),
        ),
      ),
      FadeTransition(
        opacity: _animation,
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                // image:DecorationImage(
                //     image:new AssetImage('assets/images/logo.png')
                ),
            child: Image.asset('assets/images/playstore.png'),
          ),
        ),
      ),
    ]);
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 4), _onDoneLoading);
  }

  _onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginAtFirst()));
  }
}
