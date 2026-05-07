import 'package:flutter/material.dart';
import '../models/case_model.dart';

class CasesProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  List<CaseModel> _cases = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasError => _error != null;
  List<CaseModel> get cases => _cases;

  int get activeCount => _cases.where((c) => c.isActive).length;
  int get resolvedCount => _cases.where((c) => c.status == 'Resolved').length;

  
  CaseModel? getCaseById(String id) {
    try {
      return _cases.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }


  // Replace   delay  with a real API when  backend is ready
  Future<void> fetchCases() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      //call api here , fetch cases
      
      await Future.delayed(const Duration(milliseconds: 600)); 

      // those mock data , remove when api call
      _cases = [
        const CaseModel(
          id: 'CASE-2048',
          category: 'Breach of Employment Contract',
          description:
              'The employer has violated the terms of the employment contract by withholding agreed salary payments for three consecutive months.',
          date: '23 April 2026',
          time: '09:30 AM',
          status: 'Under Review',
        ),
        const CaseModel(
          id: 'CASE-2049',
          category: 'Lack of Communication',
          description:
              'No contact has been possible with the employer for over two weeks. The worker is isolated and unable to reach the recruitment agency.',
          date: '20 April 2026',
          time: '02:15 PM',
          status: 'Submitted',
        ),
        const CaseModel(
          id: 'CASE-2050',
          category: 'Repatriation Request',
          description:
              'The worker has requested immediate repatriation due to unsafe working conditions. All required documentation has been submitted.',
          date: '15 April 2026',
          time: '11:45 AM',
          status: 'Resolved',
        ),
        const CaseModel(
          id: 'CASE-2051',
          category: 'Stranded Worker',
          description:
              'Worker has been left stranded after the employer abandoned the worksite. Emergency shelter and travel assistance is required.',
          date: '10 April 2026',
          time: '04:00 PM',
          status: 'In Progress',
        ),
        const CaseModel(
          id: 'CASE-2052',
          category: 'Passport Retained',
          description:
              'The employer is illegally retaining the worker\'s passport and refusing to return it despite multiple requests.',
          date: '5 April 2026',
          time: '10:05 AM',
          status: 'Awaiting Info',
        ),
        const CaseModel(
          id: 'CASE-2053',
          category: 'Other',
          description:
              'General complaint submitted regarding unsafe accommodation conditions provided by the employer.',
          date: '1 April 2026',
          time: '08:20 AM',
          status: 'Closed',
        ),
      ];
     
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
