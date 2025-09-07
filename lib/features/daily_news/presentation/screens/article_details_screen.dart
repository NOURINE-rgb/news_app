import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";

class ArticleDetailScreen extends ConsumerWidget {
  const ArticleDetailScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text("details screen"),
      ),
    );
  }
}
