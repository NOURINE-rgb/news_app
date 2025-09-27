import 'package:chip_list/chip_list.dart';
import 'package:clean_news_app/config/theme/app_colors.dart';
import 'package:clean_news_app/config/theme/styles_manager.dart';
import 'package:clean_news_app/config/theme/values_manager.dart';
import 'package:clean_news_app/features/daily_news/presentation/enums.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesChips extends ConsumerWidget {
  const CategoriesChips(
      {super.key,
      required this.categories,
      required this.onCategorySelected,
      required this.chipType});
  final List<String> categories;
  final void Function(String cateogry) onCategorySelected;
  final ChipType chipType;

  AutoDisposeStateProvider<int> _getProvider(ChipType chipType) {
    switch (chipType) {
      case ChipType.categoryHome:
        return selectedCategoryHomeProvider;
      case ChipType.categorySearch:
        return selectedCategorySearchProvider;
      case ChipType.country:
        return selectedCountryIndexProvider;
      case ChipType.sortBy:
        return selectedSortIndexProvider;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AutoDisposeStateProvider<int> provider = _getProvider(chipType);
    final selectedIdx = ref.watch(provider);
    return ChipList(
      listOfChipNames: categories,
      listOfChipIndicesCurrentlySelected: [selectedIdx],
      supportsMultiSelect: false,
      activeBgColorList: [AppColors.primary],
      activeTextColorList: [AppColors.textOnPrimary],
      inactiveBgColorList: [Colors.grey.shade200],
      inactiveTextColorList: [Colors.black],
      showCheckmark: false,
      spacing: AppSize.s4.r,
      style: get16MediumStyle(color: AppColors.textOnPrimary),
      extraOnToggle: (index) {
        onCategorySelected.call(categories[index]);
        ref.read(provider.notifier).state = index;
      },
    );
  }
}
