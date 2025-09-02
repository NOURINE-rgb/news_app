import 'package:chip_list/chip_list.dart';
import 'package:clean_news_app/config/theme/color_manager.dart';
import 'package:clean_news_app/config/theme/values_manager.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesChips extends ConsumerWidget {
  const CategoriesChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIdx = ref.watch(selectedCategoryIndexProvider);
    final List<String> categories = [
      "Technology",
      "General",
      "Sports",
      "Business",
      "Science",
      "Health",
    ];

    return ChipList(
      listOfChipNames: categories,
      listOfChipIndicesCurrentlySelected: [selectedIdx],
      supportsMultiSelect: false,
      activeBgColorList: [ColorManager.primary],
      activeTextColorList: [Colors.white],
      inactiveBgColorList: [Colors.grey.shade200],
      inactiveTextColorList: [Colors.black],
      showCheckmark: false,
      spacing: AppSize.s4,
      extraOnToggle: (index) {
        ref.read(selectedCategoryIndexProvider.notifier).state = index;
      },
    );
  }
}
