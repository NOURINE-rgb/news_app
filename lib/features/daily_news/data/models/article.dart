import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.sourceName,
    super.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.imageUrl,
    super.publishedAt,
    super.content,
  });
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      sourceName: json["source"]["name"] ?? "",
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
