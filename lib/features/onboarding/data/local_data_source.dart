import 'package:hive/hive.dart';

import '../../../core/constants/storage_keys.dart';

class OnboardingLocalDataSource {
  final Box box;
  OnboardingLocalDataSource(this.box);

  Future<void> setOnboardingSeen() async {
    await box.put(StorageKeys.onboardingSeen, true);
  }

  bool isOnboardingSeen() {
    return box.get(StorageKeys.onboardingSeen, defaultValue: false);
  }
}
