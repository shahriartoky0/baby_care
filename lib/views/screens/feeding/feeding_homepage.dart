import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/widgets/calander_view.dart';
import 'package:together_baby/views/screens/feeding/solids/add_solid.dart';
import 'package:together_baby/views/screens/feeding/solids/solid_homepage.dart';
import '../../../controller/button_controller.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/app_floating_button.dart';
import '../../base/widgets/select_button.dart';
import '../../base/widgets/summary_container.dart';
import 'breastfeeding/add_breastfeeding.dart';
import 'breastfeeding/breast_feeding_homepage.dart';
import 'formula/add_formula.dart';
import 'formula/formula_homepage.dart';

class FeedingHomepage extends StatelessWidget {
  const FeedingHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Getting Printed =====> ');

    final ButtonController controller = Get.put(ButtonController());

    DateTime selectedDate = DateTime.now();
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton:   AppFloatingButton(
          iconPath: AppIcons.feedingIcon,
          onPressed: () {
            if (controller.selectedIndex.value == 0) {
              Get.to(() => AddBreastfeeding());
            }
            else if (controller.selectedIndex.value == 1) {
              Get.to(() => AddFormulaPage());
            }else if (controller.selectedIndex.value == 2) {
              Get.to(() => AddSolidPage());
            }
          },
        ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const AppBarRegular(title: 'Feeding'),
              SelectButtonWidget(
                buttonLabels: const <String>['Breastfeeding', 'Formula', 'Solid'],
                controller: controller,
              ),
              Obx(() {
                switch (controller.selectedIndex.value) {
                  case 0:
                    return BreastFeedingHomepage(selectedDate: selectedDate);
                  case 1:
                    return FormulaHomepage(selectedDate: selectedDate);
                  case 2:
                    return  SolidHomePage(selectedDate: selectedDate);
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
