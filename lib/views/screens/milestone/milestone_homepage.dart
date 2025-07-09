import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/button_controller.dart';
import '../../base/widgets/select_button.dart';

class MilestoneHomepage extends StatelessWidget {
  const MilestoneHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonController controller = Get.put(ButtonController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'MileStones show here',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              SizedBox(height: 12),

              SelectButtonWidget(
                buttonLabels: const <String>['Month 01', 'Month 02', 'Month 03', 'Month 04'],
                controller: controller,
              ),
              SizedBox(height: 12),
              Obx(() {
                switch (controller.selectedIndex.value) {
                  case 0:
                    return Text('Month 01 Milestone');
                  case 1:
                    return Text('Month 02 Milestone');
                  case 2:
                    return Text('Month 03 Milestone');
                  case 3:
                    return Text('Month 04 Milestone');
                  default:
                    return const Text("Select an option", style: TextStyle(fontSize: 20));
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
