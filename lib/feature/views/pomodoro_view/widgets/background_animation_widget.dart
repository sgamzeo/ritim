// part of '../pomodoro_view.dart';

// class _BackgroundAnimationWidget extends BaseGetView<PomodoroController> {
//   const _BackgroundAnimationWidget();

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: controller.animationController,
//       builder: (context, child) {
//         return AnimatedContainer(
//           duration: Duration(milliseconds: 300),
//           curve: Curves.linear,
//           height: Get.height * controller.progress,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 controller.progress.toClampedAlpha(Colors.green),
//                 (controller.progress * 0.5).toClampedAlpha(Colors.green),
//                 (controller.progress * 0.3).toClampedAlpha(Colors.green),
//               ],
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
