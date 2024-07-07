import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_architecture/features/daily_news/presentation/bloc/remote/remote_article_event.dart';
import 'package:learn_clean_architecture/features/daily_news/presentation/bloc/remote/remote_article_state.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../domain/use_cases/get_article.dart';


class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent,RemoteArticlesState> {
  
  final GetArticleUseCase _getArticleUseCase;
  
  RemoteArticlesBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()){
    on <GetArticles> (onGetArticles); ///individual events should be registered with individual handlers
  }


  void onGetArticles(GetArticles event, Emitter < RemoteArticlesState > emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteArticlesDone(dataState.data!)
      );
    }
    
    if (dataState is DataFailed) {
      emit(
        RemoteArticlesError(dataState.error!)
      );
    }
  }
  
}