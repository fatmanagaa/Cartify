import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/core/widget/main_loading_widget.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/cubit/categories_tab_states.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/cubit/categories_tab_view_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesTabViewModel, CategoriesTabStates>(
      builder: (context, state) {
        var viewModel = BlocProvider.of<CategoriesTabViewModel>(context);
        var categories = viewModel.categoriesList;

        if (categories == null) {
          return const Expanded(
            child: Center(
              child: MainLoadingWidget(),
            ),
          );
        }

        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.containerGray,
              border: Border(
                top: BorderSide(
                    width: AppSize.s2,
                    color: ColorManager.primary.withValues(alpha: 0.3)),
                left: BorderSide(
                    width: AppSize.s2,
                    color: ColorManager.primary.withValues(alpha: 0.3)),
                bottom: BorderSide(
                    width: AppSize.s2,
                    color: ColorManager.primary.withValues(alpha: 0.3)),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                bottomLeft: Radius.circular(AppSize.s12),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                bottomLeft: Radius.circular(AppSize.s12),
              ),
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) => CategoryItem(
                  index,
                  categories[index].name ?? '',
                  viewModel.selectedIndex == index,
                  (selectedIndex) {
                    viewModel.changeSelectedCategory(selectedIndex);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
