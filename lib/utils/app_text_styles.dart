import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'responsive.dart';


class AppTextStyles {

  //App Bar
  static TextStyle get appBarTitle => TextStyle(
    fontSize: Responsive.setFontSize(20),
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  //section Headings large one
  
  static TextStyle get pageTitle => TextStyle(
    fontSize: Responsive.setFontSize(30),
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  //section header inside a page body
  static TextStyle get sectionHeader => TextStyle(
    fontSize: Responsive.setFontSize(18),
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
    letterSpacing: 0.3,
  );

  /// subsection label  above a group of fields
  static TextStyle get fieldLabel => TextStyle(
    fontSize: Responsive.setFontSize(16),
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  //cards 
  static TextStyle get cardTitle => TextStyle(
    fontSize: Responsive.setFontSize(22),
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle get cardSubtitle => TextStyle(
    color: Colors.white.withValues(alpha: 0.85),
    fontSize: Responsive.setFontSize(12),
    fontWeight: FontWeight.w600,
  );

  //l arge bold number inID display
  static TextStyle get highlightBold => TextStyle(
    color: Colors.white,
    fontSize: Responsive.setFontSize(20),
    fontWeight: FontWeight.bold,
  );

  //body and descriptions
  static TextStyle get bodyText => TextStyle(
    fontSize: Responsive.setFontSize(14),
    color: Colors.grey.shade600,
    height: 1.4,
  );

  /// Body text on a dark/white card (case description, detail text)
  static TextStyle get bodyTextDark => TextStyle(
    fontSize: Responsive.setFontSize(14),
    color: Colors.grey.shade700,
    height: 1.6,
  );

  //small secondary labels
  //hint/subtitle under a page title (like"Enter your credentials")
  static TextStyle get subtitle => TextStyle(
    fontSize: Responsive.setFontSize(15),
    color: const Color.fromARGB(195, 0, 0, 0),
  );

  //timestamp /date label on cards
  static TextStyle get dateLabel => TextStyle(
    color: Colors.grey.shade500,
    fontSize: Responsive.setFontSize(12),
  );

  //"Case ID : CASE-2048" bold text
  static TextStyle get caseIdText => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  /// category line under case ID
  static TextStyle get categoryText => TextStyle(
    color: Colors.grey.shade600,
    fontSize: 14,
  );

  //step Indicators

  static const TextStyle stepIndicatorLabel = TextStyle(
    color: Color.fromARGB(255, 12, 174, 0),
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  //onboarding
  //ministry name title
  static TextStyle onboardingTitle(double screenWidth) => TextStyle(
    fontSize: screenWidth * 0.045,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  //Subtitle line
  static TextStyle onboardingSubtitle(double screenWidth) => TextStyle(
    fontSize: screenWidth * 0.035,
    color: Colors.black54,
  );

  //"Sponsored by"
  static TextStyle onboardingSponsored(double screenWidth) => TextStyle(
    fontSize: screenWidth * 0.03,
    color: Colors.black54,
    fontWeight: FontWeight.w500,
  );

  //Embassy welcome screen 
 
  static TextStyle get embassyWelcome => TextStyle(
    fontSize: Responsive.setFontSize(18),
    fontWeight: FontWeight.w600,
  );

  // buttons
  static TextStyle get buttonText => TextStyle(
    fontSize: Responsive.setFontSize(16),
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  //link and underlined text
  static TextStyle get linkText => TextStyle(
    fontSize: Responsive.setFontSize(15),
    color: const Color.fromARGB(195, 0, 0, 0),
    decoration: TextDecoration.underline,
  );

  // footer /privacy labels
  static TextStyle get footerLabel => TextStyle(
    color: Colors.green.shade800,
    fontWeight: FontWeight.w600,
    fontSize: Responsive.setFontSize(14),
  );

  //info box text
  static const TextStyle infoBannerText = TextStyle(
    fontSize: 12,
    color: Color(0xFF45606E),
  );

  //Profile Page
  static const TextStyle profileAppBarTitle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  //case details
  
  static TextStyle get caseReferenceLabel => TextStyle(
    color: Colors.grey.shade600,
    fontSize: 14,
  );

  //actual case ID (large, primary colour)
  static const TextStyle caseIdLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  //bold labels inside detail cards like "Status", "Category'
  static const TextStyle detailCardLabel = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
