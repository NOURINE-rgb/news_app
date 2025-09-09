import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/providers.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/state/see_all/see_all_notifier.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/article_details_screen.dart';
import 'package:clean_news_app/features/daily_news/presentation/widgets/vertical_news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/theme/color_manager.dart';
import '../../../../config/theme/font_manager.dart';
import '../../../../config/theme/values_manager.dart';
import '../../../../core/helpers/spacing.dart';

class SeeAllScreen extends ConsumerWidget {
  const SeeAllScreen(
      {required this.title,
      required this.news,
      required this.page,
      required this.category,
      super.key});
  final String title;
  final List<ArticleEntity> news;
  final int page;
  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params =
        SeeAllParams(initialNews: news, category: category, currentPage: page);
    final state = ref.watch(seeAllNotifierProvider(params));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.backgroundLight,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: ColorManager.textPrimary, fontSize: FontSize.s26.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p16, horizontal: AppPadding.p12),
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels ==
                    notification.metrics.maxScrollExtent &&
                state.hasMore &&
                !state.isLoading) {
              ref
                  .read(seeAllNotifierProvider(SeeAllParams(
                          initialNews: news,
                          category: category,
                          currentPage: page))
                      .notifier)
                  .loadMoreArticles();
            }
            return false;
          },
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: news.length + (state.isLoading ? 1 : 0),
            separatorBuilder: (context, index) => verticalSpace(AppSize.s12.sp),
            itemBuilder: (context, index) {
              if (index < news.length) {
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ArticleDetailScreen(),
                    ),
                  ),
                  child: VerticalNewsCard(article: news[index]),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
