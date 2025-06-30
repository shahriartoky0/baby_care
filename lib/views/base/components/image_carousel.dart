/*
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/utilities/images/app_images.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';

class ImageSliderController extends GetxController {
  RxInt currentIndex = 0.obs;

  set updateIndex(int index) {
    currentIndex.value = index;
  }
}

class ImageSlider extends StatefulWidget {
  final List<String> imgList;
  final double height;
  final double indicatorWidth;
  final double borderRadius;
  final double indicatorHeight;
  final Color activeIndicatorColor;
  final Color inactiveIndicatorColor;
  final bool isBorder;
  final bool isInfiniteSlide;
  final List<VoidCallback> buttonPress;

  const ImageSlider({
    super.key,
    required this.imgList,
    this.height = 300.0,
    this.indicatorWidth = 20.0,
    this.indicatorHeight = 10.0,
    this.isBorder = false,
    this.isInfiniteSlide = true,
    this.borderRadius = 12,
    this.activeIndicatorColor = AppColors.primaryColor,
    this.inactiveIndicatorColor = AppColors.modalIconInnerColor,
    required this.buttonPress,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final ImageSliderController _controller = Get.put(ImageSliderController());
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    if (widget.isInfiniteSlide) {
      _startInfiniteSlide();
    }
  }

  void _startInfiniteSlide() {
    Future<dynamic>.delayed(const Duration(seconds: 3), _nextPage);
  }

  void _nextPage() {
    if (_controller.currentIndex.value == widget.imgList.length - 1) {
      Future<dynamic>.delayed(const Duration(milliseconds: 500), () {
        _controller.updateIndex = 0;
        _pageController.jumpToPage(0);
      });
    } else {
      _controller.updateIndex = _controller.currentIndex.value + 1;
    }

    _pageController.animateToPage(
      _controller.currentIndex.value,
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
    );

    if (widget.isInfiniteSlide) {
      Future<dynamic>.delayed(const Duration(seconds: 3), _nextPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(color: Colors.blue, border: Border.all(color: AppColors.red)),
          constraints: BoxConstraints(maxHeight: widget.height),
          // height: widget.height,
          child:  CustomSvgImage(
            assetName: widget.imgList[0],
            width: Get.width * 0.85,
            height: 300,
          ),
        ),

        Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<AnimatedContainer>.generate(widget.imgList.length, (int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width:
                        _controller.currentIndex.value == index
                            ? widget.indicatorWidth * 1.5
                            : widget.indicatorWidth * 0.6,
                    height: widget.indicatorHeight,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color:
                          _controller.currentIndex.value == index
                              ? widget.activeIndicatorColor
                              : widget.inactiveIndicatorColor,
                      borderRadius: BorderRadius.circular(12),
                      border: widget.isBorder ? Border.all(color: Colors.black) : null,
                    ),
                  );
                }),
              ),
            ],
          );
        }),
      ],
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/primary_button.dart';

import 'custom_svg.dart';

class ImageSliderController extends GetxController {
  RxInt currentIndex = 0.obs;

  set updateIndex(int index) {
    currentIndex.value = index;
  }
}

class ImageSlider extends StatefulWidget {
  final List<String> imgList;
  final double height;
  final double indicatorWidth;
  final double borderRadius;
  final double indicatorHeight;
  final Color activeIndicatorColor;
  final Color inactiveIndicatorColor;
  final bool isBorder;
  final bool isInfiniteSlide;

  const ImageSlider({
    super.key,
    required this.imgList,
    this.height = 300.0,
    this.indicatorWidth = 20.0,
    this.indicatorHeight = 10.0,
    this.isBorder = false,
    this.isInfiniteSlide = true,
    this.borderRadius = 12,
    this.activeIndicatorColor = AppColors.primaryColor,
    this.inactiveIndicatorColor = AppColors.modalIconInnerColor,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final ImageSliderController _controller = Get.put(ImageSliderController());
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    if (widget.isInfiniteSlide) {
      _startInfiniteSlide();
    }
  }

  void _startInfiniteSlide() {
    Future<dynamic>.delayed(const Duration(seconds: 3), _nextPage);
  }

  void _nextPage() {
    if (_controller.currentIndex.value == widget.imgList.length - 1) {
      Future<dynamic>.delayed(const Duration(milliseconds: 500), () {
        _controller.updateIndex = 0;
        _pageController.jumpToPage(0);
      });
    } else {
      _controller.updateIndex = _controller.currentIndex.value + 1;
    }

    _pageController.animateToPage(
      _controller.currentIndex.value,
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
    );

    if (widget.isInfiniteSlide) {
      Future<dynamic>.delayed(const Duration(seconds: 3), _nextPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imgList.length,
            onPageChanged: (int index) {
              _controller.updateIndex = index;
            },
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (index == 0)
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            color: AppColors.modalIconOuterColor.withValues(alpha: 0.6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Essential Breastfeeding Tips For New Moms",
                                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Helpful tips to support tour breast feeding journey from the start.",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium?.copyWith(fontSize: 9),
                                ),
                                const SizedBox(height: 16),
                                InkWell(
                                  onTap: () {
                                    /// TODO : navigate Logic
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.primaryColor,
                                    ),
                                    child: Text(
                                      'Read More',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelMedium?.copyWith(fontSize: 11),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Expanded(
                        child: Container(
                          color: AppColors.modalIconOuterColor.withValues(alpha: 0.6),

                          child: CustomSvgImage(
                            assetName: widget.imgList[index],
                            width: Get.width * 0.85,
                            height: 300,
                            fit: index == 1 ? BoxFit.cover : BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // CustomNetworkImage(
                  //   imageUrl: widget.imgList[index],
                  //   boxShape: BoxShape.rectangle,
                  //   height: widget.height,
                  //   width: context.screenWidth,
                  // ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<AnimatedContainer>.generate(widget.imgList.length, (int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width:
                        _controller.currentIndex.value == index
                            ? widget.indicatorWidth * 1.5
                            : widget.indicatorWidth * 0.6,
                    height: widget.indicatorHeight,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color:
                          _controller.currentIndex.value == index
                              ? widget.activeIndicatorColor
                              : widget.inactiveIndicatorColor,
                      borderRadius: BorderRadius.circular(12),
                      border: widget.isBorder ? Border.all(color: Colors.black) : null,
                    ),
                  );
                }),
              ),
            ],
          );
        }),
      ],
    );
  }
}
