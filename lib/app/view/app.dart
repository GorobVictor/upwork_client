import 'package:flutter/material.dart';
import 'package:upwork_client/core/core.dart';
import 'package:upwork_client/features/home_page/home_page_widget.dart';
import 'package:upwork_client/features/pages.dart';
import 'package:upwork_client/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.lightTheme,
      //darkTheme: AppThemeData.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: FutureBuilder(
        future: LocalRepository().getToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return FutureBuilder(
                future: AccountRepository().checkToken(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data ?? false) {
                      return const HomePageWidget();
                    }
                    LocalRepository().removeToken();
                    return const Login();
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              );
            }
            LocalRepository().removeToken();
            return const Login();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      navigatorKey: navigatorKey,
    );
  }
}
