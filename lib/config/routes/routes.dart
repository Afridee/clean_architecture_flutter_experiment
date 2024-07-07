import 'package:flutter/material.dart';

import '../../features/daily_news/domain/entities/article.dart';

import '../../features/daily_news/presentation/pages/home/daily_news.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNews());

      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}