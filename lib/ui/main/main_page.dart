import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/generated/assets.dart';
import 'package:quiz_app/resource/localization/l10n.dart';
import 'package:quiz_app/resource/theme/colors.dart';
import 'package:quiz_app/router/route_page.dart';
import 'package:quiz_app/ui/bloc/app/app_cubit.dart';
import 'package:quiz_app/ui/history/history_page.dart';
import 'package:quiz_app/ui/home/home_page.dart';
import 'package:quiz_app/ui/profile/profile_page.dart';
import 'package:quiz_app/ui/question/question_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainView();
  }

  static const int tabHome = 0;
  static const int tabQuestion = 1;
  static const int tabHistory = 2;
  static const int tabProfile = 3;
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final PageController _pageController = PageController();

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const QuestionPage(),
    const HistoryPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        _pageController.jumpToPage(state.currentTab);
      },
      builder: (context, state) {
        return WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: Scaffold(
                extendBody: true,
                floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(QUIZ_PATH);
                    },
                    child: const Icon(Icons.play_arrow_rounded)),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                body: Stack(children: [
                  SvgPicture.asset(
                    Assets.imagesBg,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  _buildBody()
                ]),
                bottomNavigationBar: _buildBottomAppBar()));
      },
      buildWhen: (old, state) {
        return old.currentTab != state.currentTab;
      },
      listenWhen: (old, state) {
        return old.currentTab != state.currentTab;
      },
    );
  }

  _buildBody() {
    return Column(
      children: [
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: _widgetOptions,
          ),
        )
      ],
    );
  }

  _buildBottomAppBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: QAColors.primaryDark,
      elevation: 8.0,
      child: SizedBox(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildItemBottomAppBar(() {
              _onItemTapped(0);
            }, Icons.home, AppTranslations.of(context).home),
            _buildItemBottomAppBar(() {
              _onItemTapped(1);
            }, Icons.question_mark, AppTranslations.of(context).question),
            const SizedBox(width: 40),
            _buildItemBottomAppBar(() {
              _onItemTapped(2);
            }, Icons.history, AppTranslations.of(context).history),
            _buildItemBottomAppBar(() {
              _onItemTapped(3);
            }, Icons.person, AppTranslations.of(context).profile)
          ],
        ),
      ),
    );
  }

  _buildItemBottomAppBar(
      GestureTapCallback? onTap, IconData? icon, String text) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24.0,
                color: QAColors.white,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 10, color: QAColors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    context.read<AppCubit>().setCurrentTab(index);
  }
}
