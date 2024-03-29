import 'package:flutter_boilerplate/feature/add_new_todo/view/add_new_todo_view.dart';
import 'package:flutter_boilerplate/feature/home/view/home_screen_view.dart';
import 'package:flutter_boilerplate/feature/onboarding/view/onboarding_screen_view.dart';
import 'package:get/get.dart';


class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String home = '/home';
  static const String onboarding = '/onboarding';
  static const String addNewTodo = '/add-new-todo';

  static getInitialRoute() => initial;
  static getSplashRoute() => splash;
  static getHomeRoute() => home;
  static getOnboardingRoute() => onboarding;
  static getAddNewTodoRoute() => addNewTodo;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const HomeScreenView()),
    GetPage(name: splash, page: () => const HomeScreenView()),
    GetPage(name: home, page: () => const HomeScreenView()),
    GetPage(name: onboarding, page: () => const OnboardingScreenView()),
    GetPage(name: addNewTodo, page: () => const AddNewTodoView()),
  ];
}