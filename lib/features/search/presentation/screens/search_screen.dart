import 'package:clean_news_app/config/theme/app_colors.dart';
import 'package:clean_news_app/config/theme/styles_manager.dart';
import 'package:clean_news_app/config/theme/values_manager.dart';
import 'package:clean_news_app/core/helpers/spacing.dart';
import 'package:clean_news_app/core/shared/widgets/vertical_news_card.dart';
import 'package:clean_news_app/features/search/presentation/providers/notifiers/search_news_notifier.dart';
import 'package:clean_news_app/features/search/presentation/providers/states/search_news_state.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared/entities/article.dart';
import '../../../bookmark/presentation/screens/article_details_screen.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen>
    with TickerProviderStateMixin {
  late TextEditingController _searchController;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _searchController.addListener(_onSearchChanged);
    _animationController.forward();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text;
    setState(() {
      _isSearching = query.isNotEmpty;
    });

    //TODO: Filter history in real-time
  }

  void _onHistoryTap(String query) {
    _searchController.text = query;
    _performSearch(query);
  }

  void _performSearch(String query) {
    if (query.trim().isEmpty) return;
    ref.read(searchNewsProvider.notifier).search(query);
  }

  void _deleteHistoryItem(String query) {
    ref.read(searchNewsProvider.notifier).deleteFromHistory(query);
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchNewsProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                padding: EdgeInsets.all(AppPadding.p16.r),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(25).r,
                        ),
                        child: TextField(
                          controller: _searchController,
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'Search news articles...',
                            prefixIcon: Icon(Icons.search),
                          ),
                          onSubmitted: _performSearch,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (searchState.isLoading) const LinearProgressIndicator(),
            if (searchState.error != null)
              Container(
                padding: EdgeInsets.all(AppPadding.p16.r),
                child: Text(
                  searchState.error!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            Expanded(
              child: _isSearching && searchState.results.isNotEmpty
                  ? _buildSearchResults(searchState.results)
                  : _buildSearchHistory(searchState),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults(List<ArticleEntity> articles) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: AppSize.s12.h),
      padding: EdgeInsets.all(AppPadding.p16.r),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailScreen(article: article),
            ),
          ),
          child: Hero(
            tag: article.url,
            child: VerticalNewsCard(article: article),
          ),
        );
      },
    );
  }

  Widget _buildSearchHistory(SearchNewsState searchState) {
    // TODO: i will add here filteredhistory
    // || searchState.filteredHistory.isNotEmpty in the if statement
    if (!_isSearching) {
      return SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.r),
                child: Text(
                  _isSearching ? 'Matching searches' : 'Recent searches',
                  style: get16MediumStyle(color: AppColors.textPrimary),
                ),
              ),
              verticalSpace(AppSize.s8.h),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.r),
                  itemCount: searchState.history.length,
                  itemBuilder: (context, index) {
                    final query = searchState.history[index];
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 100 * index),
                      child: ListTile(
                        leading: Icon(Icons.history, color: Colors.grey),
                        title: Text(query,
                            style:
                                get14MediumStyle(color: AppColors.textPrimary)),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: AppSize.s20.r,
                          ),
                          onPressed: () => _deleteHistoryItem(query),
                        ),
                        onTap: () => _onHistoryTap(query),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: const Center(
          child: Text(
            'No matching searches found',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
