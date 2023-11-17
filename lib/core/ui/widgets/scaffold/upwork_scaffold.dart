import 'package:flutter/material.dart';
import 'package:upwork_client/utils/utils.dart';

class UpworkScaffold extends StatelessWidget {
  const UpworkScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.bottomNavigationBar,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Navigator.canPop(context);
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteF1,
        appBar: appBar,
        body: SafeArea(
          child: body,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
