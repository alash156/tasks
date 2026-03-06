import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/presentation/pages/login_screen.dart';

class TaskOneApp extends StatelessWidget {
  const TaskOneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jayasom Wellness',
      theme: AppTheme.light,
      home: const LoginScreen(),
    );
  }
}
