import 'package:flutter/material.dart';

class OnboardingModel {
  final String title;
  final String description;
  final String imagePath;
  final Color backgroundColor;
  final Color textColor;

  const OnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.backgroundColor,
    required this.textColor,
  });

  static const List<OnboardingModel> onboardingModels = [
    OnboardingModel(
      title: 'Xush kelibsiz!',
      description: "Eng yaxshi shpping tajribasini his eting",
      imagePath: "https://images.unsplash.com/photo-1441986300917-64674bd600d8",
      backgroundColor: Color(0xFF6C63FF),
      textColor: Colors.white,
    ),
    OnboardingModel(
      title: 'Tez yetkazib berish',
      description: "2 soatda eshigigizga yetkazib beramiz.",
      imagePath: "https://images.unsplash.com/photo-1522206024047-9c925421675b",
      backgroundColor: Color(0xFF43E97B),
      textColor: Colors.white,
    ),
    OnboardingModel(
      title: 'Xavfsiz to\'lov',
      description: '100% xavfsiz to\'lov tizimlari.',
      imagePath: "https://images.unsplash.com/photo-1607082349566-187342175e2f",
      backgroundColor: Color(0xFFFF6B6B),
      textColor: Colors.white,
    ),
  ];
}
