import 'package:ecommerce_app/core/routes_manager/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/core/utils/font_manager.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/core/widget/main_loading_widget.dart';
import 'package:ecommerce_app/domain/entities/response/comman/category_brand.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/cubit/categories_tab_states.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/cubit/categories_tab_view_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  final String? selectedCategoryId;
  final String? selectedCategoryName;

  const SubCategoriesList({
    super.key,
    this.selectedCategoryId,
    this.selectedCategoryName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesTabViewModel, CategoriesTabStates>(
      builder: (context, state) {
        var viewModel = BlocProvider.of<CategoriesTabViewModel>(context);
        var categories = viewModel.categoriesList;
        var subCategories = viewModel.subCategoriesList;

        CategoryBrand? selectedCategory;
        if (selectedCategoryId != null && selectedCategoryId!.isNotEmpty) {
          if (categories != null && categories.isNotEmpty) {
            selectedCategory = categories.firstWhere(
              (category) => category.id == selectedCategoryId,
              orElse: () => categories.first,
            );
          }
        } else if (categories != null &&
            categories.isNotEmpty &&
            viewModel.selectedIndex < categories.length) {
          selectedCategory = categories[viewModel.selectedIndex];
        }

        String categoryTitle =
            selectedCategoryName ?? selectedCategory?.name ?? 'Category';
        String categoryImage =
            selectedCategory?.image ?? ImageAssets.categoryCardImage;

        void goToCategoryProductsListScreen() {
          context.pushNamed(Routes.productsScreenRouteName);
        }

        return Expanded(
          flex: 2,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Text(
                  categoryTitle,
                  style: getBoldStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s14,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CategoryCardItem(
                  categoryTitle,
                  categoryImage,
                  goToCategoryProductsListScreen,
                ),
              ),
              if (state is SubCategoryLoadingState && subCategories == null)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(AppPadding.p20),
                    child: Center(child: MainLoadingWidget()),
                  ),
                )
              else if (state is SubCategoryErrorState && subCategories == null)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p20),
                    child: Center(
                      child: Text(
                        state.errorMessage,
                        style: getRegularStyle(color: ColorManager.primary),
                      ),
                    ),
                  ),
                )
              else if (subCategories != null && subCategories.isEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p20),
                    child: Center(
                      child: Text(
                        'No subcategories found',
                        style: getRegularStyle(color: ColorManager.primary),
                      ),
                    ),
                  ),
                )
              else if (subCategories != null)
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: subCategories.length,
                    (context, index) {
                      final subCategory = subCategories[index];
                      return SubCategoryItem(
                        subCategory.name ?? '',
                        ImageAssets.subcategoryCardImage,
                        goToCategoryProductsListScreen,
                      );
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: AppSize.s8,
                    crossAxisSpacing: AppSize.s8,
                  ),
                )
              else
                const SliverToBoxAdapter(child: SizedBox.shrink()),
            ],
          ),
        );
      },
    );
  }
}
