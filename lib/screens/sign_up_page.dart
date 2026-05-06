import 'package:flutter/material.dart';
import 'package:slt/l10n/app_localizations.dart';
import 'package:slt/utils/app_colors.dart';
import 'package:slt/utils/responsive.dart';
import 'package:slt/widgets/custom_button.dart';
import 'package:slt/widgets/custom_text_field.dart';
import '../utils/app_text_styles.dart';

import 'sign_in_page.dart';
import 'package:slt/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/common_background.dart';
import 'package:country_picker/country_picker.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _nicController;
  late final TextEditingController _passportController;
  late final TextEditingController _countryController;
  late final TextEditingController _mobileController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmController;
  

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  String? _selectedCountry;

  @override
  void initState() {
    super.initState();

    // get draft value from provider then set to controllers
    final draft = context.read<SignUpProvider>();

    _firstNameController = TextEditingController(text: draft.draftFirstName);
    _lastNameController = TextEditingController(text: draft.draftLastName);
    _nicController = TextEditingController(text: draft.draftNic);
    _passportController = TextEditingController(text: draft.draftPassport);
     _selectedCountry = draft.draftCountry;
    _countryController = TextEditingController(text: _selectedCountry);
    _mobileController = TextEditingController(text: draft.draftMobile);
    _emailController = TextEditingController(text: draft.draftEmail);
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
   
    
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _nicController.dispose();
    _passportController.dispose();
    _countryController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    Responsive().init(context);
    final double horizontalPadding = Responsive.setWidth(19);

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
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: Responsive.setHeight(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Form Title properly scaling to screensize
                          Text(
                            AppLocalizations.of(context)!.createAccountBtn,
                            style: AppTextStyles.pageTitle,
                          ),

                          SizedBox(height: Responsive.setHeight(8)),

                          CustomTextField(
                            controller: _firstNameController,
                            hint: AppLocalizations.of(context)!.firstName,
                            icon: Icons.person,
                            margin: const EdgeInsets.only(bottom: 6.0),
                            onChanged: (val) => context
                                .read<SignUpProvider>()
                                .saveDraft(firstName: val),
                          ),
                          CustomTextField(
                            controller: _lastNameController,
                            hint: AppLocalizations.of(context)!.lastName,
                            icon: Icons.person_outline,
                            margin: const EdgeInsets.only(bottom: 6.0),
                            onChanged: (val) => context
                                .read<SignUpProvider>()
                                .saveDraft(lastName: val),
                          ),

                          CustomTextField(
                            controller: _nicController,
                            hint: AppLocalizations.of(context)!.nicNumber,
                            icon: Icons.badge,
                            margin: const EdgeInsets.only(bottom: 6.0),
                            onChanged: (val) => context
                                .read<SignUpProvider>()
                                .saveDraft(nic: val),
                          ),
                          CustomTextField(
                            controller: _passportController,
                            hint: AppLocalizations.of(context)!.passportNumber,
                            icon: Icons.book,
                            margin: const EdgeInsets.only(bottom: 6.0),
                            onChanged: (val) => context
                                .read<SignUpProvider>()
                                .saveDraft(passport: val),
                          ),
                          CustomTextField(
                            controller: _countryController,
                            hint: AppLocalizations.of(context)!.selectCountry,
                            icon: Icons.public,
                            readOnly: true,
                            suffixIconWidget: const Icon(Icons.arrow_drop_down, color: AppColors.textSecondary),
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: false,
                                onSelect: (Country country) {
                                  setState(() {
                                    _selectedCountry = country.name;
                                    _countryController.text = country.name;
                                    
                                    // uto set the country code
                                    _mobileController.text = '+${country.phoneCode} ';
                                  });
                                  context.read<SignUpProvider>().saveDraft(
                                    country: country.name,
                                    mobile: _mobileController.text,
                                  ); 
                                },
                              );
                            },
                            margin: const EdgeInsets.only(bottom: 8.0),
                          ),
                          CustomTextField(
                            controller: _mobileController,
                            hint: AppLocalizations.of(context)!.mobileNumber,
                            icon: Icons.phone,
                            margin: const EdgeInsets.only(bottom: 6.0),
                            onChanged: (val) => context
                                .read<SignUpProvider>()
                                .saveDraft(mobile: val),
                          ),
                          CustomTextField(
                            controller: _emailController,
                            hint: AppLocalizations.of(context)!.emailAddress,
                            icon: Icons.email,
                            margin: const EdgeInsets.only(bottom: 6.0),
                            onChanged: (val) => context
                                .read<SignUpProvider>()
                                .saveDraft(email: val),
                          ),

                          

                          CustomTextField(
                            controller: _passwordController,
                            hint: AppLocalizations.of(context)!.password,
                            icon: Icons.lock,
                            isPassword: true,
                            obscureText: _obscurePassword,
                            onToggleVisibility: () => setState(
                              () => _obscurePassword = !_obscurePassword,
                            ),
                            margin: const EdgeInsets.only(bottom: 8.0),
                          ),
                          CustomTextField(
                            controller: _confirmController,
                            hint: AppLocalizations.of(context)!.confirmPassword,
                            icon: Icons.lock_outline,
                            isPassword: true,
                            obscureText: _obscureConfirmPassword,
                            onToggleVisibility: () => setState(
                              () => _obscureConfirmPassword =
                                  !_obscureConfirmPassword,
                            ),
                            margin: const EdgeInsets.only(bottom: 10.0),
                          ),

                          SizedBox(height: Responsive.setHeight(8)),

                          Consumer<SignUpProvider>(
                            builder: (context, signUpState, child) {
                              return CustomButton(
                                text: AppLocalizations.of(context)!.registerBtn,
                                color: AppColors.primary,
                                isLoading: signUpState.isLoading,
                                onPressed: signUpState.isLoading
                                    ? null
                                    : () async {
                                        final firstName = _firstNameController
                                            .text
                                            .trim();
                                        final lastName = _lastNameController
                                            .text
                                            .trim();
                                        final nic = _nicController.text.trim();
                                        final passport = _passportController
                                            .text
                                            .trim();
                                        final mobile = _mobileController.text
                                            .trim();
                                        final email = _emailController.text
                                            .trim();
                                        final password =
                                            _passwordController.text;
                                        final confirmPassword =
                                            _confirmController.text;

                                        // this  for send data through out app (by using  provider)
                                        final success = await context
                                            .read<SignUpProvider>()
                                            .signUpUser(
                                              firstName: firstName,
                                              lastName: lastName,
                                              nic: nic,
                                              passport: passport,
                                              mobile: mobile,
                                              email: email,
                                              password: password,
                                              confirmPassword: confirmPassword,
                                              country: _selectedCountry,
                                            );

                                        if (context.mounted) {
                                          if (success) {
                                            context
                                                .read<SignUpProvider>()
                                                .clearDraft(); 
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  AppLocalizations.of(context)!.registerSuccess,
                                                ),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                            // Send to sign in page
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignInPage(),
                                              ),
                                            );
                                          } else if (signUpState.hasError) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  signUpState.error!,
                                                ),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                          
                                        }
                                      },
                              );
                            },
                          ),

                          SizedBox(height: Responsive.setHeight(32)),
                        ],

                        
                      ),
                    ),
                  ),
                );
              },
            ),

            Positioned(
              top: Responsive.setHeight(16),
              left: Responsive.setWidth(15),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.primary,
                ),
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
