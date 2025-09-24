import 'package:clean_news_app/features/onboarding/data/local_data_source.dart';

class CheckOnboardingSeen {
  final OnboardingLocalDataSource dataSource;
  CheckOnboardingSeen(this.dataSource);

  bool call() => dataSource.isOnboardingSeen();
}