import '../exceptions/app_exceptions.dart';

sealed class ApiResult<T> {
  bool get hasData => this is ApiSuccessResultState<T>;

  bool get hasError => this is ApiErrorResultState<T>;

  bool get isLoading => this is ApiLoadingResultState<T>;

  AppException get getError => (this as ApiErrorResultState<T>).error;

  T get getData => (this as ApiSuccessResultState<T>).data;
}

class ApiSuccessResultState<T> extends ApiResult<T> {
  T data;

  ApiSuccessResultState(this.data);
}

class ApiErrorResultState<T> extends ApiResult<T> {
  AppException error;

  ApiErrorResultState(this.error);
}

class ApiLoadingResultState<T> extends ApiResult<T> {
  ApiLoadingResultState();
}
