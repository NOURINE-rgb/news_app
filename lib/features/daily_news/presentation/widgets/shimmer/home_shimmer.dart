import 'package:clean_news_app/config/theme/values_manager.dart';
import 'package:clean_news_app/core/helpers/extensions.dart';
import 'package:clean_news_app/core/helpers/spacing.dart';
import 'package:clean_news_app/features/daily_news/presentation/widgets/shimmer/vertical_news_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(AppPadding.p16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionHeader(),
            verticalSpace(AppSize.s12.h),
            SizedBox(
              height: 230.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, __) => Container(
                  width: context.sizeWidth * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
            verticalSpace(AppSize.s20),

            // Category chips row
            SizedBox(
              height: AppSize.s36.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (_, __) => horizontalSpace(AppSize.s8.w),
                itemBuilder: (_, __) => Container(
                  width: 90.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
            ),
            verticalSpace(AppSize.s20.h),
            sectionHeader(),
            verticalSpace(AppSize.s12.h),
            VerticalNewsCardShimmer(),
          ],
        ),
      ),
    );
  }
}

Widget sectionHeader() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(height: 25.h, width: 150.w, color: Colors.white),
        Container(height: 20.h, width: 70.w, color: Colors.white),
      ],
    );
