import '../../../../core/resources/data_state.dart';
import '../../data/data_sources/remote/news_api_service.dart';
import '../entities/article.dart';

abstract class ArticleRepository {

  // API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}