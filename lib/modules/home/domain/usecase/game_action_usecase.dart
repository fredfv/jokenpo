import 'package:dartz/dartz.dart';
import 'package:jokenpo/core/usecase/errors/failures.dart';
import 'package:jokenpo/modules/home/data/models/game_result.dart';

import '../../../../core/usecase/i_usecase.dart';
import '../../data/models/choises.dart';

class GameActionUsecase implements IUsecase<GameResult, Choises> {
  @override
  Future<Either<Failure, GameResult>> call(Choises params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
