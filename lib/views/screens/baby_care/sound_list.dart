import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';

import '../../base/components/custom_text_field.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/custom_row_widget.dart';

class SoundList extends StatelessWidget {
  SoundList({super.key});

  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const AppBarRegular(title: 'Sounds list'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: MyTextFormFieldWithIcon(
                  prefixIcon: const Icon(Icons.search),
                  keyBoardType: const TextInputType.numberWithOptions(decimal: true),
                  formHintText: 'Search for sound',
                  controller: _searchTEController,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter the venue";
                    }
                    return null;
                  },
                ),
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: CustomSvgImage(assetName: AppIcons.vaccineIcon),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Cat Sound', style: textTheme.headlineMedium),
                                Text('00:25', style: textTheme.labelSmall),
                              ],
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: AppColors.primaryColor),
                                    ),
                                    child: Icon(CupertinoIcons.repeat),
                                  ),
                                ),

                                /// play pause icon =====>
                                IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: AppColors.primaryColor),
                                    ),
                                    child: Icon(
                                      CupertinoIcons.play_arrow_solid,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },

                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: const Divider(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
