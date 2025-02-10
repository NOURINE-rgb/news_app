import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  const ArticleEntity({
    required this.sourceName,
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
    required this.content,
  });
  final String id;
  final String author;
  final String sourceName;
  final String description;
  final String title;
  final String url;
  final String imageUrl;
  final String publishedAt;
  final String content;
  @override
  List<Object ? > get props {
    return [
      id,
      author,
      sourceName,
      description, 
      url,
      imageUrl,
      publishedAt,
      content,
    ];
  }
}
