import 'package:flutter/material.dart';

class ComplaintProvider extends ChangeNotifier{

   bool _isLoading = false;
  String? _error;
  bool _isSuccess = false;  

  String _firstName = "";
   String _lastName = "";
  String _mobile = "";
  String _email = "";
  String _passport = "";
   String _nic = "";
  String _selectedCategory = "";
  String _expectedResolution = "";
  String _description = "";
  List<String> _selectedFiles = [];

  bool get isLoading => _isLoading;
  bool get hasError => _error != null;
  String? get error => _error;
   bool get isSuccess => _isSuccess;
  String get firstName => _firstName;

  String get lastName => _lastName;
  String get mobile => _mobile;
  String get email => _email;
  String get passport => _passport;
  String get nic => _nic;
  String get selectedCategory => _selectedCategory;
  String get expectedResolution => _expectedResolution;
   String get description => _description;
  List<String> get selectedFiles => _selectedFiles;
  
  
  void updateStep1({
     required String firstName,
    required String lastName,
    required String mobile,
    required String email,
    required String passport,
    required String nic,

  })
  {
    _firstName = firstName;
    _lastName = lastName;
    _mobile = mobile;
    _email = email;
    _passport = passport;
    _nic = nic;

    notifyListeners();
  }

  void updateStep2({
    required String selectedCategory,
    required String description,
    
  }){
    _selectedCategory = selectedCategory;
    _description = description;
    
    notifyListeners();
  }
  void updateStep3({
    required String expectedResolution,
    
  }){
    _expectedResolution = expectedResolution;
    
    notifyListeners();
  } 
  void updateStep4({
    required List<String> selectedFiles,
  }){
    _selectedFiles = selectedFiles;
    notifyListeners();
  }


    void addFile(String file){
    _selectedFiles.add(file);

    notifyListeners();
  }

   void removeFile(int index){
    _selectedFiles.removeAt(index);
    notifyListeners();
  }

  void clearAll(){
     _firstName = "";
    _lastName = "";
    _mobile = "";
    _email = "";
    _passport = "";
     _nic = "";
    _selectedCategory = "";
    _expectedResolution = "";
    _description = "";
    _selectedFiles = [];

    notifyListeners();
  }
   }