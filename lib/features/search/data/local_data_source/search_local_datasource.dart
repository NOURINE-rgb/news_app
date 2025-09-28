import 'package:clean_news_app/core/constants/storage_keys.dart';
import 'package:hive/hive.dart';

class SearchLocalDatasource {
  final Box box;
  const SearchLocalDatasource(this.box);
  Future<void> addToHistory(String query) async {
    
  }

  List<String> getHistorySearch() {
    final List<dynamic>? history = box.get(StorageKeys.searchHistory);
    if (history == null) return [];
    return history.cast<String>();
  }

  Future<void> deleteSearch(String query) async {
    final historyList = getHistorySearch();
    historyList.remove(query);
    await box.put(StorageKeys.searchHistory, historyList);
  }
}
