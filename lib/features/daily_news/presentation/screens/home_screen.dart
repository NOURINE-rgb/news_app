import 'package:clean_news_app/config/theme/color_manager.dart';
import 'package:clean_news_app/config/theme/font_manager.dart';
import 'package:clean_news_app/config/theme/values_manager.dart';
import 'package:clean_news_app/core/constants/strings_manager.dart';
import 'package:clean_news_app/core/helpers/extensions.dart';
import 'package:clean_news_app/core/helpers/spacing.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/providers.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/state/news_state.dart';
import 'package:clean_news_app/features/daily_news/presentation/widgets/category_chips.dart';
import 'package:clean_news_app/features/daily_news/presentation/widgets/recommended_card.dart';
import 'package:clean_news_app/features/daily_news/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final newsState = ref.watch(newsNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily News",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: ColorManager.primary, fontSize: FontSize.s26.sp)),
      ),
      body: _buildBody(newsState, context),
    );
  }
}

Widget _buildBody(NewsState newsState, BuildContext context) {
  if (newsState is NewsLoadingState) {
    return const Center(child: CircularProgressIndicator());
  } else if (newsState is NewsErrorState) {
    return Center(
      child: Text(
        newsState.failureMessage,
        style: TextStyle(color: ColorManager.error),
      ),
    );
  } else if (newsState is NewsLoadedState) {
    return _buildLoadedContent(newsState, context);
  }
  // i will replace it with building shimmer
  return const SizedBox.shrink();
}

Widget _buildLoadedContent(NewsLoadedState newsState, BuildContext context) {
  return SingleChildScrollView(
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
          // i will change this to send the selected category to the datasource folder
          SizedBox(height: 40.sp, child: const CategoriesChips()),
          
          SectionHeader(
              title: StringsManager.breakingNewsTitle, onSeeAllPressed: () {}),
        ],
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
          child: RecommendedNewsCard(article),
        );
      },
    ),
  );
}
