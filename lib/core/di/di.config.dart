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

import '../../api/data_source/remote/auth/auth_remote_data_source_implementation.dart'
    as _i122;
import '../../api/data_source/remote/brand/brand_remote_data_source_implementation.dart'
    as _i939;
import '../../api/data_source/remote/category/category_remote_data_source_implementation.dart'
    as _i824;
import '../../api/dio/get_it_module.dart' as _i814;
import '../../api/retrofit/api_services.dart' as _i222;
import '../../data/data_source/remote/auth/auth_remote_data_source.dart'
    as _i155;
import '../../data/data_source/remote/brand/brand_remote_data_source.dart'
    as _i511;
import '../../data/data_source/remote/category/category_remote_data_source.dart'
    as _i653;
import '../../data/repository/auth/auth_repository_implementation.dart'
    as _i298;
import '../../data/repository/brand/brand_repository_implementation.dart'
    as _i997;
import '../../data/repository/category/category_repository_implementation.dart'
    as _i640;
import '../../domain/repository/auth/auth_repository.dart' as _i912;
import '../../domain/repository/brand/brand_repository.dart' as _i244;
import '../../domain/repository/category/category_repository.dart' as _i495;
import '../../domain/usecases/get_all_brands_use_case.dart' as _i318;
import '../../domain/usecases/get_all_categories_use_case.dart' as _i716;
import '../../domain/usecases/login_use_case.dart' as _i210;
import '../../domain/usecases/register_use_case.dart' as _i502;
import '../../features/auth/login/cubit/sign_in_view_model.dart' as _i747;
import '../../features/auth/resgister/cubit/register_view_model.dart' as _i550;
import '../../features/main_layout/cubit/main_layout_view_model.dart' as _i860;

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
    gh.factory<_i511.BrandRemoteDataSource>(
      () => _i939.BrandRemoteDataSourceImplementation(gh<_i222.ApiServices>()),
    );
    gh.factory<_i653.CategoryRemoteDataSource>(
      () =>
          _i824.CategoryRemoteDataSourceImplementation(gh<_i222.ApiServices>()),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.factory<_i495.CategoryRepository>(
      () => _i640.CategoryRepositoryImpl(gh<_i653.CategoryRemoteDataSource>()),
    );
    gh.factory<_i244.BrandRepository>(
      () => _i997.BrandRepositoryImpl(gh<_i511.BrandRemoteDataSource>()),
    );
    gh.factory<_i716.GetAllCategoriesUseCase>(
      () => _i716.GetAllCategoriesUseCase(gh<_i495.CategoryRepository>()),
    );
    gh.factory<_i155.AuthRemoteDataSource>(
      () => _i122.AuthRemoteDataSourceImpl(gh<_i222.ApiServices>()),
    );
    gh.factory<_i318.GetAllBrandsUseCase>(
      () => _i318.GetAllBrandsUseCase(gh<_i244.BrandRepository>()),
    );
    gh.factory<_i912.AuthRepository>(
      () =>
          _i298.AuthRepositoryImplementation(gh<_i155.AuthRemoteDataSource>()),
    );
    gh.factory<_i210.LoginUseCase>(
      () => _i210.LoginUseCase(gh<_i912.AuthRepository>()),
    );
    gh.factory<_i502.RegisterUseCase>(
      () => _i502.RegisterUseCase(gh<_i912.AuthRepository>()),
    );
    gh.factory<_i550.RegisterViewModel>(
      () => _i550.RegisterViewModel(gh<_i502.RegisterUseCase>()),
    );
    gh.factory<_i747.LoginViewModel>(
      () => _i747.LoginViewModel(gh<_i210.LoginUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i814.GetItModule {}
