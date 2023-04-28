import 'package:number_trivia/data/datasources/trivia_remote_datasource.dart';
import 'package:number_trivia/data/exceptions/exceptions.dart';
import 'package:number_trivia/domains/failures/failures.dart';
import 'package:number_trivia/domains/enitities/trivia_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia/domains/repositories/trivia_repo.dart';

class TriviaRepoImpl implements TriviaRepo {
  final TriviaRemoteDatasource triviaRemoteDatasource =
      TriviaRemoteDatasourceImpl();

  @override
  Future<Either<Failure, TriviaEntity>> getTriviaFromRemoteSource(
      int number) async {
    try {
      final result =
          await triviaRemoteDatasource.getTriviaRemoteFromDatasource(number);
      return right(result);
    } on ServerException {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, TriviaEntity>>
      getTriviaRandomFromRemoteSource() async {
    try {
      final result =
          await triviaRemoteDatasource.getTriviaRandomRemoteFromDatasource();
      return right(result);
    } on ServerException {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
