import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storyv2/core/routes/app_routes.dart';
import 'package:storyv2/utils/dependencies_injection.dart';
import 'package:storyv2/utils/secure_storage.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
          onPressed: () async {
            await sl<SecureStorageMixin>().clearValue(SecureStorageKeys.token);
            await sl<SecureStorageMixin>()
                .clearValue(SecureStorageKeys.isLogin);

            if (mounted) {
              context.replace(WELCOME_ROUTE);
            }
          },
          child: Text("Log out")),
    ));
  }
}
