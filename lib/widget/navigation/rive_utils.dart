import 'package:get/get.dart';
import 'package:rive/rive.dart';
Rx<RiveAssets> select = bottomNav.first.obs;

class RiveAssets {
  final String artBoard, stateMachineName, title;
  late SMIBool? input;

  RiveAssets({
    required this.title,
    required this.artBoard,
    required this.stateMachineName,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<String> nameIcon = [
  "HOME",
  "Favorite",
  "Properties",
  "PROFILE",
];

List<RiveAssets> bottomNav = [
  RiveAssets(
    artBoard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "HOME",
  ),
  RiveAssets(
    artBoard: "HEART",
    stateMachineName: "HEART_Interactivity",
    title: "HEART",
  ),
  RiveAssets(
    artBoard: "RULES",
    stateMachineName: "RULES_Interactivity",
    title: "RULES",
  ),
  RiveAssets(
    artBoard: "USER",
    stateMachineName: "USER_Interactivity",
    title: "USER",
  ),
];