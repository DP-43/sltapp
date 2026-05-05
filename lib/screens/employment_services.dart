import 'package:slt/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/responsive.dart';
import '../widgets/feature_button.dart';

class EmploymentServices extends StatefulWidget {
  const EmploymentServices({super.key});

  @override
  State<EmploymentServices> createState() => _EmploymentServicesState();
}

class _EmploymentServicesState extends State<EmploymentServices> {
  @override
  Widget build(BuildContext context) {
    Responsive().init(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.employmentServices,
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.setWidth(20),
                vertical: Responsive.setHeight(1),
              ),
              child: Image.asset(
                'assets/images/solution.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: Responsive.setHeight(10)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.setWidth(20),
                vertical: Responsive.setHeight(1),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.availableServices,
                  style: AppTextStyles.sectionHeader,
                ),
              ),
            ),
            SizedBox(height: Responsive.setHeight(10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Responsive.setWidth(20)),
              child: Column(
                children: [
                  FeatureButton(
                    title: "SLBFE Registration",
                    icon: Icons.assignment_ind_outlined,
                    color: AppColors.primary,
                    onPressed: () {},
                  ),
                  FeatureButton(
                    title: "Recruitment Agents Job Orders",
                    icon: Icons.business_center_outlined,
                    color: AppColors.primary,
                    onPressed: () {},
                  ),
                  FeatureButton(
                    title: "Domestic Workers Private Requirements",
                    icon: Icons.emoji_people_outlined,
                    color: AppColors.primary,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
