class ChangePasswordRequest {
  final String? currentPassword;
  final String? password;
  final String? rePassword;

  ChangePasswordRequest({
    this.currentPassword,
    this.password,
    this.rePassword,
  });
}
