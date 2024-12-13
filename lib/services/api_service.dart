import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class ApiService {
  final Dio api;

  /*
    Base URL and API key are contained in an .env file handling environment
    variables.
    It may contain sensitive information (such as an API key) or specific
    configurations (if our environment is debug / test / release) to be handled.

    The .env file is useful for both separating configuration from
    implementation and reducing the risk of exposing sensitive information.
    For this reason IT SHOULDN'T BE COMMITTED.
  */
  static final _baseURL = dotenv.env['BASE_URL'] ?? '';
  static final _apiKey = dotenv.env['API_KEY'] ?? '';

  ApiService(this.api) {
    api.options
      ..baseUrl = _baseURL
      ..queryParameters = {'api_key': _apiKey};
  }

  // Endpoints.
  Future<Response> getPopularMovies() => api.get('/movie/popular');
}
