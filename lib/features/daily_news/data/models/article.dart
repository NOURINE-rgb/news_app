import 'package:clean_news_app/core/shared/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    required super.sourceName,
    required super.id,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.imageUrl,
    required super.publishedAt,
    required super.content,
  });
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      sourceName: json["source"]?["name"] ?? "",
      id : json["source"]["id"]?? "",
      author: json["author"] ?? "",
      title: json["title"],
      description: json["description"] ?? "",
      url: json["url"],
      imageUrl: json["urlToImage"] ?? "",
      publishedAt: json["publishedAt"] ?? "",
      content: json["content"] ?? "",
    );
  }
}

class NewsResponse{
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;
  const NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: (json["articles"] as List?)
          ?.map((article) => ArticleModel.fromJson(article))
          .toList() ?? [],
    );
  }
}