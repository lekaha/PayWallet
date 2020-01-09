import 'package:flutter/material.dart';
import 'package:pay_wallet/src/home/index.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay Wallet'),
      ),
      body: HomeScreen(homeBloc: _homeBloc),
    );
  }
}
