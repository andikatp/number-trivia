import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/domains/failures/failures.dart';
import 'package:number_trivia/domains/usecases/trivia_usecase.dart';
part 'trivia_state.dart';

const String _serverErrorMessage = 'An error on API, please try again later!';
const String _cacheErrorMessage = 'An error on cache, please try again later!';
const String _generalErrorMessage = 'Check your connection!';

class TriviaCubit extends Cubit<TriviaState> {
  TriviaCubit() : super(TriviaInitial());
  final TriviaUsecase triviaUsecase = TriviaUsecase();

  void onGetTriviaButtonPressedEvent(int number) async {
    emit(TriviaLoadingState());
    final result = await triviaUsecase.getTriviaNumber(number);
    result.fold(
        (failure) => emit(TriviaErrorState(message: _errorMessage(failure))),
        (trivia) => emit(TriviaLoadedState(trivia: trivia.trivia)));
  }

  void onGetTriviaRandomButtonPressedEvent() async {
    emit(TriviaLoadingState());
    final result = await triviaUsecase.getTriviaRandomNumber();
    result.fold(
        (failure) => emit(TriviaErrorState(message: _errorMessage(failure))),
        (trivia) => emit(TriviaLoadedState(trivia: trivia.trivia)));
  }

  String _errorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return _serverErrorMessage;
      case CacheFailure:
        return _cacheErrorMessage;
      default:
        return _generalErrorMessage;
    }
  }
}
