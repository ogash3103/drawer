import 'package:flutter/material.dart';
import 'onboarding_model.dart';
import 'onboarding_page_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  int currentPage = 0;
  final int totalPages = OnboardingModel.onboardingModels.length;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onNext() {
    if (currentPage < totalPages - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToHome();
    }
  }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: totalPages,
            onPageChanged: (index) => setState(() => currentPage = index),
            itemBuilder: (context, index) {
              return OnboardingPageWidget(
                page: OnboardingModel.onboardingModels[index],
              );
            },
          ),

          // skip button - yuqri o'ngda
          Positioned(
            top: 48,
            right: 16,
            child: TextButton(
              onPressed: _navigateToHome,
              child: Text('Skip', style: TextStyle(color: Colors.white)),
            ),
          ),

          // Pastki qism — indicator va button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomSection(),
          ),
        ],
      ),
    );
  }
  Widget _buildBottomSection() {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 16, 24, 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Dot indicators
          Row(
            children: List.generate(totalPages, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: EdgeInsets.only(right: 8),
                width: currentPage == index ? 28 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: currentPage == index
                      ? Colors.white
                      : Colors.white.withValues(alpha: .4),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),

          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: currentPage == totalPages - 1
                ? ElevatedButton(
              onPressed: _onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Boshlash'),
            )
                : FloatingActionButton(
              key: ValueKey("next"),
              onPressed: _onNext,
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_forward, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}


