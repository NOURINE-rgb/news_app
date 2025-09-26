import 'package:clean_news_app/config/theme/app_colors.dart';
import 'package:clean_news_app/config/theme/styles_manager.dart';
import 'package:clean_news_app/config/theme/values_manager.dart';
import 'package:clean_news_app/core/helpers/spacing.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import '../../../daily_news/domain/entities/article.dart';

class ArticleDetailScreen extends StatelessWidget {
  final ArticleEntity article;
  final bool isBookMarked;

  const ArticleDetailScreen(
      {super.key, required this.article, required this.isBookMarked});

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat.yMMMd().format(DateTime.parse(article.publishedAt));

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    article.imageUrl,
                    width: double.infinity,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 200.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppSize.s18.h,
                    left: AppSize.s16.w,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: AppColors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    top: AppSize.s18.h,
                    right: AppSize.s16.w,
                    child: IconButton(
                      icon: Icon(Icons.bookmark_border, color: AppColors.white),
                      onPressed: () {
                        // TODO: Handle bookmark
                      },
                    ),
                  ),
                ],
              ),

              // Content
              Padding(
                padding: EdgeInsets.all(AppPadding.p16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: get20BoldStyle(color: AppColors.textPrimary),
                    ),
                    verticalSpace(AppSize.s8.h),
                    Text(
                      article.description,
                      style: get16MediumStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                      ),
                    ),
                    verticalSpace(AppSize.s8.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: article.content
                                .replaceAll(RegExp(r'\[\+\d+ chars\]'), ""),
                            style: get16MediumStyle(
                              color: AppColors.textPrimary,
                              fontSize: 14,
                            ),
                          ),
                          if (article.content.contains("[+"))
                            TextSpan(
                              text: " Read More",
                              style: get16MediumStyle(
                                color: AppColors.primary,
                                fontSize: 14,
                              ).copyWith(
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  final url = Uri.parse(article.url);
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url,
                                        mode: LaunchMode.externalApplication);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                            ),
                        ],
                      ),
                    ),
                    verticalSpace(AppSize.s36),
                    Center(
                      child: Text(
                        "$formattedDate • ${article.author} • ${article.sourceName}",
                        style: get14MediumStyle(color: AppColors.textSecondary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
