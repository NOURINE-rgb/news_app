import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/article_details_screen.dart';
import 'package:clean_news_app/features/daily_news/presentation/widgets/vertical_news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/color_manager.dart';
import '../../../../config/theme/font_manager.dart';
import '../../../../config/theme/values_manager.dart';
import '../../../../core/helpers/spacing.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({required this.title, required this.news, super.key});
  final String title;
  final List<ArticleEntity> news;
  @override
  Widget build(BuildContext context) {
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
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: news.length,
          separatorBuilder: (context, index) => verticalSpace(AppSize.s12.sp),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ArticleDetailScreen(),
                ),
              ),
              child: VerticalNewsCard(article: news[index]),
            );
          },
        ),
      ),
    );
  }
}
