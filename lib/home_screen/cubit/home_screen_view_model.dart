import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled19/home_screen/HomeScreenStates.dart';

import '../../HomeTab/HomeTab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() :super(HomeScreenInitialState());

  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    //ProductListTab(),
    // FavouriteTab(),
    // ProfileTab()
  ];

  void changedSelectedIndex(int newIndex) {
    emit(HomeScreenInitialState());
    selectedIndex = newIndex;
    emit(ChangeSelectedIndexState());
  }
}