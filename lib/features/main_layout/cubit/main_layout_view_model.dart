import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/cubit/states/main_layout_states.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/features/main_layout/wishlist/presentation/cubit/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../products_screen/presentation/screens/products_screen.dart';
import '../wishlist/presentation/wishlist_screen.dart';
import '../home/presentation/home_tab.dart';
import '../profile_tab/presentation/profile_tab.dart';

@injectable
class MainLayoutViewModel extends Cubit<MainLayoutStates> {
  MainLayoutViewModel() : super(MainLayoutInitialState());

  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const ProductsScreen(),
    const WishlistScreen(),
    const ProfileTab(),
  ];

  void changeSelectedIndex(int selectedIndex) {
    currentIndex = selectedIndex;
    if (selectedIndex == 2) {
      getIt<WishlistViewModel>().getWishlist(showLoading: false);
    }
    emit(changeSelectedIndexState());
  }
}
