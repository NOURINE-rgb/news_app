import 'package:clean_news_app/config/theme/styles_manager.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/providers.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/state/see_all/see_all_notifier.dart';
import 'package:clean_news_app/features/bookmark/presentation/screens/article_details_screen.dart';
import 'package:clean_news_app/core/widgets/vertical_news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/theme/app_colors.dart';
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
        backgroundColor: AppColors.backgroundLight,
        title: Text(
          title,
          style: get22SemiBoldStyle(color: AppColors.textPrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p16, horizontal: AppPadding.p12)
            .r,
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels >=
                    notification.metrics.maxScrollExtent - 100 &&
                state.hasMore &&
                !state.isLoading) {
              ref
                  .read(seeAllNotifierProvider(params).notifier)
                  .loadMoreArticles();
            }
            return false;
          },
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: state.articles.length + (state.isLoading ? 1 : 0),
            separatorBuilder: (context, index) => verticalSpace(AppSize.s12.sp),
            itemBuilder: (context, index) {
              if (index >= state.articles.length) {
                return Padding(
                  padding: EdgeInsets.all(AppPadding.p16.r),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              final article = state.articles[index];
              return InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ArticleDetailScreen(
                      article: article,
                    ),
                  ),
                ),
                child: VerticalNewsCard(
                  article: article,
                  category: category,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
