import 'package:flutter/material.dart';
import 'package:quiz_app/resource/theme/colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainView();
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: Container(
              color: QAColors.orange,
            ),
          )
        ],
      )),
    );
  }
}
