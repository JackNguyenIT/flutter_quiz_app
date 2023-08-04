import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/di/injection.dart';
import 'package:quiz_app/generated/assets.dart';
import 'package:quiz_app/resource/localization/l10n.dart';
import 'package:quiz_app/ui/profile/edit/bloc/profile_edit_cubit.dart';
import 'package:quiz_app/ui/profile/edit/widget/email_widget.dart';
import 'package:quiz_app/ui/profile/edit/widget/name_widget.dart';
import 'package:quiz_app/ui/widget/header_back.dart';
import 'package:quiz_app/ui/widget/scaffold_with_background.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileEditCubit>(
      create: (context) => getIt.get<ProfileEditCubit>(),
      child: const ProfileEditView(),
    );
  }
}

class ProfileEditView extends StatefulWidget {
  const ProfileEditView({super.key});

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      child: SafeArea(
        child: Column(
          children: [
            HeaderBack(
                title: AppTranslations.of(context).edit_profile,
                actionText: null),
            Expanded(
              child: SingleChildScrollView(
                child: _buildBody(),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
          _buildAvatar(),
          const SizedBox(
            height: 36,
          ),
          const NameWidget(),
          const SizedBox(
            height: 24,
          ),
          const EmailWidget(),
        ],
      ),
    );
  }

  _buildAvatar() {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(Assets.imagesAvatar),
          ),
        ),
      ),
    );
  }
}
