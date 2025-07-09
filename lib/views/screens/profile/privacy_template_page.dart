import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/views/base/widgets/app_bar.dart';
import '../../../utilities/app_colors.dart';

class PolicyTemplatePage extends StatelessWidget {
  final String bodyText;

  final String appBarHeading;

  const PolicyTemplatePage({super.key, required this.bodyText, required this.appBarHeading});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AppBarRegular(title: appBarHeading),
              const SizedBox(height: 24),
              Text(bodyText),
            ],
          ),
        ),
      ),
    );
  }
}
