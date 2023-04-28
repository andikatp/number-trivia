import 'package:flutter/material.dart';
import 'package:number_trivia/data/exceptions/exceptions.dart';

import '../models/trivia_model.dart';
import 'package:http/http.dart' as http;

abstract class TriviaRemoteDatasource {
  Future<TriviaModel> getTriviaRemoteFromDatasource(int number);
  Future<TriviaModel> getTriviaRandomRemoteFromDatasource();
}

class TriviaRemoteDatasourceImpl implements TriviaRemoteDatasource {
  @override
  Future<TriviaModel> getTriviaRandomRemoteFromDatasource() async {
    final response =
        await http.get(Uri.parse('http://numbersapi.com/random/trivia'));
    debugPrint(response.body);
    if (response.statusCode != 200) {
      throw ServerException();
    }
    return TriviaModel(trivia: response.body);
  }

  @override
  Future<TriviaModel> getTriviaRemoteFromDatasource(int number) async {
    final response = await http.get(Uri.parse('http://numbersapi.com/$number'));
    debugPrint(response.body);
    if (response.statusCode != 200) {
      throw ServerException();
    }
    return TriviaModel(trivia: response.body);
  }
}
