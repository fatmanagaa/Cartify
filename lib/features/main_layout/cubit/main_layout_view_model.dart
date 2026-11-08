import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/cubit/states/main_layout_states.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../products_screen/presentation/screens/products_screen.dart';
import '../favourite/presentation/favourite_screen.dart';
import '../home/presentation/home_tab.dart';
import '../profile_tab/presentation/profile_tab.dart';

@injectable
class MainLayoutViewModel extends Cubit<MainLayoutStates> {
  MainLayoutViewModel() : super(MainLayoutInitialState());

  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const ProductsScreen(),
    const FavouriteScreen(),
    const ProfileTab(),
  ];

  void changeSelectedIndex(int selectedIndex) {
    currentIndex = selectedIndex;
    emit(changeSelectedIndexState());
  }
}
