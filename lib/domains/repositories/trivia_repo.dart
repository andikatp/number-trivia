import 'package:dartz/dartz.dart';
import 'package:number_trivia/domains/enitities/trivia_entity.dart';
import 'package:number_trivia/domains/failures/failures.dart';

abstract class TriviaRepo {
  Future<Either<Failure, TriviaEntity>> getTriviaRandomFromRemoteSource();
  Future<Either<Failure, TriviaEntity>> getTriviaFromRemoteSource(int number);
}
