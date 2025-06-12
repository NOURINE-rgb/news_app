import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageNotifier extends StateNotifier<int> {
  HomePageNotifier() : super(0);
  void changeIndex(int index) {
    state = index;
  }
}

final homePageProvider = StateNotifierProvider<HomePageNotifier, int>(
  (ref) => HomePageNotifier(),
);
