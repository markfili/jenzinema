import '../../../domain/repository/movies/movies_repository.dart';
import '../dio/api_client.dart';
import '../models/genres_data_response.dart';
import '../models/movies_data_response.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final ApiClient _apiClient;

  MoviesRepositoryImpl(this._apiClient);

  @override
  Future<MoviesDataResponse> fetchPopularMovies(int page) async {
    return MoviesDataResponse.fromJson(
      (await _apiClient.get('/movie/popular', queryParameters: {"page": page})).data,
    );
  }

  @override
  Future<GenresDataResponse> fetchGenres() async {
    return GenresDataResponse.fromJson(
      (await _apiClient.get('/genre/movie/list')).data,
    );
  }
}
