import 'package:equatable/equatable.dart';

class TriviaEntity extends Equatable {
  final String trivia;
  const TriviaEntity({required this.trivia});

  @override
  List<Object?> get props => [trivia];
}
