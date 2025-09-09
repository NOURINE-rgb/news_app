import 'package:clean_news_app/config/theme/color_manager.dart';
import 'package:clean_news_app/config/theme/font_manager.dart';
import 'package:clean_news_app/config/theme/values_manager.dart';
import 'package:clean_news_app/core/constants/constants_var.dart';
import 'package:clean_news_app/core/constants/strings_manager.dart';
import 'package:clean_news_app/core/helpers/extensions.dart';
import 'package:clean_news_app/core/helpers/spacing.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/providers.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/state/home/news_state.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/article_details_screen.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/see_all.dart';
import 'package:clean_news_app/features/daily_news/presentation/widgets/category_chips.dart';
import 'package:clean_news_app/features/daily_news/presentation/widgets/horizontal_news_card.dart';
import 'package:clean_news_app/features/daily_news/presentation/widgets/section_header.dart';
import 'package:clean_news_app/features/daily_news/presentation/widgets/shimmer/home_shimmer.dart';
import 'package:clean_news_app/features/daily_news/presentation/widgets/shimmer/vertical_news_shimmer.dart';
import 'package:clean_news_app/features/daily_news/presentation/widgets/vertical_news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../enums.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(newsNotifierProvider.notifier).loadAllNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daily News",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: ColorManager.primary, fontSize: FontSize.s26.sp),
        ),
      ),
      body: _buildBody(context, ref),
    );
  }
}

Widget _buildBody(BuildContext context, WidgetRef ref) {
  final newsState = ref.watch(newsNotifierProvider);
  if (newsState.isBreakingLoading && newsState.isRecommendedLoading) {
    return HomeShimmer();
  } else if (newsState.failureMessage != null &&
      newsState.recommendedArticles.isEmpty) {
    return _buildErrorState(newsState.failureMessage!, context, ref);
  } else if (newsState.breakingArticles.isNotEmpty ||
      newsState.recommendedArticles.isNotEmpty) {
    return _buildLoadedContent(newsState, context, ref);
  }
  return HomeShimmer();
}

Widget _buildLoadedContent(
    NewsState newsState, BuildContext context, WidgetRef ref) {
  final selectedCategory = ref.watch(selectedCategoryHomeProvider);
  return NotificationListener<ScrollNotification>(
    onNotification: (notification) {
      if (notification.metrics.pixels == notification.metrics.maxScrollExtent &&
          !newsState.isBreakingMoreLoading &&
          newsState.hasMoreBreaking) {
        ref
            .read(newsNotifierProvider.notifier)
            .loadMoreBreakingNews(ConstantsVar.categories[selectedCategory]);
      }
      return false;
    },
    child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppPadding.p16.sp, horizontal: AppPadding.p12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
                title: StringsManager.recommendedNewsTitle,
                onSeeAllPressed: () {}),
            _buildRecommendedNewsCarousel(newsState.recommendedArticles),
            verticalSpace(AppSize.s20.sp),
            SizedBox(
              height: 40.sp,
              child: CategoriesChips(
                categories: ConstantsVar.categories,
                onCategorySelected: (String category) {
                  ref
                      .read(newsNotifierProvider.notifier)
                      .loadBreakingNewsByCategory(category.toLowerCase());
                },
                chipType: ChipType.categoryHome,
              ),
            ),
            SectionHeader(
                title: StringsManager.breakingNewsTitle,
                onSeeAllPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SeeAllScreen(
                        news: newsState.breakingArticles,
                        title: StringsManager.breakingNewsTitle,
                        category: ConstantsVar.categories[selectedCategory],
                        page: newsState.breakingCurrentPage,
                      ),
                    ),
                  );
                }),
            newsState.isBreakingLoading
                ? Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: VerticalNewsCardShimmer(),
                  )
                : newsState.failureMessage == null
                    ? _buildBreakingNewsList(newsState)
                    : Center(
                        child: Text(
                          newsState.failureMessage!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildRecommendedNewsCarousel(List<ArticleEntity> news) {
  return SizedBox(
    height: AppSize.s220.sp,
    child: ListView.builder(
      itemCount: news.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final article = news[index];
        return Container(
          width: context.sizeWidth * 0.7,
          margin: EdgeInsets.only(
              right: AppMargine.m12.sp, bottom: AppMargine.m8.sp),
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ArticleDetailScreen(),
              ),
            ),
            child: HorizontalNewsCard(article),
          ),
        );
      },
    ),
  );
}

Widget _buildBreakingNewsList(NewsState state) {
  final length = state.breakingArticles.length;
  return ListView.separated(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: length + (state.isBreakingMoreLoading ? 1 : 0),
    separatorBuilder: (context, index) => verticalSpace(AppSize.s12.sp),
    itemBuilder: (context, index) {
      if (index >= length) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return InkWell(
          onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ArticleDetailScreen(),
                ),
              ),
          child: VerticalNewsCard(article: state.breakingArticles[index]));
    },
  );
}

Widget _buildErrorState(
    String failureMessage, BuildContext context, WidgetRef ref) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red[300],
          ),
          const SizedBox(height: 16),
          Text(
            'Oops! Something went wrong',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            failureMessage,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              ref.read(newsNotifierProvider.notifier).loadAllNews();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Try Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
