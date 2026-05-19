import 'package:flutter/material.dart';

class ControlledPageView extends StatefulWidget {
  const ControlledPageView({super.key});

  @override
  State<ControlledPageView> createState() => _ControlledPageViewState();
}

class _ControlledPageViewState extends State<ControlledPageView> {
  // ✅ Controller yaratish
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose(); // ⚠️ MUHIM: Memory leak oldini olish
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
        children: const [
          _Page(color: Colors.red,   number: 1),
          _Page(color: Colors.green, number: 2),
          _Page(color: Colors.blue,  number: 3),
        ],
      ),
      bottomNavigationBar: _buildIndicator(),
    );
  }

  Widget _buildIndicator() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: _currentPage == index ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: _currentPage == index ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        }),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final Color color;
  final int number;
  const _Page({required this.color, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          'Page $number',
          style: const TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}