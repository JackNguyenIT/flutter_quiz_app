import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/generated/assets.dart';
import 'package:quiz_app/resource/localization/l10n.dart';
import 'package:quiz_app/ui/bloc/app/app_cubit.dart';
import 'package:quiz_app/ui/main/main_page.dart';
import 'package:quiz_app/ui/profile/widget/profile_info.dart';
import 'package:quiz_app/ui/profile/widget/profile_menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProfileInfo(
              name: "Luan",
              email: "luan91.it@gmail.com",
              image: Assets.imagesAvatar),
          const SizedBox(height: 16.0),
          ProfileMenuItem(
              iconData: Icons.leaderboard,
              title: AppTranslations.of(context).quiz_top,
              press: () {}),
          ProfileMenuItem(
              iconData: Icons.hourglass_top,
              title: AppTranslations.of(context).quiz_challenge,
              press: () {}),
          ProfileMenuItem(
              iconData: Icons.history_sharp,
              title: AppTranslations.of(context).quiz_history,
              press: () {
                context.read<AppCubit>().setCurrentTab(MainPage.tabHistory);
              }),
          ProfileMenuItem(
              iconData: Icons.help_outline_rounded,
              title: AppTranslations.of(context).help,
              press: () {}),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
