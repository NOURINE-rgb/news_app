import 'package:clean_news_app/config/theme/app_colors.dart';
import 'package:clean_news_app/config/theme/styles_manager.dart';
import 'package:clean_news_app/features/bookmark/presentation/providers/bookmark_provider.dart';
import 'package:clean_news_app/features/bookmark/presentation/providers/bookmark_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/values_manager.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/vertical_news_card.dart';
import 'article_details_screen.dart';

class BookmarkScreen extends ConsumerWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkState = ref.watch(bookmarkProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Articles"),
      ),
      body: _build(bookmarkState , ref),
    );
  }

  Widget _build(BookmarkState state, WidgetRef ref) {
    if (state.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state.errorMessage != null) {
      return _buildErrorState(state.errorMessage!, ref);
    }
    if (state.bookmarkedArticles.isEmpty) {
      return Center(
        child: Text(
          "there is no saved article yet !",
          style: get16MediumStyle(color: AppColors.primary),
        ),
      );
    } else {
      return _buildLoadedContent(state);
    }
  }

  Widget _buildErrorState(String failureMessage, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p16.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.sp,
              color: AppColors.error,
            ),
            verticalSpace(AppSize.s16.h),
            Text(
              'Oops! Something went wrong',
              style: get16BoldStyle(color: AppColors.textPrimary),
            ),
            verticalSpace(AppSize.s8.h),
            Text(
              failureMessage,
              style: get18MediumStyle(color: AppColors.textPrimary),
              textAlign: TextAlign.center,
            ),
            verticalSpace(AppSize.s24.h),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(bookmarkProvider.notifier).getBookmarkedArticles();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadedContent(BookmarkState state) {
    final length = state.bookmarkedArticles.length;
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: length,
      separatorBuilder: (context, index) => verticalSpace(AppSize.s12.h),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ArticleDetailScreen(
                      article: state.bookmarkedArticles[index],
                    ),
                  ),
                ),
            child: VerticalNewsCard(
              article: state.bookmarkedArticles[index],
              showBookMark: true,
            ));
      },
    );
  }
}
