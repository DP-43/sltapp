

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../widgets/custom_button.dart';

import 'sign_in_page.dart';
import '../widgets/common_background.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    final double horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CommonBackground(
          child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: screenHeight * 0.05),
                            Image.asset(
                              'assets/images/emblem.png',
                              height: screenHeight * 0.15,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) => 
                                  const Icon(Icons.security, size: 80,),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            Text(
                              'MINISTRY OF FOREIGN AFFAIRS, FOREIGN EMPLOYMENT & TOURISM',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.onboardingTitle(screenWidth),
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            Text(
                              'CONSULAR AFFAIRS DIVISION',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.onboardingSubtitle(screenWidth),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              'SRI LANKA BUREAU OF FOREIGN EMPLOYMENT',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.onboardingSubtitle(screenWidth),
                            ),
                            SizedBox(height: screenHeight * 0.04),
                            CustomButton(
                              text: 'English', 
                              onPressed: () {
                                Provider.of<LanguageProvider>(context, listen: false).changeLanguage(const Locale('en'));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SignInPage()),
                                );
                              }, 
                              color: AppColors.primary
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            CustomButton(
                              text: 'සිංහල', 
                              onPressed: () {
                                Provider.of<LanguageProvider>(context, listen: false).changeLanguage(const Locale('si'));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SignInPage()),
                                );
                              }, 
                              color: AppColors.primary
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            CustomButton(
                              text: 'தமிழ்', 
                              onPressed: () {
                                Provider.of<LanguageProvider>(context, listen: false).changeLanguage(const Locale('ta'));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SignInPage()),
                                );
                              }, 
                              color: AppColors.primary
                            ),
                            SizedBox(height: screenHeight * 0.0001),
                            IgnorePointer(
                              child: Transform.translate(
                                offset: const Offset(0, -40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/sltlogo.webp',
                                      height: screenHeight * 0.27,
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) => 
                                          const Icon(Icons.image_not_supported, color: Colors.grey),
                                    ),
                                    Transform.translate(
                                      offset: Offset(0, -screenHeight * 0.050), 
                                      child: Column(
                                        children: [
                                          Text(
                                            'Sponsored by',
                                            style: AppTextStyles.onboardingSponsored(screenWidth),
                                          ),
                                          SizedBox(height: screenHeight * 0.005),
                                          Image.asset(
                                            'assets/images/Englishlogo.png',
                                            height: screenHeight * 0.05,
                                            fit: BoxFit.contain,
                                            errorBuilder: (context, error, stackTrace) => 
                                                const Icon(Icons.image_not_supported, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        ),
      ),
    );
  }
}