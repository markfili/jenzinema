import '../../../source/remote/models/movies_data_response.dart';

abstract class MoviesRepository {
  Future<MoviesDataResponse> fetchPopularMovies({int page});
}
