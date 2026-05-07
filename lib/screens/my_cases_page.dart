import 'package:slt/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../models/case_model.dart';
import '../providers/cases_provider.dart';
import 'case_details_page.dart';
import '../utils/status_colors.dart';

class MyCasesPage extends StatefulWidget {
  const MyCasesPage({super.key});

  @override
  State<MyCasesPage> createState() => _MyCasesPageState();
}

class _MyCasesPageState extends State<MyCasesPage> {
  @override
  void initState() {
    super.initState();


    // Fetch cases when page opens only if not already loaded
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CasesProvider>();
      if (provider.cases.isEmpty && !provider.isLoading) {
        provider.fetchCases();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.myCasesTitle, style: AppTextStyles.appBarTitle),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.allSubmittedCases,
                style: AppTextStyles.sectionHeader,
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.trackStatusMsg,
                style: AppTextStyles.bodyText,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Consumer<CasesProvider>(
                  builder: (context, casesProvider, _) 
                  {
                    // loading stat
                    if (casesProvider.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // error state
                    if (casesProvider.hasError) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.error_outline, color: Colors.red, size: 48),
                            const SizedBox(height: 12),
                            Text(casesProvider.error ?? 'Something went wrong'),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: casesProvider.fetchCases,
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    }

                   
                    if (casesProvider.cases.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.folder_open, size: 64, color: Colors.grey),
                            SizedBox(height: 12),
                            Text(
                              'No cases submitted yet.',
                              style: TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    }

                    // loaded state
                    return ListView.builder(
                      itemCount: casesProvider.cases.length,
                      itemBuilder: (context, index) {
                        final CaseModel c = casesProvider.cases[index];
                        final Color statusColor = StatusColors.getColor(c.status);

                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CaseDetailsPage(caseId: c.id),
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: statusColor.withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        c.status,
                                        style: TextStyle(
                                          color: statusColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Text(
                                    c.date,
                                    style: AppTextStyles.dateLabel,
                                  ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                    'Case ID: ${c.id}',
                                    style: AppTextStyles.caseIdText,
                                  ),
                                const SizedBox(height: 4),
                                Text(
                                    'Category: ${c.category}',
                                    style: AppTextStyles.categoryText,
                                  ),
                                const Divider(height: 24),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.view,
                                      style: const TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.primary),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
