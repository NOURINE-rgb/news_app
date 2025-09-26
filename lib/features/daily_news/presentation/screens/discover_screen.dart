import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";

class DiscoverScreen extends ConsumerWidget {
  const DiscoverScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text("screen3"),
      ),
    );
  }
}
