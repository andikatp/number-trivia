part of 'trivia_cubit.dart';

abstract class TriviaState extends Equatable {
  const TriviaState();

  @override
  List<Object> get props => [];
}

class TriviaInitial extends TriviaState {}

class TriviaLoadingState extends TriviaState {}

class TriviaLoadedState extends TriviaState {
  final String trivia;
  const TriviaLoadedState({required this.trivia});

  @override
  List<Object> get props => [trivia];
}

class TriviaErrorState extends TriviaState {
  final String message;
  const TriviaErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
