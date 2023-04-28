import 'package:get_it/get_it.dart';
import 'package:number_trivia/data/datasources/trivia_remote_datasource.dart';
import 'package:number_trivia/data/repositories/trivia_repo_impl.dart';
import 'package:number_trivia/domains/repositories/trivia_repo.dart';
import 'package:number_trivia/domains/usecases/trivia_usecase.dart';
import 'package:number_trivia/presentations/pages/trivia/cubit/trivia_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => TriviaCubit(triviaUsecase: sl()));

  sl.registerFactory(() => TriviaUsecase(triviaRepo: sl()));

  sl.registerFactory<TriviaRepo>(
      () => TriviaRepoImpl(triviaRemoteDatasource: sl()));

  sl.registerFactory<TriviaRemoteDatasource>(
      () => TriviaRemoteDatasourceImpl(client: sl()));

  sl.registerFactory(() => http.Client());
}
