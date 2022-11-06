import 'package:dartz/dartz.dart';

import '../../../../core/usecase/errors/failures.dart';
import '../../../../core/usecase/i_usecase.dart';
import '../../data/models/choises.dart';
import '../../data/models/game_result.dart';

class GameResultUsecase implements IUsecase<String, Choises> {
  @override
  Future<Either<Failure, GameResult>> call(Choises params) async {
    try {
      final result = await GameResult(params);
      return Right(result);
    } on Exception {
      return Left(InvalidChoiseFailure());
    }
  }
}
