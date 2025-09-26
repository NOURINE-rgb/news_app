import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'article.g.dart';
@HiveType(typeId: 0)
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
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String sourceName;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String title;
  @HiveField(5)
  final String url;
  @HiveField(6)
  final String imageUrl;
  @HiveField(7)
  final String publishedAt;
  @HiveField(8)
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
