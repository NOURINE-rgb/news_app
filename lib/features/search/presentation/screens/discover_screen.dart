import "package:clean_news_app/config/theme/app_colors.dart";
import "package:clean_news_app/config/theme/styles_manager.dart";
import "package:clean_news_app/config/theme/values_manager.dart";
import "package:clean_news_app/core/shared/widgets/vertical_news_card.dart";
import 'package:clean_news_app/features/daily_news/presentation/enums.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/providers.dart';
import "package:clean_news_app/features/search/presentation/providers/notifiers/filter_news_notifier.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "../../../../core/constants/constants_var.dart";
import "../../../../core/shared/widgets/category_chips.dart";
import "../../../bookmark/presentation/screens/article_details_screen.dart";
import "../../domain/usecases/filter_news_usecase.dart";
import "search_screen.dart";

class DiscoverScreen extends ConsumerStatefulWidget {
  const DiscoverScreen({super.key});

  @override
  ConsumerState<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends ConsumerState<DiscoverScreen> {
  bool _hasInitiallyLoaded = false;

  String _mapSortLabelToParam(String label) {
    switch (label.toLowerCase()) {
      case 'recent':
        return 'publishedAt';
      case 'trending':
        return 'relevancy';
      default:
        return 'popularity';
    }
  }

  void _triggerFilter({
    int? categoryIdx,
    int? countryIdx,
    int? sortIdx,
  }) {
    final categories = ConstantsVar.categories;
    final countries = ConstantsVar.countries;
    final sortOptions = ConstantsVar.sortBy;

    final selectedCategoryIndex =
        categoryIdx ?? ref.read(selectedCategorySearchProvider);
    final selectedCountryIndex =
        countryIdx ?? ref.read(selectedCountryIndexProvider);
    final selectedSortIndex = sortIdx ?? ref.read(selectedSortIndexProvider);

    final category = categories[selectedCategoryIndex!];
    final countryName = countries[selectedCountryIndex!];
    final sortLabel = sortOptions[selectedSortIndex!];

    final countryCode = ConstantsVar.countryCodes[countryName] ?? 'dz';
    final sortParam = _mapSortLabelToParam(sortLabel);

    ref.read(filterNewsProvider.notifier).filter(
          FilterNewsParams(
            category: category.toLowerCase(),
            country: countryCode,
            sortBy: sortParam,
          ),
        );
  }

  @override
  void initState() {
    super.initState();
    // Load initial data after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasInitiallyLoaded) {
        _hasInitiallyLoaded = true;
        _triggerFilter();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        const SearchScreen(),
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
                  horizontal: AppPadding.p16,
                  vertical: AppPadding.p12,
                ).r,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                  child: CategoriesChips(
                    categories: ConstantsVar.categories,
                    onCategorySelected: (String category) {
                      final idx = ConstantsVar.categories.indexOf(category);
                      _triggerFilter(categoryIdx: idx);
                    },
                    chipType: ChipType.categorySearch,
                  ),
                ),
                SizedBox(height: AppSize.s8.h),
                SizedBox(
                  height: 40.h,
                  child: CategoriesChips(
                    categories: ConstantsVar.countries,
                    onCategorySelected: (String country) {
                      final idx = ConstantsVar.countries.indexOf(country);
                      _triggerFilter(countryIdx: idx);
                    },
                    chipType: ChipType.country,
                  ),
                ),
                SizedBox(height: AppSize.s8.h),
                SizedBox(
                  height: 40.h,
                  child: CategoriesChips(
                    categories: ConstantsVar.sortBy,
                    onCategorySelected: (String sort) {
                      final idx = ConstantsVar.sortBy.indexOf(sort);
                      _triggerFilter(sortIdx: idx);
                    },
                    chipType: ChipType.sortBy,
                  ),
                ),
              ],
            ),
          ),

          if (state.isLoading) const LinearProgressIndicator(),

          if (state.error != null)
            Padding(
              padding: EdgeInsets.all(AppPadding.p16.r),
              child: Text(
                state.error!,
                style: get16MediumStyle(color: AppColors.error),
                textAlign: TextAlign.center,
              ),
            ),

          // Filtered articles or default content
          Expanded(
            child: state.results.isNotEmpty
                ? ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: AppSize.s12.h),
                    padding: EdgeInsets.all(AppPadding.p16.r),
                    itemCount: state.results.length,
                    itemBuilder: (context, index) {
                      final article = state.results[index];
                      return InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ArticleDetailScreen(
                              article: article,
                            ),
                          ),
                        ),
                        child: Hero(
                            tag: article.url,
                            child: VerticalNewsCard(article: article)),
                      );
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.article_outlined,
                          size: 64,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Discover trending news',
                          style:
                              get18MediumStyle(color: AppColors.textSecondary),
                        ),
                        Text(
                          'Filter by categories or search for specific topics',
                          style:
                              get16MediumStyle(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
