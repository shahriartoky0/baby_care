import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final String? timeText;
  final String? noteText;
  final VoidCallback onTap;
  final VoidCallback deletePressed;
  final bool showDeleteButton;

  const CustomRowWidget({
    super.key,
    required this.text1,
    required this.text2,
    this.timeText,
    required this.onTap,
    required this.deletePressed,
    this.noteText,
    this.showDeleteButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.grey,
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(text1, style: textTheme.titleSmall),
                Text(
                  timeText ?? '',
                  // Default value if no timeText is passed
                  style: textTheme.labelSmall?.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (text2.isEmpty)
                  const SizedBox.shrink()
                else
                  Text(
                    text2,
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                if (showDeleteButton)
                  IconButton(
                    onPressed: () {
                      _showDeleteConfirmationDialog(context);
                    },
                    icon: const Icon(size: 16, CupertinoIcons.delete, color: Colors.red),
                  ),
              ],
            ),
            if (noteText == null)
              const SizedBox.shrink()
            else
              Text(noteText ?? '', style: textTheme.labelSmall),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextTheme textTheme = Theme.of(context).textTheme;
        return AlertDialog(
          title: Text("Alert", style: textTheme.headlineMedium),
          content: const Text(
            "Do you really want to delete this item? This action cannot be undone.",
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without deleting
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: deletePressed,
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
