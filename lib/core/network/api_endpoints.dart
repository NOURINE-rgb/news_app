import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndoints {
  static String apiKey = dotenv.env["API_KEY"] ?? "";
  static String recommended =
      "/everything?q=recommended%20OR%20trending&sortBy=popularity&pageSize=8&apiKey=$apiKey";
  static String breaking(String category, int page) =>
      "/top-headlines?category=$category&page=$page&pageSize=8&apiKey=$apiKey";
  static String filter(String category, String country, String sortBy) =>
      "/top-headlines?category=$category&country=$country&sortBy=$sortBy&pageSize=8&apiKey=$apiKey";
  static String search(String query) =>
      "/everything?q=$query&pageSize=20&sortBy=publishedAt&apiKey=$apiKey";
}
