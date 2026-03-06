import 'package:flutter/material.dart';

import 'theme/app_effects.dart';
import 'theme/app_theme.dart';
import 'theme/app_typography.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task One',
      theme: AppTheme.light,
      home: const ThemePreviewPage(),
    );
  }
}

class ThemePreviewPage extends StatelessWidget {
  const ThemePreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = Theme.of(context).extension<AppTextStyles>();
    final titleStyle =
        appText?.regular24 ?? Theme.of(context).textTheme.titleLarge;
    final bodyStyle =
        appText?.regular14 ?? Theme.of(context).textTheme.bodyMedium;
    final capsStyle =
        appText?.caps12 ?? Theme.of(context).textTheme.labelMedium;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Color(0xFF0F172A), Color(0xFF2563EB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const SizedBox.expand(),
            ),
          ),
          Center(
            child: AppGlassContainer(
              recipe: AppEffects.darkGlassBlur30ShadowLarge,
              borderRadius: BorderRadius.circular(24),
              padding: const EdgeInsets.all(24),
              border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'COMPONENT PREVIEW',
                    style: capsStyle?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Century Gothic Typography',
                    style: titleStyle?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Use AppEffects recipes for blur/shadow and AppTextStyles for exact type scale.',
                    style: bodyStyle?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  AppGlassContainer(
                    recipe: AppEffects.whiteSurfaceShadowSmall,
                    borderRadius: BorderRadius.circular(14),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Text(
                      'whiteSurfaceShadowSmall',
                      style: (appText?.caps10 ?? bodyStyle)?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
