import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/ui/extension/form_filed.dart';

part 'profile_edit_cubit.freezed.dart';

part 'profile_edit_state.dart';

class ProfileEditCubit extends Cubit<ProfileEditState> {

  ProfileEditCubit() :
        super(ProfileEditState(
          form: UpdateUserForm(),
          status: ProfileEditState.statusInit));

  void emailChange(String newValue) {
    final newEmail = Email.dirty(newValue);
    // emit(state.copyWith(
    //   form: state.form.copyWith(email: newEmail),
    //   status: ProfileEditState.statusUpdateData,
    // ));
  }

  void nameChange(String newValue) {
    final newName = TextRequired.dirty(newValue);
    // emit(state.copyWith(
    //   form: state.form.copyWith(firstName: newName),
    //   status: ProfileEditState.statusUpdateData,
    // ));
  }

}
