import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarRegular extends StatelessWidget {
  final String title;

  const AppBarRegular({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: <Widget>[
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        Expanded(child: Center(child: Text(title, style: textTheme.titleMedium))),
        const SizedBox(width: 42),
      ],
    );
  }
}