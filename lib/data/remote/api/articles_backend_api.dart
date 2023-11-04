import 'package:bab_alomda_assessment_flutter/data/remote/constants/api_endpoints.dart';
import 'package:bab_alomda_assessment_flutter/data/remote/dto/response/get_articles_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'articles_backend_api.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class IArticleApi {
  factory IArticleApi(Dio dio, {required String baseUrl}) = _IArticleApi;

  @GET("topstories/v2/{section}.json")
  Future<GetArticlesResponse> getArticles({
    @Path("section") required String section,
  });
}
