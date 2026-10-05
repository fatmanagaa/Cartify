// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../api/data_source/local/auth/auth_local_data_source_implementation.dart'
    as _i769;
import '../../api/data_source/remote/auth/auth_remote_data_source_implementation.dart'
    as _i122;
import '../../api/data_source/remote/brand/brand_remote_data_source_implementation.dart'
    as _i1020;
import '../../api/data_source/remote/category/category_remote_data_source_implementation.dart'
    as _i824;
import '../../api/data_source/remote/product/product_remote_data_source_implementation.dart'
    as _i362;
import '../../api/dio/get_it_module.dart' as _i814;
import '../../api/retrofit/api_services.dart' as _i222;
import '../../data/data_source/local/auth/auth_local_data_source.dart' as _i955;
import '../../data/data_source/remote/auth/auth_remote_data_source.dart'
    as _i155;
import '../../data/data_source/remote/brand/brand_remote_data_source.dart'
    as _i511;
import '../../data/data_source/remote/category/category_remote_data_source.dart'
    as _i653;
import '../../data/data_source/remote/product/product_remote_data_source.dart'
    as _i288;
import '../../data/repository/auth/auth_repository_implementation.dart'
    as _i298;
import '../../data/repository/brand/brand_repository_implementation.dart'
    as _i997;
import '../../data/repository/category/category_repository_implementation.dart'
    as _i640;
import '../../data/repository/product/product_repository_implementation.dart'
    as _i423;
import '../../domain/repository/auth/auth_repository.dart' as _i912;
import '../../domain/repository/brand/brand_repository.dart' as _i244;
import '../../domain/repository/category/category_repository.dart' as _i495;
import '../../domain/repository/product/product_repository.dart' as _i798;
import '../../domain/usecases/delete_token_use_case.dart' as _i839;
import '../../domain/usecases/get_all_brands_use_case.dart' as _i318;
import '../../domain/usecases/get_all_categories_use_case.dart' as _i716;
import '../../domain/usecases/get_all_products_use_case.dart' as _i436;
import '../../domain/usecases/get_product_details_use_case.dart' as _i676;
import '../../domain/usecases/get_token_use_case.dart' as _i3;
import '../../domain/usecases/login_use_case.dart' as _i210;
import '../../domain/usecases/register_use_case.dart' as _i502;
import '../../domain/usecases/save_token_use_case.dart' as _i1024;
import '../../features/auth/login/cubit/sign_in_view_model.dart' as _i747;
import '../../features/auth/resgister/cubit/register_view_model.dart' as _i550;
import '../../features/main_layout/cubit/main_layout_view_model.dart' as _i860;
import '../../features/main_layout/home/presentation/cubit/home_tab_view_model.dart'
    as _i127;
import '../../features/product_details/cubit/product_details_view_model.dart'
    as _i36;
import '../../features/products_screen/cubit/product_screen_view_model.dart'
    as _i751;
import '../../features/splash/cubit/splash_view_model.dart' as _i426;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i528.PrettyDioLogger>(() => getItModule.prettyDioLogger);
    gh.factory<_i860.MainLayoutViewModel>(() => _i860.MainLayoutViewModel());
    gh.singleton<_i361.BaseOptions>(() => getItModule.baseOptions);
    gh.singleton<_i222.ApiServices>(() => getItModule.apiServices);
    gh.factory<_i653.CategoryRemoteDataSource>(
      () =>
          _i824.CategoryRemoteDataSourceImplementation(gh<_i222.ApiServices>()),
    );
    gh.factory<_i288.ProductRemoteDataSource>(
      () =>
          _i362.ProductRemoteDataSourceImplementation(gh<_i222.ApiServices>()),
    );
    gh.factory<_i511.BrandRemoteDataSource>(
      () => _i1020.BrandRemoteDataSourceImplementation(gh<_i222.ApiServices>()),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.factory<_i955.AuthLocalDataSource>(
      () => _i769.AuthLocalDataSourceImpl(),
    );
    gh.factory<_i495.CategoryRepository>(
      () => _i640.CategoryRepositoryImpl(gh<_i653.CategoryRemoteDataSource>()),
    );
    gh.factory<_i244.BrandRepository>(
      () => _i997.BrandRepositoryImpl(gh<_i511.BrandRemoteDataSource>()),
    );
    gh.factory<_i798.ProductRepository>(
      () => _i423.ProductRepositoryImpl(gh<_i288.ProductRemoteDataSource>()),
    );
    gh.factory<_i716.GetAllCategoriesUseCase>(
      () => _i716.GetAllCategoriesUseCase(gh<_i495.CategoryRepository>()),
    );
    gh.factory<_i155.AuthRemoteDataSource>(
      () => _i122.AuthRemoteDataSourceImpl(gh<_i222.ApiServices>()),
    );
    gh.factory<_i436.GetAllProductsUseCase>(
      () => _i436.GetAllProductsUseCase(gh<_i798.ProductRepository>()),
    );
    gh.factory<_i676.GetProductDetailsUseCase>(
      () => _i676.GetProductDetailsUseCase(gh<_i798.ProductRepository>()),
    );
    gh.factory<_i318.GetAllBrandsUseCase>(
      () => _i318.GetAllBrandsUseCase(gh<_i244.BrandRepository>()),
    );
    gh.factory<_i127.HomeTabViewModel>(
      () => _i127.HomeTabViewModel(
        gh<_i716.GetAllCategoriesUseCase>(),
        gh<_i318.GetAllBrandsUseCase>(),
      ),
    );
    gh.factory<_i751.ProductScreenViewModel>(
      () => _i751.ProductScreenViewModel(gh<_i436.GetAllProductsUseCase>()),
    );
    gh.factory<_i912.AuthRepository>(
      () => _i298.AuthRepositoryImplementation(
        gh<_i155.AuthRemoteDataSource>(),
        gh<_i955.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i36.ProductDetailsViewModel>(
      () => _i36.ProductDetailsViewModel(gh<_i676.GetProductDetailsUseCase>()),
    );
    gh.factory<_i210.LoginUseCase>(
      () => _i210.LoginUseCase(gh<_i912.AuthRepository>()),
    );
    gh.factory<_i502.RegisterUseCase>(
      () => _i502.RegisterUseCase(gh<_i912.AuthRepository>()),
    );
    gh.factory<_i839.DeleteTokenUseCase>(
      () => _i839.DeleteTokenUseCase(gh<_i912.AuthRepository>()),
    );
    gh.factory<_i3.GetTokenUseCase>(
      () => _i3.GetTokenUseCase(gh<_i912.AuthRepository>()),
    );
    gh.factory<_i1024.SaveTokenUseCase>(
      () => _i1024.SaveTokenUseCase(gh<_i912.AuthRepository>()),
    );
    gh.factory<_i550.RegisterViewModel>(
      () => _i550.RegisterViewModel(gh<_i502.RegisterUseCase>()),
    );
    gh.factory<_i426.SplashViewModel>(
      () => _i426.SplashViewModel(gh<_i3.GetTokenUseCase>()),
    );
    gh.factory<_i747.LoginViewModel>(
      () => _i747.LoginViewModel(gh<_i210.LoginUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i814.GetItModule {}
