import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled19/Home/CategoriesOrBrandsSection.dart';
import 'package:untitled19/Home/RowSectionWidget.dart';
import 'package:untitled19/HomeTab/cubit/home_tab_States.dart';
import 'package:untitled19/HomeTab/cubit/home_tab_view_model.dart';
import 'package:untitled19/data/api_manager.dart';

import '../app-colors.dart';
import '../Home/annoncement.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'homeTab';

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // Create an instance of the view model
  final HomeTabViewModel viewModel = HomeTabViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel..getAllCategories(),
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  // Logo Positioned
                  Image.asset(
                    'assets/images/routeblue.png',
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(height: 18.h),

                  // Announcements Section
                  AnnouncementsSection(),
                  SizedBox(height: 16.h),

                  // Categories Section
                  RowSectionWidget(name: 'Categories'),
                  SizedBox(height: 24.h),
                  //state is  HomeCategorySuccessState ?
                  //CategoriesBrandsWidget (categoriesList: state.categoryResponses.data!):
                  //Text(viewModel.categoriesList!.length.toString()):
                  Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Brands Section
                  RowSectionWidget(name: 'Brands'),

                  // Search Row
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: AppColors.primaryColor),
                          decoration: InputDecoration(
                            labelText: 'What do you search for?',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.primaryColor,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.shopping_cart,
                        color: AppColors.primaryColor,
                        size: 30,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  // Fixed height for spacing

                  // Any other widgets you might have
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
