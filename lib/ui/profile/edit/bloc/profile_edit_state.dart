part of 'profile_edit_cubit.dart';

@freezed
class ProfileEditState with _$ProfileEditState  {

  const factory ProfileEditState({
  required UpdateUserForm form,
  Exception? exception,
  @Default(ProfileEditState.statusInit) int status,
  }) = _ProfileEditState;


  static const int statusInit = 1;
  static const int statusUser = 2;
  static const int statusError = 3;
  static const int statusSuccess = 4;
  static const int statusUpdateImage = 5;
  static const int statusUpdateData = 6;
  static const int statusLoading = 7;
}
