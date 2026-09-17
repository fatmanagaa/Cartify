import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/cubit/states/main_layout_states.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../categories/presentation/categories_tab.dart';
import '../favourite/presentation/favourite_screen.dart';
import '../home/presentation/home_tab.dart';
import '../profile_tab/presentation/profile_tab.dart';
@injectable
class MainLayoutViewModel extends Cubit<MainLayoutStates> {
MainLayoutViewModel():super(MainLayoutInitialState());
int currentIndex = 0;
List<Widget> tabs = [
  const HomeTab(),
  const CategoriesTab(),
  const FavouriteScreen(),
  const ProfileTab(),
];
changeSelectedIndex(int selectedIndex) {
  currentIndex = selectedIndex;
 emit(changeSelectedIndexState());
}

}