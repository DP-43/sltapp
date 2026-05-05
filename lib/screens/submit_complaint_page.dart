import 'package:slt/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'package:slt/providers/complaint_provider.dart';
import 'submit_complaint_page2.dart';
import '../utils/app_text_styles.dart';

class SubmitComplaintPage extends StatefulWidget {
  const SubmitComplaintPage({super.key});

  @override
  State<SubmitComplaintPage> createState() => _SubmitComplaintPageState();
}

class _SubmitComplaintPageState extends State<SubmitComplaintPage> {
  String? _selectedOption;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _passportController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _nicController.dispose();
    _passportController.dispose();
    super.dispose();
  }

  Widget _buildChoiceButton(String title) {
    final bool isSelected = _selectedOption == title;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedOption = title;
            if (_selectedOption == AppLocalizations.of(context)!.forMe) {

              //this get before data user entered in sign up page  (stroe in provider)
              
              final signUpProvider = context.read<SignUpProvider>();
              _firstNameController.text = signUpProvider.firstName;
              _lastNameController.text = signUpProvider.lastName;
              _mobileController.text = signUpProvider.mobile;
              _emailController.text = signUpProvider.email;
              _nicController.text = signUpProvider.nic;
              _passportController.text = signUpProvider.passport;
            } else {
              _firstNameController.clear();
              _lastNameController.clear();
              _mobileController.clear();
              _emailController.clear();
              _nicController.clear();
              _passportController.clear();
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primary, width: 1.5),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: isSelected ? Colors.white : AppColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.submitComplaintTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // Step Indicator
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.step1Of4,
                      style: AppTextStyles.stepIndicatorLabel,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 2, 149, 0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

             //for me 
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBFD9EB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.confidentialInfo,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF45606E)),
                  ),
                ),

                const SizedBox(height: 1),

                    // const Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text(
                    //     "Who are you submitting this for?",
                    //     style: TextStyle(
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.bold,
                    //       color: AppColors.textDark,
                    //     ),
                    //   ),
                    // ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    _buildChoiceButton(AppLocalizations.of(context)!.forMe),
                    const SizedBox(width: 16),
                    _buildChoiceButton(AppLocalizations.of(context)!.onBehalfOf),
                  ],
                ),

                if (_selectedOption != null) ...[
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _selectedOption == AppLocalizations.of(context)!.forMe
                          ? AppLocalizations.of(context)!.yourDetails
                          : AppLocalizations.of(context)!.complainantsDetails,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: _firstNameController,
                    hint: AppLocalizations.of(context)!.firstName,
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 12), 
                  CustomTextField(
                    controller: _mobileController,
                    hint: AppLocalizations.of(context)!.mobileNumber,
                    icon: Icons.phone,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: _emailController,
                    hint: AppLocalizations.of(context)!.emailAddress,
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: _passportController,
                    hint: AppLocalizations.of(context)!.passportNumber,
                    icon: Icons.book,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: _nicController,
                    hint: AppLocalizations.of(context)!.nicNumber,
                    icon: Icons.badge,
                  ),
                ],

                const SizedBox(height: 20),

                if (_selectedOption != null)
                  CustomButton(
                    text: AppLocalizations.of(context)!.nextBtn,
                    color: AppColors.primary,
                    onPressed: () {
                      context.read<ComplaintProvider>().updateStep1(
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        mobile: _mobileController.text,
                        email: _emailController.text,
                        passport: _passportController.text,
                        nic: _nicController.text,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubmitComplaintPage2(),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
