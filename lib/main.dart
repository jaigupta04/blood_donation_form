import 'package:flutter/material.dart';
import 'donation_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation Form',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DonationForm(),
    );
  }
}
