import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_news_app/config/theme/color_manager.dart';
import 'package:clean_news_app/config/theme/font_manager.dart';
import 'package:clean_news_app/config/theme/styles_manager.dart';
import 'package:clean_news_app/config/theme/values_manager.dart';
import 'package:clean_news_app/core/helpers/date_format.dart';
import 'package:clean_news_app/core/helpers/extensions.dart';
import 'package:clean_news_app/core/helpers/spacing.dart';
import 'package:clean_news_app/core/widgets/shimmer_image.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalNewsCard extends StatelessWidget {
  const VerticalNewsCard(
      {super.key,
      this.showBookMark = false,
      required this.article,
      this.category = ""});
  final ArticleEntity article;
  final bool showBookMark;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        color: ColorManager.backgroundLight,
      ),
      height: (context.sizeHeight * 0.2).h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          article.imageUrl.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s12.sp),
                  child: CachedNetworkImage(
                    imageUrl: article.imageUrl,
                    height: context.sizeHeight * 0.18.h,
                    width: context.sizeHeight * 0.18.w,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => ShimmerImage(),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.image_not_supported, size: 50.sp),
                    ),
                  ),
                )
              : Container(
                  color: Colors.grey[300],
                  width: 150.w,
                  height: 150.h,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 40.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
          horizontalSpace(AppSize.s12.sp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (category.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    height: 30,
                    constraints: BoxConstraints(
                      minWidth: 60,
                      maxWidth: 120,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s12.r),
                      color: ColorManager.primaryLight,
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: getRegularStyle(color: ColorManager.primary),
                      ),
                    ),
                  ),
                if (category.isEmpty) verticalSpace(AppSize.s12),
                Text(
                  article.title,
                  style: getBoldStyle(
                      color: ColorManager.dark, fontSize: AppSize.s16.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(AppSize.s4.sp),
                Text(
                  article.content,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(AppSize.s4.sp),
                Text(
                  formatDate(article.publishedAt),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorManager.dark,
                        fontSize: FontSize.s14.sp,
                        fontWeight: FontManager.regular,
                      ),
                ),
              ],
            ),
          ),
          if (showBookMark)
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p8.sp, vertical: AppPadding.p16.sp),
              child: Icon(
                Icons.bookmark_border,
                color: ColorManager.primary,
                size: 24.sp,
              ),
            ),
        ],
      ),
    );
  }
}
