import 'package:discordbotadminui/Pages/AuthPage.dart';
import 'package:discordbotadminui/Pages/ConfirmEmail.dart';
import 'package:discordbotadminui/Pages/HomePage.dart';
import 'package:discordbotadminui/Pages/NotFoundPage.dart';
import 'package:discordbotadminui/Pages/RolesPage.dart';
import 'package:discordbotadminui/Pages/SystemMessagePage.dart';
import 'package:discordbotadminui/Pages/UsersPage.dart';
import 'package:discordbotadminui/Services/CacheService.dart';
import 'package:discordbotadminui/Services/UserService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await CacheServices.init();
  UserService.loadUser();
  runApp(const MyApp());
}

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    // only return the child without warping it with animations
    return child!;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: !UserService.getUser().logedIn ? '/' : '/home',
      errorBuilder: (context, state) {
        return const NotFoundPage();
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => const AuthPage(),
        ),
        GoRoute(
          path: UsersPage.route,
          builder: (context, state) => const UsersPage(),
        ),
        GoRoute(
          path: RolesPage.route,
          builder: (context, state) => const RolesPage(),
        ),
        GoRoute(
          path: SystemMessagePage.route,
          builder: (context, state) {
            final message = state.extra as String;
            return SystemMessagePage(
              message: message,
            );
          },
        ),
        GoRoute(
          path: ConfirmEmailPage.route,
          builder: (context, state) {
            final confirmed = state.queryParams['Confirmed'];
            UserService.getUser().logedIn = confirmed == "false" ? false : true;
            return const ConfirmEmailPage();
          },
        ),
      ],
    );

    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: buildTheme(Brightness.dark).textTheme,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: kIsWeb
                ? {
                    // No animations for every OS if the app running on the web
                    for (final platform in TargetPlatform.values)
                      platform: const NoTransitionsBuilder(),
                  }
                : const {
                    // handel other platforms you are targeting
                  },
          ),
        ),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}

ThemeData buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.sairaTextTheme(baseTheme.textTheme),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
