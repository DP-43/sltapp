import 'package:slt/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/responsive.dart';
import '../widgets/feature_button.dart';
import 'consular_services.dart';
import 'employment_services.dart';

class EmbassyServices extends StatefulWidget {
  final String? selectedEmbassy;
  const EmbassyServices({super.key, this.selectedEmbassy});

  @override
  State<EmbassyServices> createState() => _EmbassyServicesState();
}

class _EmbassyServicesState extends State<EmbassyServices> {
  @override
  Widget build(BuildContext context) {
    Responsive().init(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          widget.selectedEmbassy ?? AppLocalizations.of(context)!.embassyServices,
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.setWidth(20),
              vertical: Responsive.setHeight(20),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.account_balance,
                  size: Responsive.setWidth(80),
                  color: AppColors.primary.withValues(alpha: 0.5),
                ),
                SizedBox(height: Responsive.setHeight(20)),
                Text(
                  "Welcome to ${widget.selectedEmbassy ?? AppLocalizations.of(context)!.embassyServices}",
                  style: AppTextStyles.embassyWelcome,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Responsive.setHeight(40)),
                FeatureButton(
                  title: AppLocalizations.of(context)!.consularServices,
                  icon: Icons.account_balance_outlined,
                  color: AppColors.primary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ConsularServices()),
                    );
                  },
                ),
                SizedBox(height: Responsive.setHeight(10)),
                FeatureButton(
                  title: AppLocalizations.of(context)!.employmentServices,
                  icon: Icons.account_balance_outlined,
                  color: AppColors.primary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EmploymentServices()),
                    );
                  },
                ),
                SizedBox(height: Responsive.setHeight(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
