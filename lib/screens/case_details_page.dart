import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_colors.dart';
import '../models/case_model.dart';
import '../providers/cases_provider.dart';
import '../utils/app_text_styles.dart';

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

  Color _statusColor(String status) {
    switch (status) {
      case 'Resolved':    return Colors.green;
      case 'Rejected':    return Colors.red;
      case 'In Progress': return Colors.purple;
      case 'Pending':     return Colors.blue;
      case 'Under Review':
      default:            return Colors.orange;
    }
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

            final Color statusColor = _statusColor(c.status);

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
                        const Divider(height: 32),

                        //Status badge
                        const Text('Status', style: AppTextStyles.detailCardLabel),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: statusColor),
                          ),
                          child: Text(
                            c.status.toUpperCase(),
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        const Text('Category', style: AppTextStyles.detailCardLabel),
                        const SizedBox(height: 8),
                        Text(
                          c.category,
                          style: AppTextStyles.bodyTextDark,
                        ),

                        const SizedBox(height: 24),

                       
                        const Text('Date Submitted', style: AppTextStyles.detailCardLabel),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today_outlined, size: 16, color: AppColors.primary),
                            const SizedBox(width: 8),
                            Text(
                              c.date,
                              style: AppTextStyles.bodyTextDark,
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

            
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
