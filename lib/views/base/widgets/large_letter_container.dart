import 'package:flutter/material.dart';

import '../../../utilities/app_colors.dart';

class LargeLetterContainer extends StatelessWidget {
  final String letter;

  final VoidCallback onTap;

  const LargeLetterContainer({super.key, required this.letter, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              // spreadRadius:2 ,
              blurRadius: 3,
              offset: letter == 'L' ? const Offset(2, 6) : const Offset(-2, 6),
            ),
          ],
          shape: BoxShape.circle,
          color: AppColors.iconBackground,
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            letter,
            style: textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 120 / 3.5,
            ),
          ),
        ),
      ),
    );
  }
}
