abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLogoutLoadingState extends ProfileStates {}

class ProfileLogoutSuccessState extends ProfileStates {}

class ProfileLogoutErrorState extends ProfileStates {
  final String errorMessage;

  ProfileLogoutErrorState({required this.errorMessage});
}
