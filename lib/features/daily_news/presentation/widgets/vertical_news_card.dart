import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_news_app/config/theme/app_colors.dart';
import 'package:clean_news_app/config/theme/styles_manager.dart';
import 'package:clean_news_app/config/theme/values_manager.dart';
import 'package:clean_news_app/core/helpers/date_format.dart';
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
            color: AppColors.shadowColor.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        color: AppColors.backgroundLight,
      ),
      height: category.isEmpty ? 140.h : 160.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          article.imageUrl.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s12.sp),
                  child: CachedNetworkImage(
                    imageUrl: article.imageUrl,
                    width: 120.w,
                    height: 140.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => ShimmerImage(),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.lightGrey,
                      child:
                          Icon(Icons.image_not_supported, size: AppSize.s50.sp),
                    ),
                  ),
                )
              : Container(
                  color: AppColors.lightGrey,
                  width: 120.w,
                  height: 140.h,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 40.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
          horizontalSpace(AppSize.s12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (category.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(bottom: AppMargine.m4.r),
                    height: 30.h,
                    constraints: BoxConstraints(
                      minWidth: 60.w,
                      maxWidth: 120.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s12.r),
                      color: AppColors.primaryLight,
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: get14RegularStyle(color: AppColors.primary),
                      ),
                    ),
                  ),
                if (category.isEmpty) verticalSpace(AppSize.s12.h),
                Text(
                  article.title,
                  style: get16SemiBoldStyle(color: AppColors.textPrimary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(AppSize.s4.h),
                Text(
                  article.description,
                  style: get14MediumStyle(color: AppColors.textSecondary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(AppSize.s4.h),
                Text(
                  formatDate(article.publishedAt),
                  style: get14RegularStyle(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          if (showBookMark)
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p8.w, vertical: AppPadding.p16.h),
              child: Icon(
                Icons.bookmark_border,
                color: AppColors.primary,
                size: 24.sp,
              ),
            ),
        ],
      ),
    );
  }
}
