import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/views/screens/sleep/sleeping_add.dart';
import '../../base/components/app_icon.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/app_floating_button.dart';
import '../../base/widgets/calander_view.dart';
import '../../base/widgets/custom_row_widget.dart';
import '../../base/widgets/summary_container.dart';
import 'add_medicine.dart';

class MedicineHomepage extends StatelessWidget {
  final DateTime selectedDate;

  const MedicineHomepage({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: AppFloatingButton(
        iconPath: AppIcons.medicineIcon,
        onPressed: () {
          Get.to(() => const AddMedicinePage());
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const AppBarRegular(title: 'Medicine'),

              /// ================================ CALENDAR VIEW ==============>
              CalendarView(dateSelected: selectedDate),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Schedule', style: textTheme.titleMedium?.copyWith(fontSize: 20)),
                    const SizedBox(height: 16),

                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: CustomRowWidget(
                            text1: 'Napa (Syrup) \n2 Tablespoon',
                            text2: '(Before Dinner)',
                            timeText: '09:31am',
                            onTap: () {},
                            deletePressed: () {}, // Optional, can be omitted
                          ),
                        );
                      },

                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}


