import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/cubit/categories_tab_view_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatefulWidget {
  final String? categoryId;
  final String? categoryName;

  const CategoriesTab({super.key, this.categoryId, this.categoryName});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  late final CategoriesTabViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<CategoriesTabViewModel>();
    viewModel.getCategories(selectedCategoryId: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p12,
          vertical: AppPadding.p12,
        ),
        child: Row(
          children: [
            const CategoriesList(),
            const SizedBox(width: AppSize.s16),
            SubCategoriesList(
              selectedCategoryId: widget.categoryId,
              selectedCategoryName: widget.categoryName,
            ),
          ],
        ),
      ),
    );
  }
}
