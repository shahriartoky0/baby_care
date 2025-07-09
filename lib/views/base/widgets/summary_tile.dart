import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../../utilities/app_colors.dart';
import '../components/custom_svg.dart';
import 'app_floating_button.dart';

class SummaryTile extends StatelessWidget {
  const SummaryTile({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.date,
    required this.authorName,
    required this.time,
    this.iconColor = AppColors.white,
    this.iconSize = 24,
    this.backgroundColor = AppColors.primaryColor,
    this.leftDuration,
    this.rightDuration,
    this.showDottedLine = true,
    this.dottedLineHeight = 120,
    this.customBottomWidget,
  });

  final String iconAsset;
  final String title;
  final String date;
  final String authorName;
  final String time;
  final Color iconColor;
  final double iconSize;
  final Color backgroundColor;
  final String? leftDuration;
  final String? rightDuration;
  final bool showDottedLine;
  final double dottedLineHeight;
  final Widget? customBottomWidget;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Left side - Icon and dotted line
        Column(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: backgroundColor,
              child: CustomSvgImage(
                assetName: iconAsset,
                color: iconColor,
                height: iconSize,
              ),
            ),
            if (showDottedLine)
              const DottedLine(
                dashColor: Colors.black,
                dashGapLength: 4,
                dashLength: 6,
                lineThickness: 2,
                direction: Axis.vertical,
                lineLength: 120,
              ),
          ],
        ),

        const SizedBox(width: 10),

        // Right side - Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Title and Date row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      title,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    date,
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Author and Time row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      authorName,
                      style: textTheme.labelSmall?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    time,
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Bottom widget - either custom or default L/R duration
              if (customBottomWidget != null)
                customBottomWidget!
              else if (leftDuration != null || rightDuration != null)
                _buildDurationRow(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDurationRow() {
    return Row(
      children: <Widget>[
        if (leftDuration != null) ...[
          const CircleLetter(),
          const SizedBox(width: 4),
          Text(leftDuration!),
          const SizedBox(width: 16),
        ],
        if (rightDuration != null) ...[
          const CircleLetter(letter: 'R'),
          const SizedBox(width: 4),
          Text(rightDuration!),
        ],
      ],
    );
  }
}