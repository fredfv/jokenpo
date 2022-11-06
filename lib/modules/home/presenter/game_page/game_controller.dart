import 'package:flutter/cupertino.dart';
import 'dart:math';

import '../../data/models/choises.dart';

class GameController extends ChangeNotifier {
  Choises? chosenAction;
  Choises? computerAction;
  String? result;
  String? iconChosenAction;
  String? iconComputerAction;
  Icon? iconResult;

  void chooseAction(Choises action) {
    chosenAction = action;
    iconChosenAction = _getIcon(action);

    var rng = Random();
    computerAction = Choises.values[rng.nextInt(Choises.values.length)];
    iconComputerAction = _getIcon(computerAction!);

    result = _getResult(action, computerAction!);
    iconResult = _getIconResult(result!);

    notifyListeners();
  }

  String? _getIcon(Choises action) {
    switch (action) {
      case Choises.rock:
        return '👊';
      case Choises.paper:
        return '🖐';
      case Choises.scissors:
        return '✌️';
      default:
        null;
    }
  }

  Icon? _getIconResult(String result) {
    switch (result) {
      case 'You win':
        return const Icon(CupertinoIcons.hand_thumbsup);
      case 'You lose':
        return const Icon(CupertinoIcons.hand_thumbsdown);
      case 'Draw':
        return const Icon(CupertinoIcons.hand_thumbsup_fill);
      default:
        null;
    }
  }

  String _getResult(Choises chosenAction, Choises computerAction) {
    if (chosenAction == computerAction) {
      return 'Draw';
    } else if (chosenAction == Choises.rock) {
      if (computerAction == Choises.paper) {
        return 'You lose';
      } else {
        return 'You win';
      }
    } else if (chosenAction == Choises.paper) {
      if (computerAction == Choises.scissors) {
        return 'You lose';
      } else {
        return 'You win';
      }
    } else if (chosenAction == Choises.scissors) {
      if (computerAction == Choises.rock) {
        return 'You lose';
      } else {
        return 'You win';
      }
    } else {
      return 'Error';
    }
  }
}
