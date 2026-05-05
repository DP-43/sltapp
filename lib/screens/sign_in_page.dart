import 'package:flutter/material.dart';
import 'package:slt/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../utils/responsive.dart';

import 'sign_up_page.dart';
import 'main_screen.dart';
import '../widgets/common_background.dart';
import 'password_reset_page.dart';
import '../utils/app_text_styles.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _nicOrPassportController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nicOrPassportController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    final double horizontalPadding = screenWidth * 0.05;

    Responsive().init(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CommonBackground(
          child: Stack(
            children: [
              LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: screenHeight * 0.12),
                            Text(
                              AppLocalizations.of(context)!.signInTitle,
                              style: AppTextStyles.pageTitle,
                            ),
                            SizedBox(height: screenHeight * 0.05),
                            Text(
                              AppLocalizations.of(context)!.enterCredentials,
                              style: AppTextStyles.subtitle,
                            ),
                            SizedBox(height: screenHeight * 0.03),

                            CustomTextField(
                              controller: _nicOrPassportController,
                              hint: AppLocalizations.of(context)!.enterNic,
                              icon: Icons.badge_outlined,
                              margin: const EdgeInsets.only(bottom: 10.0),
                            ),
                            
                            CustomTextField(
                              controller: _passwordController,
                              hint: AppLocalizations.of(context)!.password,
                              icon: Icons.lock_outline,
                              isPassword: true,
                              obscureText: _obscurePassword,
                              onToggleVisibility: () => setState(() => _obscurePassword = !_obscurePassword),
                              margin: const EdgeInsets.only(bottom: 16.0),
                            ),
                            
                            SizedBox(height: screenHeight * 0.03),

                          
                            Consumer<AuthProvider>(
                              builder: (context, authState, child) {
                                return CustomButton(
                                  text: AppLocalizations.of(context)!.signInBtn,

                                
                                  isLoading: authState.isLoading, 
                                  
                                  onPressed: authState.isLoading ? () {} : () async {
                                    final credentials = _nicOrPassportController.text;
                                    final pwd = _passwordController.text;

                                    
                                    final success = await context.read<AuthProvider>().signIn(credentials, pwd);
                                    
                                    if (context.mounted) {
                                      if (success) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text("Sign in successful!"),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                     
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => const MainScreen()),
                                        );
                                      } else if (authState.hasError) {
                                  
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(authState.error!),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  color: AppColors.primary,
                                );
                              }
                            ),
                            
                            SizedBox(height: screenHeight * 0.01),
                            
                            CustomButton(
                              text: AppLocalizations.of(context)!.createAccountBtn,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                                );
                              }, 
                              color: AppColors.accentBlue, 
                            ),
                             SizedBox(height: screenHeight * 0.03),
                            
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const PasswordResetPage()),
                                );
                              },
                              child: Text(
                                AppLocalizations.of(context)!.forgotPassword,
                                style: AppTextStyles.linkText,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              top: screenHeight * 0.02,
              left: screenWidth * 0.04,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.primary),
                onPressed: () => Navigator.of(context).pop(), 
              ),
            ),
              ],
            ),
          ),
      ),
    );
  }
}
