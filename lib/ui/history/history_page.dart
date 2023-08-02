import 'package:flutter/material.dart';
import 'package:quiz_app/resource/theme/colors.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HistoryView();
  }
}

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "History",
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
