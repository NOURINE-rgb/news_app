import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomePageState();
}
// recomanded and breaking in the top
class _HomePageState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
        child: Text("screen1"),
      ),
    );
  }
}
