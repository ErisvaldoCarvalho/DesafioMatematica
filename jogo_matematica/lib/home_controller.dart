// import 'package:flutter/widgets.dart';

// class HomeController extends InheritedWidget {
//   HomeController({
//     required Key key,
//     required Widget child,
//     required ValueNotifier<int> notifier,
//   }) : super(
//           key: key,
//           child: child,
//           notifier: notifier,
//         );

//   int get valorNotificador => notifier!.value;
//   increment() {
//     notifier!.value++;
//   }

//   @override
//   bool updateShouldNotify(InheritedWidget oldWidget) {
//     return notifier.value != (oldWidget as HomeController).notifier.value;
//   }
// }
