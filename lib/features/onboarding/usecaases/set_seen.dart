import 'package:clean_news_app/features/onboarding/data/local_data_source.dart';

class SetOnboardingSeen {
  final OnboardingLocalDataSource dataSource;
  SetOnboardingSeen(this.dataSource);

  Future<void> call() => dataSource.setOnboardingSeen();
}
