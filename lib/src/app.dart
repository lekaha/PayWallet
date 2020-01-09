import 'package:flutter/material.dart';

import 'home/index.dart';

class PayWalletApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Wallet',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: HomePage(),
    );
  }
}
