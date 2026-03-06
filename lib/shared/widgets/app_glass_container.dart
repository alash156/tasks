import 'package:flutter/material.dart';

import '../../core/theme/app_effects.dart';

class AppGlassContainer extends StatelessWidget {
  const AppGlassContainer({
    super.key,
    required this.recipe,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.border,
  });

  final AppSurfaceRecipe recipe;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: padding,
      decoration: recipe.decoration(borderRadius: borderRadius, border: border),
      child: child,
    );

    final filter = recipe.backdropFilter;
    final body = filter == null
        ? content
        : ClipRRect(
            borderRadius: borderRadius,
            child: BackdropFilter(filter: filter, child: content),
          );

    if (margin == EdgeInsets.zero) {
      return body;
    }

    return Padding(padding: margin, child: body);
  }
}
