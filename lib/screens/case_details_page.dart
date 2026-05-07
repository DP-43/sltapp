import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_colors.dart';
import '../models/case_model.dart';
import '../providers/cases_provider.dart';
import '../utils/app_text_styles.dart';
import '../utils/status_colors.dart';

class CaseDetailsPage extends StatefulWidget {
  final String caseId;

  const CaseDetailsPage({super.key, required this.caseId});

  @override
  State<CaseDetailsPage> createState() => _CaseDetailsPageState();
}

class _CaseDetailsPageState extends State<CaseDetailsPage> {
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
        title: const Text('Case Details', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Consumer<CasesProvider>(
          builder: (context, casesProvider, _) {
            // Loading
            if (casesProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final CaseModel? c = casesProvider.getCaseById(widget.caseId);

         
            if (c == null) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.search_off, size: 64, color: Colors.grey),
                    const SizedBox(height: 12),
                    Text(
                      'Case "${widget.caseId}" not found.',
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              );
            }

            final Color statusColor = StatusColors.getColor(c.status);

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //case reference card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
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
                        Text(
                          'Case Reference',
                          style: AppTextStyles.caseReferenceLabel,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          c.id,
                          style: AppTextStyles.caseIdLarge,
                        ),
                        const Divider(height: 2),

                        // Status Timeline
                        
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Timeline dot & line indicator
                            Column(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: statusColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black.withValues(alpha: 0.3), 
                                      width: 4
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 2,
                                  height: 80,
                                  color: Colors.grey.shade300,
                                ),
                              ],
                            ),
                            const SizedBox(width: 16),

                            // timeline
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'Status Changed : ',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: c.status,
                                          style: TextStyle(color: statusColor),
                                        ),
                                      ],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Today (${c.date}) : ${c.time}',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Case moved from "Pending" to "${c.status}" after initial document checks.',
                                    style: AppTextStyles.bodyTextDark,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Incident Category : ', style: AppTextStyles.detailCardLabel),
                            Expanded(
                              child: Text(
                                c.category,
                                style: AppTextStyles.bodyTextDark,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),
 
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Case Submitted :', style: AppTextStyles.detailCardLabel),
                            
                            const SizedBox(width: 8),
                            Text(
                              '${c.date} at ${c.time}',
                              style: AppTextStyles.bodyTextDark,
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        const Text('Description', style: AppTextStyles.detailCardLabel),
                        const SizedBox(height: 8),
                        Text(
                          c.description,
                          style: AppTextStyles.bodyTextDark,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
