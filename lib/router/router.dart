import 'package:auto_route/auto_route.dart';
import 'package:ehealthapp/pages/help/help_page.dart';
import 'package:ehealthapp/pages/home/home_page.dart';
import 'package:ehealthapp/pages/login/login_page.dart';
import 'package:ehealthapp/pages/register/register_page.dart';
import 'package:ehealthapp/pages/splash/splash_page.dart';
import 'package:ehealthapp/pages/welcome/welcome_page.dart';

part 'router.gr.dart';


@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    /// routes go here
    ///
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: HelpRoute.page),
    AutoRoute(page: WelcomeRoute.page),
    AutoRoute(page: SplashRoute.page,initial: true),


  ];
}

