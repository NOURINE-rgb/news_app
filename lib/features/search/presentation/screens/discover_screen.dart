import "package:clean_news_app/config/theme/app_colors.dart";
import "package:clean_news_app/config/theme/styles_manager.dart";
import "package:clean_news_app/config/theme/values_manager.dart";
import "package:clean_news_app/core/shared/widgets/vertical_news_card.dart";
import "package:clean_news_app/features/search/presentation/providers/notifiers/filter_news_notifier.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "search_screen.dart";

class DiscoverScreen extends ConsumerWidget {
  const DiscoverScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filterNewsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppPadding.p16.r),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SearchScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.1),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOutCubic,
                          )),
                          child: child,
                        ),
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 300),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p16, vertical: AppPadding.p12)
                    .r,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 12),
                    Text(
                      'Search news articles...',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Filter categories (horizontal scroll)
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                //TODO: here i will call the widget of chiplist
              ],
            ),
          ),

          if (state.isLoading) const LinearProgressIndicator(),

          if (state.error != null)
            Center(
              child: Text(
                state.error!,
                style: get16MediumStyle(color: AppColors.error),
                textAlign: TextAlign.center,
              ),
            ),

          // Filtered articles or default content
          Expanded(
            child: state.results.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.results.length,
                    itemBuilder: (context, index) {
                      final article = state.results[index];
                      return VerticalNewsCard(article: article);
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.article_outlined,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Discover trending news',
                          style:
                              get18MediumStyle(color: AppColors.textSecondary),
                        ),
                        Text(
                            'Filter by categories or search for specific topics',
                            style: get16MediumStyle(
                                color: AppColors.textSecondary)),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
