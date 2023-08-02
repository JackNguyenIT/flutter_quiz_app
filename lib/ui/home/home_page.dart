import 'package:flutter/material.dart';
import 'package:quiz_app/resource/theme/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Home",
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
