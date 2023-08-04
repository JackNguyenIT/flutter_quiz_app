import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/resource/localization/l10n.dart';
import 'package:quiz_app/ui/profile/edit/bloc/profile_edit_cubit.dart';
import 'package:quiz_app/ui/widget/form_title_text_filed.dart';

class NameWidget extends StatefulWidget {
  const NameWidget({Key? key}) : super(key: key);

  @override
  State<NameWidget> createState() => _NameState();
}

class _NameState extends State<NameWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileEditCubit, ProfileEditState>(
      listener: (context, state) {
        _controller.text = "";
      },
      listenWhen: (context, state) {
        return state.status == ProfileEditState.statusUser;
      },
      child: FormTitleTextField(
        key: const Key("profileForm_name_textField"),
        title: AppTranslations.of(context).name,
        textChange: (newValue) {
          context.read<ProfileEditCubit>().nameChange(newValue);
        },
        errorText: null,
        controller: _controller,
      ),
    );
  }
}
