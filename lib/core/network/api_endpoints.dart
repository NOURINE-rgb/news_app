import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndoints {
  static String apiKey = dotenv.env["API_KEY"] ?? "";
  static String recommended =
      "/everything?q=trending%20OR%20popular&searchIn=title,description&language=en&sortBy=popularity&pageSize=8&apiKey=$apiKey";
  // Fallback to ensure we always have content for the carousel
  static String recommendedFallback =
      "/top-headlines?country=us&language=en&category=general&page=1&pageSize=8&apiKey=$apiKey";
  static String breaking(String category, int page) =>
      "/top-headlines?category=$category&language=en&page=$page&pageSize=8&apiKey=$apiKey";
  static String filter(String category, String country, String sortBy) =>
      "/top-headlines?category=$category&language=en&country=$country&sortBy=$sortBy&pageSize=8&apiKey=$apiKey";
  static String search(String query) =>
      "/everything?q=$query&language=en&pageSize=20&sortBy=publishedAt&apiKey=$apiKey";
}
