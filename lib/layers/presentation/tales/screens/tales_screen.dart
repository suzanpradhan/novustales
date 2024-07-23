import 'package:flutter/material.dart';

class TalesScreen extends StatefulWidget {
  const TalesScreen({super.key});

  @override
  State<TalesScreen> createState() => _TalesScreenState();
}

class _TalesScreenState extends State<TalesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Tales Screen"),
      ),
    );
  }
}
