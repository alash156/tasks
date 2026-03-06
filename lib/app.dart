import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/presentation/pages/login_screen.dart';

class TaskOneApp extends StatelessWidget {
  const TaskOneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Jayasom Wellness',
          theme: AppTheme.light,
          home: const LoginScreen(),
        );
      },
    );
  }
}
