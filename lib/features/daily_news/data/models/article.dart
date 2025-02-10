import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';

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
