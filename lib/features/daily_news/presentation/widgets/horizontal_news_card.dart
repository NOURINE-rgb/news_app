import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_news_app/config/theme/app_colors.dart';
import 'package:clean_news_app/config/theme/styles_manager.dart';
import 'package:clean_news_app/config/theme/values_manager.dart';
import 'package:clean_news_app/core/helpers/date_format.dart';
import 'package:clean_news_app/core/helpers/extensions.dart';
import 'package:clean_news_app/core/shared/widgets/shimmer_image.dart';
import 'package:clean_news_app/core/shared/entities/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalNewsCard extends StatelessWidget {
  const HorizontalNewsCard(this.article, {super.key});
  final ArticleEntity article;

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
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            !article.imageUrl.isNullOrEmpty()
                ? CachedNetworkImage(
                    imageUrl: article.imageUrl,
                    fit: BoxFit.cover,
                    height: AppSize.s220.h - 60.h,
                    width: double.infinity,
                    placeholder: (context, url) => ShimmerImage(),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.image_not_supported, size: 50.sp),
                    ),
                  )
                : Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 40.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ),
            Positioned(
              top: 120.h,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                color: AppColors.backgroundLight,
                padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p12, vertical: AppPadding.p4)
                    .r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      article.title,
                      style: get16SemiBoldStyle(
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(
                      child: Text(formatDate(article.publishedAt),
                          style:
                              get16MediumStyle(color: AppColors.textSecondary)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
