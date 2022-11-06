class GameResult {
  String _playerTwoChoose;
  String _playerOneChoose;
  String _message;

  String get playerTwoChoose => _playerTwoChoose;
  String get playerOneChoose => _playerOneChoose;
  String get message => _message;

  void setPlayerTwoChoose(String playerTwoChoose) => _playerTwoChoose = playerTwoChoose;
  void setPlayerOneChoose(String playerOneChoose) => _playerOneChoose = playerOneChoose;
  void setMessage(String message) => _message = message;

  GameResult({required String playerTwoChoose, required String playerOneChoose, required String message})
      : _playerTwoChoose = playerTwoChoose,
        _playerOneChoose = playerOneChoose,
        _message = message;

  factory GameResult.fromJson(Map<String, dynamic> json) {
    return GameResult(
      playerTwoChoose: json['playerTwoChoose'],
      playerOneChoose: json['playerOneChoose'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'playerTwoChoose': _playerTwoChoose,
      'playerOneChoose': _playerOneChoose,
      'message': _message,
    };
  }
}
