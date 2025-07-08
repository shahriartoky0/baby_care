import 'package:flutter/material.dart';

class MilestoneHomepage extends StatelessWidget {
  const MilestoneHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text('MileStones show here', style: Theme.of(context).textTheme.displayLarge),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
