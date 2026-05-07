import 'package:slt/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cases_provider.dart';
import '../utils/app_colors.dart';
import 'case_details_page.dart';
import 'submit_complaint_page.dart';
import 'my_cases_page.dart';
import '../utils/app_text_styles.dart';
import '../utils/status_colors.dart';
import '../widgets/custom_button.dart';

class ComplaintPortalPage extends StatefulWidget {
  const ComplaintPortalPage({super.key});

  @override
  State<ComplaintPortalPage> createState() => _ComplaintPortalPageState();
}

class _ComplaintPortalPageState extends State<ComplaintPortalPage> {
  @override
  void initState() {
    super.initState();
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
        title: Text(AppLocalizations.of(context)!.complaintPortalTitle, style: AppTextStyles.appBarTitle),
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
            
              IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        
                      //case summery left carrd
                        Expanded(
                          flex: 14, 
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withValues(alpha: 0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.caseSummary,
                                  style: AppTextStyles.cardTitle,
                                ),
                                const SizedBox(height: 16),
                                
                               
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!.activeUnsolved, 
                                            style: AppTextStyles.cardSubtitle,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 2),
                                          Consumer<CasesProvider>(
                                            builder: (context, cases, _) => Text(
                                              cases.isLoading ? '--' : cases.activeCount.toString(),
                                              style: AppTextStyles.highlightBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!.resolved, 
                                            style: AppTextStyles.cardSubtitle,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 2),
                                          Consumer<CasesProvider>(
                                            builder: (context, cases, _) => Text(
                                              cases.isLoading ? '--' : cases.resolvedCount.toString(),
                                              style: AppTextStyles.highlightBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        const SizedBox(width: 14),
                        
                        //report an issue right card
                        Expanded(
                          flex: 7, 
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.primary.withValues(alpha: 0.8), width: 1.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SubmitComplaintPage()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      
                                  //circle arround plus
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.add, size: 24, color: Colors.black87),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        AppLocalizations.of(context)!.reportIssue,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // latest updates
                  const SizedBox(height: 32),
                  Text(
                    AppLocalizations.of(context)!.latestCaseUpdates,
                    style: AppTextStyles.sectionHeader,
                  ),
                  const SizedBox(height: 16),

           // list of latest cases 
                  Expanded(
                    child: Consumer<CasesProvider>(
                      builder: (context, casesProvider, _) {
                        if (casesProvider.isLoading) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        final latestCases = casesProvider.cases.take(4).toList();
                        if (latestCases.isEmpty) {
                          return Center(
                            child: Text(
                              'No recent cases.',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: latestCases.length,
                          itemBuilder: (context, index) {
                            final c = latestCases[index];
                            final statusColor = StatusColors.getColor(c.status);

                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.04),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Issue ID: ${c.id}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        c.status,
                                        style: TextStyle(
                                          color: statusColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CaseDetailsPage(caseId: c.id),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.accentBlue.withValues(alpha: 0.1),
                                      foregroundColor: AppColors.accentBlue,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Text(AppLocalizations.of(context)!.view),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                
                const SizedBox(height: 20),
                
             
                CustomButton(
                  text: AppLocalizations.of(context)!.myCasesBtn,
                  color: AppColors.primary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyCasesPage()),
                    );
                  },
                ),
              ],
            ),
          ),
      ),
    );
  }
}
