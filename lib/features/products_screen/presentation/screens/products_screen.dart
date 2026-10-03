import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/widget/main_error_widget.dart';
import 'package:ecommerce_app/core/widget/main_loading_widget.dart';
import 'package:ecommerce_app/features/products_screen/cubit/product_screen_states.dart';
import 'package:ecommerce_app/features/products_screen/cubit/product_screen_view_model.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/values_manager.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductScreenViewModel viewModel = getIt<ProductScreenViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<ProductScreenViewModel, ProductScreenStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is ProductErrorState && viewModel.productsList == null) {
            return MainErrorWidget(
              errorMessage: state.errorMessage,
              onPressed: () {
                viewModel.getProducts();
              },
            );
          } else if (viewModel.productsList != null) {
            if (viewModel.productsList!.isEmpty) {
              return const Center(child: Text("No products found"));
            }
            return Padding(
              padding: EdgeInsets.all(AppPadding.p16),
              child: GridView.builder(
                itemCount: viewModel.productsList!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 7 / 9,
                ),
                itemBuilder: (context, index) {
                  return CustomProductWidget(
                    product: viewModel.productsList![index],
                  );
                },
                scrollDirection: Axis.vertical,
              ),
            );
          } else {
            return const MainLoadingWidget();
          }
        },
      ),
    );
  }
}
