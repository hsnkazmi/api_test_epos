import 'package:apitestapp/data/network/BaseApiServices.dart';
import 'package:apitestapp/data/network/NetworkApiService.dart';
import 'package:apitestapp/model/movies_model.dart';
import 'package:apitestapp/res/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<MovieListModel> fetchMoviesList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
