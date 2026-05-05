import 'package:slt/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_dropdown.dart';
import 'submit_complaint_page3.dart';
import 'package:provider/provider.dart';
import 'package:slt/providers/complaint_provider.dart';
import '../utils/app_text_styles.dart';



class SubmitComplaintPage2 extends StatefulWidget {
  const SubmitComplaintPage2({super.key});

  @override
  State<SubmitComplaintPage2> createState() => _SubmitComplaintPage2State();
}

class _SubmitComplaintPage2State extends State<SubmitComplaintPage2> {
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedCategory;

    List<String> get _categories => [
    AppLocalizations.of(context)!.catBreachContract,
    AppLocalizations.of(context)!.catLackCommunication,
    AppLocalizations.of(context)!.catSick,
    AppLocalizations.of(context)!.catJailed,
    AppLocalizations.of(context)!.catRemanded,
    AppLocalizations.of(context)!.catStranded,
    AppLocalizations.of(context)!.catProbHome,
    AppLocalizations.of(context)!.catDeath,
    AppLocalizations.of(context)!.catRetained,
    AppLocalizations.of(context)!.catOther,
  ];

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Step Indicator
                // Step Indicator
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.step2Of4,
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
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Privacy Message
                Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFBFD9EB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.confidentialInfo,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF45606E),
                        ),
                      ),
                    ),

                const SizedBox(height: 30),

                Text(
                  AppLocalizations.of(context)!.incidentCategory,
                  style: AppTextStyles.fieldLabel,
                ),
                const SizedBox(height: 5),
                CustomDropdown<String>(
                  hint: AppLocalizations.of(context)!.selectCategory,
                  icon: Icons.category,
                  items: _categories,
                  value: _selectedCategory,
                  onChanged: (val) => setState(() => _selectedCategory = val),
                  itemLabelBuilder: (item) => item,
                ),

                const SizedBox(height: 24),

                Text(
                  AppLocalizations.of(context)!.descriptionLabel,
                  style: AppTextStyles.fieldLabel,
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  controller: _descriptionController,
                  hint: AppLocalizations.of(context)!.incidentDescHint,
                  icon: Icons.description,
                  maxLines: 6,
                ),

                const SizedBox(height: 40),

                CustomButton(
                  text: AppLocalizations.of(context)!.nextBtn,
                  color: AppColors.primary,
                  onPressed: () {
                    context.read<ComplaintProvider>().updateStep2(
                      selectedCategory: _selectedCategory??"",
                      description: _descriptionController.text,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SubmitComplaintPage3(),
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
