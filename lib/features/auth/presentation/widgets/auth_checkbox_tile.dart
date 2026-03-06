import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class AuthCheckboxTile extends StatelessWidget {
  const AuthCheckboxTile({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
  });

  final bool value;
  final String label;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: value ? const Color(0x3DFFFFFF) : const Color(0x1AFFFFFF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0x5CFFFFFF)),
            ),
            child: value
                ? const Icon(
                    Icons.check_rounded,
                    color: AppColors.white,
                    size: 21,
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                label,
                style: AppTypography.regular20.copyWith(
                  color: AppColors.mutedText,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
