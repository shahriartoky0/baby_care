import 'package:flutter/material.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';
import 'package:together_baby/views/base/widgets/custom_appbar.dart';

import '../../base/widgets/app_bar.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    // List of questions and answers (this will be fetched from the API)
    final List<Map<String, String>> faqList = <Map<String, String>>[
      <String, String>{
        "question": "01. Search For Answers",
        "answer":
            "Lorem Ipsum Is Not Simply Random Text. It Has Roots In A Piece Of Classical Latin Literature From 45 BC. Making It Over 2000 Years Old. Richard McClintock, Contrary To Popular Belief, Lorem Ipsum Is Not Simply Random Text. It Has Roots In A Piece Of Classical Latin Literature From 45 BC. Making It Over 2000 Years Old. Richard McClintock.",
      },
      <String, String>{
        "question": "02. Lorem Ipsum Is Not Simply Random Text.",
        "answer":
            "Lorem Ipsum Is Not Simply Random Text. It Has Roots In A Piece Of Classical Latin Literature From 45 BC. Making It Over 2000 Years Old. Richard McClintock.",
      },
      <String, String>{
        "question": "03. Lorem Ipsum Is Not Simply Random Text.",
        "answer":
            "Lorem Ipsum Is Not Simply Random Text. It Has Roots In A Piece Of Classical Latin Literature From 45 BC. Making It Over 2000 Years Old. Richard McClintock.",
      },
      <String, String>{
        "question": "03. Lorem Ipsum Is Not Simply Random Text.",
        "answer":
            "Lorem Ipsum Is Not Simply Random Text. It Has Roots In A Piece Of Classical Latin Literature From 45 BC. Making It Over 2000 Years Old. Richard McClintock.",
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const AppBarRegular(title: 'Baby Cues'),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey, width: 1.2),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Baby Cues and Their Meanings',
                      textAlign: TextAlign.center,
                      style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(16),
                    itemCount: faqList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FAQItem(
                        question: faqList[index]["question"]!,
                        answer: faqList[index]["answer"]!,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(12),
      //   boxShadow: [
      //     BoxShadow(color: Colors.grey.withValues(alpha: 0.1), blurRadius: 4, spreadRadius: 2),
      //   ],
      // ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(12),
              //   border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
              // ),
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: CustomSvgImage(assetName: AppIcons.cueListIcon, width: 28, height: 28),
                  ),
                  Expanded(
                    child: Text(
                      widget.question,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),

          if (_isExpanded)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Text(widget.answer, style: Theme.of(context).textTheme.displayMedium),
            ),
          Divider(),
        ],
      ),
    );
  }
}
