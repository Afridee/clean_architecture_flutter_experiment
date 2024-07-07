import 'dart:io';
import 'package:learn_clean_architecture/core/resources/data_state.dart';
import 'package:learn_clean_architecture/features/daily_news/domain/entities/article.dart';
import '../../../../core/constants/constants.dart';
import '../../domain/repository/article_repository.dart';
import '../data_sources/remote/news_api_service.dart';
import '../models/article.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {

  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey:newsAPIKey,
        country:countryQuery,
        category:categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
            DioError(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioErrorType.response,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioError catch(e, stack){
      print("Shit went south");
      print(stack);
      return DataFailed(e);
    }
  }
}