import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_si.dart';
import 'app_localizations_ta.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('si'),
    Locale('ta'),
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @embassyServices.
  ///
  /// In en, this message translates to:
  /// **'Embassy Services'**
  String get embassyServices;

  /// No description provided for @selectEmbassy.
  ///
  /// In en, this message translates to:
  /// **'Select Embassy'**
  String get selectEmbassy;

  /// No description provided for @abuDhabiEmbassy.
  ///
  /// In en, this message translates to:
  /// **'Abu Dhabi Embassy'**
  String get abuDhabiEmbassy;

  /// No description provided for @consularServices.
  ///
  /// In en, this message translates to:
  /// **'Consular Services'**
  String get consularServices;

  /// No description provided for @employmentServices.
  ///
  /// In en, this message translates to:
  /// **'Employment and Services'**
  String get employmentServices;

  /// No description provided for @appointments.
  ///
  /// In en, this message translates to:
  /// **'Appointments'**
  String get appointments;

  /// No description provided for @passportServices.
  ///
  /// In en, this message translates to:
  /// **'Passport Services'**
  String get passportServices;

  /// No description provided for @birthRegistration.
  ///
  /// In en, this message translates to:
  /// **'Birth Registration'**
  String get birthRegistration;

  /// No description provided for @availableServices.
  ///
  /// In en, this message translates to:
  /// **'Available Services'**
  String get availableServices;

  /// No description provided for @complaintPortalTitle.
  ///
  /// In en, this message translates to:
  /// **'Complaint Portal'**
  String get complaintPortalTitle;

  /// No description provided for @myCasesTitle.
  ///
  /// In en, this message translates to:
  /// **'My Cases'**
  String get myCasesTitle;

  /// No description provided for @addEvidenceTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Evidence'**
  String get addEvidenceTitle;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpTitle;

  /// No description provided for @caseSummary.
  ///
  /// In en, this message translates to:
  /// **'Case Summary'**
  String get caseSummary;

  /// No description provided for @activeUnsolved.
  ///
  /// In en, this message translates to:
  /// **'Active (Unsolved)'**
  String get activeUnsolved;

  /// No description provided for @resolved.
  ///
  /// In en, this message translates to:
  /// **'Resolved'**
  String get resolved;

  /// No description provided for @reportIssue.
  ///
  /// In en, this message translates to:
  /// **'Report Issue'**
  String get reportIssue;

  /// No description provided for @latestCaseUpdates.
  ///
  /// In en, this message translates to:
  /// **'Latest Case Updates'**
  String get latestCaseUpdates;

  /// No description provided for @allSubmittedCases.
  ///
  /// In en, this message translates to:
  /// **'All Submitted Cases'**
  String get allSubmittedCases;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @myCasesBtn.
  ///
  /// In en, this message translates to:
  /// **'My Cases'**
  String get myCasesBtn;

  /// No description provided for @submitComplaintBtn.
  ///
  /// In en, this message translates to:
  /// **'Submit Complaint'**
  String get submitComplaintBtn;

  /// No description provided for @browseFilesBtn.
  ///
  /// In en, this message translates to:
  /// **'Browse Files'**
  String get browseFilesBtn;

  /// No description provided for @stopRecordingBtn.
  ///
  /// In en, this message translates to:
  /// **'Stop Recording'**
  String get stopRecordingBtn;

  /// No description provided for @continueBtn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueBtn;

  /// No description provided for @privacyMessage.
  ///
  /// In en, this message translates to:
  /// **'We protect and hide your privacy.'**
  String get privacyMessage;

  /// No description provided for @clickToUpload.
  ///
  /// In en, this message translates to:
  /// **'Click to upload files'**
  String get clickToUpload;

  /// No description provided for @fileFormats.
  ///
  /// In en, this message translates to:
  /// **'PNG, JPG, PDF, M4A (Max 5MB)'**
  String get fileFormats;

  /// No description provided for @recording.
  ///
  /// In en, this message translates to:
  /// **'Recording...'**
  String get recording;

  /// No description provided for @selectEvidenceType.
  ///
  /// In en, this message translates to:
  /// **'Select Evidence Type'**
  String get selectEvidenceType;

  /// No description provided for @trackStatusMsg.
  ///
  /// In en, this message translates to:
  /// **'Track the status of your reported issues below.'**
  String get trackStatusMsg;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @descriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get descriptionLabel;

  /// No description provided for @categoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryLabel;

  /// No description provided for @step1.
  ///
  /// In en, this message translates to:
  /// **'Step 1'**
  String get step1;

  /// No description provided for @step2.
  ///
  /// In en, this message translates to:
  /// **'Step 2'**
  String get step2;

  /// No description provided for @step3.
  ///
  /// In en, this message translates to:
  /// **'Step 3'**
  String get step3;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signInTitle;

  /// No description provided for @enterCredentials.
  ///
  /// In en, this message translates to:
  /// **'Please enter your credentials'**
  String get enterCredentials;

  /// No description provided for @enterNic.
  ///
  /// In en, this message translates to:
  /// **'Enter NIC or Passport Number'**
  String get enterNic;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @signInBtn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signInBtn;

  /// No description provided for @createAccountBtn.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccountBtn;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgotPassword;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @nicNumber.
  ///
  /// In en, this message translates to:
  /// **'NIC Number'**
  String get nicNumber;

  /// No description provided for @passportNumber.
  ///
  /// In en, this message translates to:
  /// **'Passport Number'**
  String get passportNumber;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @selectCountry.
  ///
  /// In en, this message translates to:
  /// **'Select Country'**
  String get selectCountry;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @registerBtn.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerBtn;

  /// No description provided for @registerSuccess.
  ///
  /// In en, this message translates to:
  /// **'Account created gracefully! Please Sign in.'**
  String get registerSuccess;

  /// No description provided for @passwordResetTitle.
  ///
  /// In en, this message translates to:
  /// **'Password Reset'**
  String get passwordResetTitle;

  /// No description provided for @resetNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset your new password'**
  String get resetNewPassword;

  /// No description provided for @securityQuestionsMsg.
  ///
  /// In en, this message translates to:
  /// **'Please answer the following security questions.'**
  String get securityQuestionsMsg;

  /// No description provided for @registeredNicOrPassport.
  ///
  /// In en, this message translates to:
  /// **'Registered NIC or Passport Number'**
  String get registeredNicOrPassport;

  /// No description provided for @birthCityQuestion.
  ///
  /// In en, this message translates to:
  /// **'What is your birth city?'**
  String get birthCityQuestion;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @verifyBtn.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verifyBtn;

  /// No description provided for @resetPasswordBtn.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPasswordBtn;

  /// No description provided for @verifiedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Verified successfully'**
  String get verifiedSuccess;

  /// No description provided for @fillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all fields'**
  String get fillAllFields;

  /// No description provided for @passwordResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully'**
  String get passwordResetSuccess;

  /// No description provided for @passwordsMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords not match'**
  String get passwordsMismatch;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get navMessage;

  /// No description provided for @navAppointment.
  ///
  /// In en, this message translates to:
  /// **'Appointment'**
  String get navAppointment;

  /// No description provided for @navAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get navAccount;

  /// No description provided for @navEmergency.
  ///
  /// In en, this message translates to:
  /// **'Emergency'**
  String get navEmergency;

  /// No description provided for @submitComplaintTitle.
  ///
  /// In en, this message translates to:
  /// **'Submit Complaint'**
  String get submitComplaintTitle;

  /// No description provided for @step1Of4.
  ///
  /// In en, this message translates to:
  /// **'Step 1 of 4'**
  String get step1Of4;

  /// No description provided for @step2Of4.
  ///
  /// In en, this message translates to:
  /// **'Step 2 of 4'**
  String get step2Of4;

  /// No description provided for @step3Of4.
  ///
  /// In en, this message translates to:
  /// **'Step 3 of 4'**
  String get step3Of4;

  /// No description provided for @step4Of4.
  ///
  /// In en, this message translates to:
  /// **'Step 4 of 4'**
  String get step4Of4;

  /// No description provided for @confidentialInfo.
  ///
  /// In en, this message translates to:
  /// **'This information is strictly confidential. It will be used by the Labor Department for official investigation purposes.'**
  String get confidentialInfo;

  /// No description provided for @forMe.
  ///
  /// In en, this message translates to:
  /// **'For Me'**
  String get forMe;

  /// No description provided for @onBehalfOf.
  ///
  /// In en, this message translates to:
  /// **'On behalf of'**
  String get onBehalfOf;

  /// No description provided for @yourDetails.
  ///
  /// In en, this message translates to:
  /// **'Your Details'**
  String get yourDetails;

  /// No description provided for @complainantsDetails.
  ///
  /// In en, this message translates to:
  /// **'Complainant\'s Details'**
  String get complainantsDetails;

  /// No description provided for @nextBtn.
  ///
  /// In en, this message translates to:
  /// **'Next >'**
  String get nextBtn;

  /// No description provided for @incidentCategory.
  ///
  /// In en, this message translates to:
  /// **'Incident Category'**
  String get incidentCategory;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get selectCategory;

  /// No description provided for @incidentDescHint.
  ///
  /// In en, this message translates to:
  /// **'Enter detailed description of the incident...'**
  String get incidentDescHint;

  /// No description provided for @selectResolutionTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Resolution'**
  String get selectResolutionTitle;

  /// No description provided for @expectedResolution.
  ///
  /// In en, this message translates to:
  /// **'Expected Resolution'**
  String get expectedResolution;

  /// No description provided for @uploadEvidenceMessage.
  ///
  /// In en, this message translates to:
  /// **'Please upload photos, voice messages or documents related to your grievance. This will help our officers process your case faster.'**
  String get uploadEvidenceMessage;

  /// No description provided for @selectedFilesText.
  ///
  /// In en, this message translates to:
  /// **'Selected Files'**
  String get selectedFilesText;

  /// No description provided for @catBreachContract.
  ///
  /// In en, this message translates to:
  /// **'Breach of Employement Contract'**
  String get catBreachContract;

  /// No description provided for @catLackCommunication.
  ///
  /// In en, this message translates to:
  /// **'Lack of communication'**
  String get catLackCommunication;

  /// No description provided for @catSick.
  ///
  /// In en, this message translates to:
  /// **'Sick'**
  String get catSick;

  /// No description provided for @catJailed.
  ///
  /// In en, this message translates to:
  /// **'Being Jailed'**
  String get catJailed;

  /// No description provided for @catRemanded.
  ///
  /// In en, this message translates to:
  /// **'Being Remanded by Police'**
  String get catRemanded;

  /// No description provided for @catStranded.
  ///
  /// In en, this message translates to:
  /// **'Being Stranded without employment'**
  String get catStranded;

  /// No description provided for @catProbHome.
  ///
  /// In en, this message translates to:
  /// **'Problems at Employees Home(Sri Lanka)'**
  String get catProbHome;

  /// No description provided for @catDeath.
  ///
  /// In en, this message translates to:
  /// **'Death'**
  String get catDeath;

  /// No description provided for @catRetained.
  ///
  /// In en, this message translates to:
  /// **'Being retained by unknown person'**
  String get catRetained;

  /// No description provided for @catOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get catOther;

  /// No description provided for @resRepatriationSalaries.
  ///
  /// In en, this message translates to:
  /// **'Repatriation with salaries'**
  String get resRepatriationSalaries;

  /// No description provided for @resImmRepatriation.
  ///
  /// In en, this message translates to:
  /// **'Immediate repatriation to Sri Lanka'**
  String get resImmRepatriation;

  /// No description provided for @resRepatriation.
  ///
  /// In en, this message translates to:
  /// **'Repatriation to Sri Lanka'**
  String get resRepatriation;

  /// No description provided for @resInfoEmployee.
  ///
  /// In en, this message translates to:
  /// **'Obtaining information about the employee'**
  String get resInfoEmployee;

  /// No description provided for @resInfoSituation.
  ///
  /// In en, this message translates to:
  /// **'Obtaining information on current situation about the employee'**
  String get resInfoSituation;

  /// No description provided for @resInfoJail.
  ///
  /// In en, this message translates to:
  /// **'Obtaining information about the name of the jail, charge alleged for, date of release from the jail etc.'**
  String get resInfoJail;

  /// No description provided for @resInfoAppeal.
  ///
  /// In en, this message translates to:
  /// **'Obtaining information about the opportunity to filing an appeal and any other steps that could be taken'**
  String get resInfoAppeal;

  /// No description provided for @resImmSolutions.
  ///
  /// In en, this message translates to:
  /// **'Immediate solutions for the problems faced by the employee'**
  String get resImmSolutions;

  /// No description provided for @resChangePlace.
  ///
  /// In en, this message translates to:
  /// **'Changing the place of emloyment immediately '**
  String get resChangePlace;

  /// No description provided for @resChangePlaceBackwages.
  ///
  /// In en, this message translates to:
  /// **'Changing the place of emloyment with backwages'**
  String get resChangePlaceBackwages;

  /// No description provided for @resObtainWages.
  ///
  /// In en, this message translates to:
  /// **'Obtaining the agreed wages and facilities'**
  String get resObtainWages;

  /// No description provided for @resObtainGratuity.
  ///
  /// In en, this message translates to:
  /// **'Obtaining the gratuity benefits'**
  String get resObtainGratuity;

  /// No description provided for @resObtainBackwages.
  ///
  /// In en, this message translates to:
  /// **'Obtaining backwages'**
  String get resObtainBackwages;

  /// No description provided for @resObtainCompensation.
  ///
  /// In en, this message translates to:
  /// **'Obtaining compensation'**
  String get resObtainCompensation;

  /// No description provided for @resFacilitateComm.
  ///
  /// In en, this message translates to:
  /// **'Faclilitating communication'**
  String get resFacilitateComm;

  /// No description provided for @resContactDetails.
  ///
  /// In en, this message translates to:
  /// **'Obtaining contact details of the employee'**
  String get resContactDetails;

  /// No description provided for @optionFiles.
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get optionFiles;

  /// No description provided for @optionCamera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get optionCamera;

  /// No description provided for @optionGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get optionGallery;

  /// No description provided for @optionVoice.
  ///
  /// In en, this message translates to:
  /// **'Voice'**
  String get optionVoice;

  /// No description provided for @optionStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get optionStop;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'si', 'ta'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'si':
      return AppLocalizationsSi();
    case 'ta':
      return AppLocalizationsTa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
