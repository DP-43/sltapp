import 'package:slt/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_dropdown.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';
import 'package:slt/providers/complaint_provider.dart';
import 'package:provider/provider.dart';
import 'submit_complaint_page4.dart';
import '../utils/app_text_styles.dart';



class SubmitComplaintPage3 extends StatefulWidget {
  const SubmitComplaintPage3({super.key});

  @override
  State<SubmitComplaintPage3> createState() => _SubmitComplaintPage3State();
}

class _SubmitComplaintPage3State extends State<SubmitComplaintPage3> {
  String? _selectedCategory;

    List<String> get _categories => [
    AppLocalizations.of(context)!.resRepatriationSalaries,
    AppLocalizations.of(context)!.resImmRepatriation,
    AppLocalizations.of(context)!.resRepatriation,
    AppLocalizations.of(context)!.resInfoEmployee,
    AppLocalizations.of(context)!.resInfoSituation,
    AppLocalizations.of(context)!.resInfoJail,
    AppLocalizations.of(context)!.resInfoAppeal,
    AppLocalizations.of(context)!.resImmSolutions,
    AppLocalizations.of(context)!.resChangePlace,
    AppLocalizations.of(context)!.resChangePlaceBackwages,
    AppLocalizations.of(context)!.resObtainWages,
    AppLocalizations.of(context)!.resObtainGratuity,
    AppLocalizations.of(context)!.resObtainBackwages,
    AppLocalizations.of(context)!.resObtainCompensation,
    AppLocalizations.of(context)!.resFacilitateComm,
    AppLocalizations.of(context)!.resContactDetails,
    AppLocalizations.of(context)!.catOther,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.selectResolutionTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.step3Of4,
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

                const SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context)!.expectedResolution,
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
                const SizedBox(height: 30),
                CustomButton(
                  text: AppLocalizations.of(context)!.nextBtn,
                  color: AppColors.primary,
                  onPressed: () {
                    context.read<ComplaintProvider>().updateStep3(
                      expectedResolution: _selectedCategory??"",
                     
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SubmitComplaintPage4(),
                      ),
                    );
                  },
                ),
              ],
            ),
           )
        )
        )
          
    );
  }
}
