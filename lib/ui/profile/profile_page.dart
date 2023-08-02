import 'package:flutter/material.dart';
import 'package:quiz_app/resource/theme/colors.dart';

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
    return SafeArea(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Profile",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 14, color: QAColors.white),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
