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

import '../../api/api_services.dart' as _i394;
import '../../api/data_source/remote/auth/auth_remote_data_source_implementation.dart'
    as _i122;
import '../../api/dio/get_it_module.dart' as _i814;
import '../../data/data_source/remote/auth/auth_remote_data_source.dart'
    as _i155;
import '../../data/repository/auth/auth_repository_implementation.dart'
    as _i298;
import '../../domain/repository/auth/auth_repository.dart' as _i912;
import '../../domain/usecases/login_use_case.dart' as _i210;
import '../../features/auth/login/cubit/sign_in_view_model.dart' as _i747;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final getItModule = _$GetItModule();
    gh.factory<_i528.PrettyDioLogger>(() => getItModule.prettyDioLogger);
    gh.singleton<_i361.BaseOptions>(() => getItModule.baseOptions);
    gh.singleton<_i394.ApiServices>(() => getItModule.apiServices);
    gh.factory<_i155.AuthRemoteDataSource>(() =>
        _i122.AuthRemoteDataSourceImplementation(gh<_i394.ApiServices>()));
    gh.singleton<_i361.Dio>(() => getItModule.provideDio(
          gh<_i361.BaseOptions>(),
          gh<_i528.PrettyDioLogger>(),
        ));
    gh.factory<_i912.AuthRepository>(() =>
        _i298.AuthRepositoryImplementation(gh<_i155.AuthRemoteDataSource>()));
    gh.factory<_i210.LoginUseCase>(
        () => _i210.LoginUseCase(gh<_i912.AuthRepository>()));
    gh.factory<_i747.SignInViewModel>(
        () => _i747.SignInViewModel(gh<_i210.LoginUseCase>()));
    return this;
  }
}

class _$GetItModule extends _i814.GetItModule {}
