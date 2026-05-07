import 'dart:async';
import 'package:flutter/material.dart';


class AuthProvider extends ChangeNotifier {

  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasError => _error != null;


  Future<bool> signIn(String nicOrPassport, String password) async {

    _isLoading = true;
    _error = null;
    notifyListeners(); 

    try {
    
      await Future.delayed(const Duration(seconds: 2)); // replace this with http request to the backend
      
  
      if (nicOrPassport.isEmpty || password.isEmpty) {
        throw Exception("Please enter both credentials.");
      }
    
      if (password != '1234') {
        throw Exception("Invalid credentials! Try again.");
      }
      
   
      _isLoading = false;
      notifyListeners();
      return true;
      
    } catch (e) {

      _isLoading = false;
      _error = e.toString().replaceAll('Exception: ', ''); 
      notifyListeners();
      return false;
    }
  }
}

class SignUpProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  // fields what store user data in sign up page and this gives to complain page
  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _mobile = "";
  String _nic = "";
  String _passport = "";

  // give acces to read data to another pages
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasError => _error != null;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get mobile => _mobile;
  String get nic => _nic;
  String get passport => _passport;

  // Draft fields save whn user tyoping
  String draftFirstName = "";
  String draftLastName  = "";
  String draftNic       = "";
  String draftPassport  = "";
  String draftMobile    = "";
  String draftEmail     = "";
  String? draftCountry;

  
  void saveDraft({
    String? firstName,
    String? lastName,
    String? nic,
    String? passport,
    String? mobile,
    String? email,
    String? country,
  }) {
    if (firstName != null) draftFirstName = firstName;
    if (lastName  != null) draftLastName  = lastName;
    if (nic       != null) draftNic       = nic;
    if (passport  != null) draftPassport  = passport;
    if (mobile    != null) draftMobile    = mobile;
    if (email     != null) draftEmail     = email;
    if (country   != null) draftCountry   = country;
    
  }

  
  void clearDraft() {
    draftFirstName = "";
    draftLastName  = "";
    draftNic       = "";
    draftPassport  = "";
    draftMobile    = "";
    draftEmail     = "";
    draftCountry   = null;
    notifyListeners();
  }

// when user rreister t=it will store data to this variables
  Future<bool> signUpUser({
    required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    required String nic,
    required String passport,
    required String password,
    required String confirmPassword,
    String? country,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2)); // replace this with http request to the backend

//       final response = await http.post(
//   Uri.parse('https://your-api.com/register'),
//   body: { 'first_name': firstName, ... },
// );

    
      if (firstName.isEmpty || lastName.isEmpty || password.isEmpty) {
        throw Exception("Please fill out all required fields.");
      }
      
      if (nic.isEmpty && passport.isEmpty) {
        throw Exception("Please provide either your NIC or Passport.");
      }

  
      if (password != confirmPassword) {
        throw Exception("Passwords do not match!");
      }

      //store success data
      _firstName = firstName;
      _lastName = lastName;
      _email = email;
      _mobile = mobile;
      _nic = nic;
      _passport = passport;

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _error = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
      return false; 
    }
  }
}
