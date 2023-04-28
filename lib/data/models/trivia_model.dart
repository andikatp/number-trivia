import 'package:equatable/equatable.dart';
import 'package:number_trivia/domains/enitities/trivia_entity.dart';

class TriviaModel extends TriviaEntity with EquatableMixin {
  const TriviaModel({required String trivia}) : super(trivia: trivia);
}
