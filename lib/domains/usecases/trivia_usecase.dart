import 'package:dartz/dartz.dart';
import 'package:number_trivia/data/repositories/trivia_repo_impl.dart';
import 'package:number_trivia/domains/enitities/trivia_entity.dart';
import 'package:number_trivia/domains/failures/failures.dart';
import 'package:number_trivia/domains/repositories/trivia_repo.dart';

class TriviaUsecase {
  final TriviaRepo triviaRepo = TriviaRepoImpl();

  Future<Either<Failure, TriviaEntity>> getTriviaNumber(int number) async {
    return triviaRepo.getTriviaFromRemoteSource(number);
  }

  Future<Either<Failure, TriviaEntity>> getTriviaRandomNumber() async {
    return triviaRepo.getTriviaRandomFromRemoteSource();
  }
}
