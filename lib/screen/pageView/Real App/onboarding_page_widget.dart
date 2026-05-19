import 'package:flutter/material.dart';

import 'onboarding_model.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingModel page;

  const OnboardingPageWidget({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      color: page.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            page.imagePath,
            height: 300,
            errorBuilder: (_, __, ___) => Icon(
              Icons.image,
              size: 200,
              color: page.textColor.withValues(alpha: .5),
            ),
          ),

          SizedBox(height: 48),

          // Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              page.title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: page.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),

          // Description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              page.description,
              style: TextStyle(
                fontSize: 16,
                color: page.textColor.withValues(alpha: .8),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
