import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/modules/home/data/models/game_result.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final mockGameResult = GameResult(
    playerTwoChoose: 'rock',
    playerOneChoose: 'paper',
    message: 'Player One Win',
  );

  test('should be a subclass of GameResult entity', () async {
    // assert
    expect(mockGameResult, isA<GameResult>());
  });

  test('should return a valid model when the JSON is valid', () async {
    // arrange
    final Map<String, dynamic> jsonMap = {
      'playerTwoChoose': 'rock',
      'playerOneChoose': 'paper',
      'message': 'Player One Win',
    };
    // act
    final result = GameResult.fromJson(jsonMap);
    // assert
    expect(result.playerOneChoose, mockGameResult.playerOneChoose);
    expect(result.playerTwoChoose, mockGameResult.playerTwoChoose);
    expect(result.message, mockGameResult.message);
  });

  test('should return a valid JSON when the model is valid', () async {
    // arrange
    final Map<String, dynamic> jsonMap = {
      'playerTwoChoose': 'rock',
      'playerOneChoose': 'paper',
      'message': 'Player One Win',
    };
    // act
    final result = mockGameResult.toJson();
    // assert
    expect(result, jsonMap);
  });

  test('should set playerOneChoose and check if get returns same value', () async {
    // arrange
    const String playerOneChoose = 'paper';
    // act
    mockGameResult.setPlayerOneChoose(playerOneChoose);
    // assert
    expect(mockGameResult.playerOneChoose, playerOneChoose);
  });

  test('should set playerTwoChoose and check if get returns same value', () async {
    // arrange
    const String playerTwoChoose = 'rock';
    // act
    mockGameResult.setPlayerTwoChoose(playerTwoChoose);
    // assert
    expect(mockGameResult.playerTwoChoose, playerTwoChoose);
  });

  test('should set message and check if get returns same value', () async {
    // arrange
    const String message = 'Player One Win';
    // act
    mockGameResult.setMessage(message);
    // assert
    expect(mockGameResult.message, message);
  });
}
