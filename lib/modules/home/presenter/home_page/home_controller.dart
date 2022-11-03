import 'package:flutter/cupertino.dart';
import 'dart:math';

import '../../models/choises.dart';

class HomeController extends ChangeNotifier {
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
      case Choises.pedra:
        return '👊';
      case Choises.papel:
        return '🖐';
      case Choises.tesoura:
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
    } else if (chosenAction == Choises.pedra) {
      if (computerAction == Choises.papel) {
        return 'You lose';
      } else {
        return 'You win';
      }
    } else if (chosenAction == Choises.papel) {
      if (computerAction == Choises.tesoura) {
        return 'You lose';
      } else {
        return 'You win';
      }
    } else if (chosenAction == Choises.tesoura) {
      if (computerAction == Choises.pedra) {
        return 'You lose';
      } else {
        return 'You win';
      }
    } else {
      return 'Error';
    }
  }
}
