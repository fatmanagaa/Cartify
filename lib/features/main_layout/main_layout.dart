import 'package:ecommerce_app/features/main_layout/cubit/main_layout_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/di.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widget/home_screen_app_bar.dart';
import 'cubit/states/main_layout_states.dart';
import 'package:flutter/material.dart';


class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  MainLayoutViewModel viewModel = getIt<MainLayoutViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutViewModel, MainLayoutStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: const HomeScreenAppBar(),
          extendBody: false,
          body: viewModel.tabs[viewModel.currentIndex],
          bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: BottomNavigationBar(
              currentIndex: viewModel.currentIndex,
              onTap: (value) => viewModel.changeSelectedIndex(value),
              backgroundColor: ColorManager.primary,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: ColorManager.primary,
              unselectedItemColor: ColorManager.white,
              showSelectedLabels: false,
              // Hide selected item labels
              showUnselectedLabels: false,
              // Hide unselected item labels
              items: [
                // Build BottomNavigationBarItem widgets for each tab
                CustomBottomNavBarItem(IconsAssets.icHome, "Home"),
                CustomBottomNavBarItem(IconsAssets.icCategory, "Category"),
                CustomBottomNavBarItem(IconsAssets.icWithList, "WishList"),
                CustomBottomNavBarItem(IconsAssets.icProfile, "Profile"),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;

  CustomBottomNavBarItem(this.iconPath, this.title)
      : super(
    label: title,
    icon: ImageIcon(
      AssetImage(iconPath), // Inactive icon image
      color: ColorManager.white, // Inactive icon color
    ),
    activeIcon: CircleAvatar(
      backgroundColor: ColorManager.white, // Background of active icon
      child: ImageIcon(
        AssetImage(iconPath),
        color: ColorManager
            .primary, // Active icon imagecolor: ColorManager.primary, // Active icon color
      ),
    ),
  );
}
