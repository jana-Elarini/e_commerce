import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled19/data/model/responses/CategoryOrBrandResponses.dart';

import '../app-colors.dart';

class CategoryBrandItems extends StatelessWidget {
  //todo : category or brand model
  CategoryOrBrand categoryOrBrand;

  CategoryBrandItems({required this.categoryOrBrand});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 90,
          child: Container(
            width: 250.w,
            height: 100.h,
            child: CircleAvatar(
              backgroundImage: NetworkImage(categoryOrBrand.image ?? ''),
              radius: 70.r,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(
            flex: 80,
            child: Text(
              categoryOrBrand.name ?? '',
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ))
      ],
    );
  }
}
