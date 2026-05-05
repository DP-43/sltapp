import 'package:flutter/material.dart';
import 'package:slt/l10n/app_localizations.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';

import '../widgets/common_background.dart';
import '../widgets/custom_text_field.dart';
import '../utils/responsive.dart';
import '../utils/app_text_styles.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();

}

class _PasswordResetPageState extends State<PasswordResetPage> {

  final _nicOrPassportController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _birthCityController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool isUserVerified = false;

  @override
  void dispose() {
    _nicOrPassportController.dispose();
    _newPasswordController.dispose();
    _birthCityController.dispose();
    _confirmPasswordController.dispose();

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
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: screenHeight * 0.12),
                            Text(
                              AppLocalizations.of(context)!.passwordResetTitle,
                              style: AppTextStyles.pageTitle,
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            Text(
                              isUserVerified ? AppLocalizations.of(context)!.resetNewPassword : AppLocalizations.of(context)!.securityQuestionsMsg,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.subtitle,
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            if (!isUserVerified)...[
                              CustomTextField(
                              controller: _nicOrPassportController,
                              hint: AppLocalizations.of(context)!.registeredNicOrPassport,
                              icon:Icons.badge_outlined,
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            CustomTextField(
                              controller: _birthCityController,
                              hint: AppLocalizations.of(context)!.birthCityQuestion,
                              icon:Icons.location_city,
                            ),
                          ] else ...[
                            CustomTextField(
                              controller: _newPasswordController,
                              hint: AppLocalizations.of(context)!.newPassword,
                              icon:Icons.lock,
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            CustomTextField(
                              controller: _confirmPasswordController,
                              hint: AppLocalizations.of(context)!.confirmPassword,
                              icon:Icons.lock,
                            ),
                          ] ,
                          
                            
                            SizedBox(height: screenHeight * 0.01),
                            CustomButton(
                              text: !isUserVerified ? AppLocalizations.of(context)!.verifyBtn : AppLocalizations.of(context)!.resetPasswordBtn,
                              onPressed: () {
                                if (!isUserVerified) {
                                  String nic = _nicOrPassportController.text.trim();
                                  String city = _birthCityController.text.trim();

                                  if (nic.isNotEmpty && city.isNotEmpty) {
                                    setState(() {
                                       isUserVerified = true; 
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(AppLocalizations.of(context)!.verifiedSuccess),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(AppLocalizations.of(context)!.fillAllFields),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                } else {
                                  String newPassword = _newPasswordController.text.trim();
                                  String confirmPassword = _confirmPasswordController.text.trim();

                                  if (newPassword.isNotEmpty && confirmPassword.isNotEmpty && newPassword == confirmPassword) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(AppLocalizations.of(context)!.passwordResetSuccess),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(AppLocalizations.of(context)!.passwordsMismatch),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              },
                  
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
                
              }
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