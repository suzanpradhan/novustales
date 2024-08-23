import 'package:flutter/material.dart';
import 'package:storyv2/layers/presentation/feed/screens/archived/near_me.dart';
import 'package:storyv2/layers/presentation/feed/screens/archived/near_me_open_street.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  bool _isGoogleMap = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            if (_isGoogleMap) NearMeScreen() else NearMeOpenStreet(),
            Switch(
                value: _isGoogleMap,
                onChanged: (value) {
                  setState(() {
                    _isGoogleMap = value;
                  });
                })
          ],
        ),
      ),
    );
  }
}
