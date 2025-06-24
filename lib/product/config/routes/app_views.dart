import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ritim/feature/views/pomodoro_view/pomodoro_view.dart';
import 'package:ritim/feature/views/pomodoro_view/widgets/pomodoro_view_binding.dart';

part 'app_routes.dart';

class AppViews {
  static String initial = AppRoutes.pomodoroView;
  static final routes = [
    GetPage(
      name: AppRoutes.pomodoroView,
      page: () => const PomodoroView(),
      binding: PomodoroBinding(),
    ),
  ];
}
