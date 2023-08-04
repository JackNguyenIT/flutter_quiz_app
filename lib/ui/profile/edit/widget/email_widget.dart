import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/resource/localization/l10n.dart';
import 'package:quiz_app/ui/profile/edit/bloc/profile_edit_cubit.dart';
import 'package:quiz_app/ui/widget/form_title_text_filed.dart';

class EmailWidget extends StatefulWidget {
  const EmailWidget({Key? key}) : super(key: key);

  @override
  State<EmailWidget> createState() => _EmailState();
}

class _EmailState extends State<EmailWidget> {
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
        key: const Key("profileForm_email_textField"),
        title: AppTranslations.of(context).email_address,
        textChange: (newValue) {
          context.read<ProfileEditCubit>().emailChange(newValue);
        },
        errorText: null,
        controller: _controller,
      ),
    );
  }
}
