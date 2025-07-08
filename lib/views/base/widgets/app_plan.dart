import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utilities/app_colors.dart';

class AddPlanContainer extends StatelessWidget {
  const AddPlanContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      width: MediaQuery.sizeOf(context).width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        boxShadow: const <BoxShadow>[BoxShadow(blurRadius: 2)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('You don’t have any routing setup yet.', style: textTheme.headlineMedium),

          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.primaryColor.withValues(alpha: 0.5)),
              color: AppColors.iconBackground,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(CupertinoIcons.add_circled_solid, color: AppColors.primaryColor),
                const SizedBox(width: 5),
                Text('Add plan', style: textTheme.displayMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}