import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../app-colors.dart';

class AnnouncementsSection extends StatelessWidget {
  List<String> sliderImages = [
    'assets/images/pic1.png',
    'assets/images/pic2.png',
    'assets/images/pic3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorColor: AppColors.primaryColor,
      indicatorBackgroundColor: AppColors.whiteColor,
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
      children: sliderImages
          .map((url) =>
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              url,
              fit: BoxFit.fill,
              width: 398.w,
              height: 200.h,
            ),
          ))
          .toList(),
    );
  }
}