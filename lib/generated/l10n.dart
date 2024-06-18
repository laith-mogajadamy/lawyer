// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `BRIEfCASE`
  String get title {
    return Intl.message(
      'BRIEfCASE',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `REGISTER`
  String get REGISTER {
    return Intl.message(
      'REGISTER',
      name: 'REGISTER',
      desc: '',
      args: [],
    );
  }

  /// `GUEST`
  String get GUEST {
    return Intl.message(
      'GUEST',
      name: 'GUEST',
      desc: '',
      args: [],
    );
  }

  /// `ABOUT US`
  String get ABOUTUS {
    return Intl.message(
      'ABOUT US',
      name: 'ABOUTUS',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Email or Username is too short`
  String get emailvalidate {
    return Intl.message(
      'Email or Username is too short',
      name: 'emailvalidate',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Re-type Password `
  String get RetypePassword {
    return Intl.message(
      'Re-type Password ',
      name: 'RetypePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get passwordvalidate {
    return Intl.message(
      'Password is too short',
      name: 'passwordvalidate',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get LogInbotton {
    return Intl.message(
      'Log In',
      name: 'LogInbotton',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get donthaveanaccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'donthaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get SignUp {
    return Intl.message(
      'SignUp',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `select`
  String get select {
    return Intl.message(
      'select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Name/Company`
  String get Name {
    return Intl.message(
      'Name/Company',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `name is too short`
  String get namevalidate {
    return Intl.message(
      'name is too short',
      name: 'namevalidate',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get Emailaddress {
    return Intl.message(
      'Email address',
      name: 'Emailaddress',
      desc: '',
      args: [],
    );
  }

  /// `Contact number`
  String get Contactnumber {
    return Intl.message(
      'Contact number',
      name: 'Contactnumber',
      desc: '',
      args: [],
    );
  }

  /// `number is too short`
  String get numbervalidate {
    return Intl.message(
      'number is too short',
      name: 'numbervalidate',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get Alreadyhaveanaccount {
    return Intl.message(
      'Already have an account?',
      name: 'Alreadyhaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get Country {
    return Intl.message(
      'Country',
      name: 'Country',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get City {
    return Intl.message(
      'City',
      name: 'City',
      desc: '',
      args: [],
    );
  }

  /// `EID Number`
  String get EIDNumber {
    return Intl.message(
      'EID Number',
      name: 'EIDNumber',
      desc: '',
      args: [],
    );
  }

  /// `Upload EID`
  String get UploadEID {
    return Intl.message(
      'Upload EID',
      name: 'UploadEID',
      desc: '',
      args: [],
    );
  }

  /// `Front`
  String get Front {
    return Intl.message(
      'Front',
      name: 'Front',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get Back {
    return Intl.message(
      'Back',
      name: 'Back',
      desc: '',
      args: [],
    );
  }

  /// `Land Line`
  String get LandLine {
    return Intl.message(
      'Land Line',
      name: 'LandLine',
      desc: '',
      args: [],
    );
  }

  /// `Occupation`
  String get Occupation {
    return Intl.message(
      'Occupation',
      name: 'Occupation',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Registeration`
  String get registeration {
    return Intl.message(
      'Registeration',
      name: 'registeration',
      desc: '',
      args: [],
    );
  }

  /// `Expertise :`
  String get Expertise {
    return Intl.message(
      'Expertise :',
      name: 'Expertise',
      desc: '',
      args: [],
    );
  }

  /// `AddExpertise`
  String get AddExpertise {
    return Intl.message(
      'AddExpertise',
      name: 'AddExpertise',
      desc: '',
      args: [],
    );
  }

  /// `Certifications:`
  String get Certifications {
    return Intl.message(
      'Certifications:',
      name: 'Certifications',
      desc: '',
      args: [],
    );
  }

  /// `License:`
  String get License {
    return Intl.message(
      'License:',
      name: 'License',
      desc: '',
      args: [],
    );
  }

  /// `Biography:`
  String get Biography {
    return Intl.message(
      'Biography:',
      name: 'Biography',
      desc: '',
      args: [],
    );
  }

  /// `Available 24/7`
  String get Available {
    return Intl.message(
      'Available 24/7',
      name: 'Available',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '' key

  /// ` My consultations`
  String get Myconsultations {
    return Intl.message(
      ' My consultations',
      name: 'Myconsultations',
      desc: '',
      args: [],
    );
  }

  /// `you dont have any consultations`
  String get youdonthaveanyconsultations {
    return Intl.message(
      'you dont have any consultations',
      name: 'youdonthaveanyconsultations',
      desc: '',
      args: [],
    );
  }

  /// `General Questions`
  String get GeneralQuestions {
    return Intl.message(
      'General Questions',
      name: 'GeneralQuestions',
      desc: '',
      args: [],
    );
  }

  /// `you dont have any generalquestions`
  String get youdonthaveanygeneralquestions {
    return Intl.message(
      'you dont have any generalquestions',
      name: 'youdonthaveanygeneralquestions',
      desc: '',
      args: [],
    );
  }

  /// ` My General Questions`
  String get MyGeneralQuestions {
    return Intl.message(
      ' My General Questions',
      name: 'MyGeneralQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Lawyers`
  String get Lawyers {
    return Intl.message(
      'Lawyers',
      name: 'Lawyers',
      desc: '',
      args: [],
    );
  }

  /// `Legal Consultant`
  String get LegalConsultant {
    return Intl.message(
      'Legal Consultant',
      name: 'LegalConsultant',
      desc: '',
      args: [],
    );
  }

  /// `typing Center`
  String get typingCenter {
    return Intl.message(
      'typing Center',
      name: 'typingCenter',
      desc: '',
      args: [],
    );
  }

  /// `Masseges`
  String get masseges {
    return Intl.message(
      'Masseges',
      name: 'masseges',
      desc: '',
      args: [],
    );
  }

  /// `Groups`
  String get Groups {
    return Intl.message(
      'Groups',
      name: 'Groups',
      desc: '',
      args: [],
    );
  }

  /// `General Chat`
  String get generalchat {
    return Intl.message(
      'General Chat',
      name: 'generalchat',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Who are you looking for? Tax Lawyer?`
  String get WhoareyoulookingforTaxLawyer {
    return Intl.message(
      'Who are you looking for? Tax Lawyer?',
      name: 'WhoareyoulookingforTaxLawyer',
      desc: '',
      args: [],
    );
  }

  /// `Find Your Lawyer`
  String get FindYourLawyer {
    return Intl.message(
      'Find Your Lawyer',
      name: 'FindYourLawyer',
      desc: '',
      args: [],
    );
  }

  /// `NEWS`
  String get News {
    return Intl.message(
      'NEWS',
      name: 'News',
      desc: '',
      args: [],
    );
  }

  /// `LAW PRACTIONERS`
  String get LAWPRACTIONERS {
    return Intl.message(
      'LAW PRACTIONERS',
      name: 'LAWPRACTIONERS',
      desc: '',
      args: [],
    );
  }

  /// `The forum`
  String get Theforum {
    return Intl.message(
      'The forum',
      name: 'Theforum',
      desc: '',
      args: [],
    );
  }

  /// `Frequently Asked \n     Questions`
  String get frequentlyaskedquestions {
    return Intl.message(
      'Frequently Asked \n     Questions',
      name: 'frequentlyaskedquestions',
      desc: '',
      args: [],
    );
  }

  /// `Translation\nCompany`
  String get translationcompany {
    return Intl.message(
      'Translation\nCompany',
      name: 'translationcompany',
      desc: '',
      args: [],
    );
  }

  /// `Lawyers Available 24/7`
  String get lawyersAvailable {
    return Intl.message(
      'Lawyers Available 24/7',
      name: 'lawyersAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Persons`
  String get Persons {
    return Intl.message(
      'Persons',
      name: 'Persons',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get Location {
    return Intl.message(
      'Location',
      name: 'Location',
      desc: '',
      args: [],
    );
  }

  /// `Practice`
  String get Practice {
    return Intl.message(
      'Practice',
      name: 'Practice',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Consultations`
  String get Consultations {
    return Intl.message(
      'Consultations',
      name: 'Consultations',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `You dont have any notifications`
  String get Youdonthaveanynotifications {
    return Intl.message(
      'You dont have any notifications',
      name: 'Youdonthaveanynotifications',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Gender {
    return Intl.message(
      'Gender',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `location`
  String get location {
    return Intl.message(
      'location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Certifications`
  String get CERTIFICATIONS {
    return Intl.message(
      'Certifications',
      name: 'CERTIFICATIONS',
      desc: '',
      args: [],
    );
  }

  /// `Post a General Question`
  String get POSTAGENERALQUESTION {
    return Intl.message(
      'Post a General Question',
      name: 'POSTAGENERALQUESTION',
      desc: '',
      args: [],
    );
  }

  /// `Profile Edit`
  String get ProfileEdit {
    return Intl.message(
      'Profile Edit',
      name: 'ProfileEdit',
      desc: '',
      args: [],
    );
  }

  /// `Logging out....`
  String get Loggingout {
    return Intl.message(
      'Logging out....',
      name: 'Loggingout',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get LOGOUT {
    return Intl.message(
      'Log Out',
      name: 'LOGOUT',
      desc: '',
      args: [],
    );
  }

  /// `Change the language`
  String get Changethelanguage {
    return Intl.message(
      'Change the language',
      name: 'Changethelanguage',
      desc: '',
      args: [],
    );
  }

  /// `Choose the language`
  String get Chooselanguage {
    return Intl.message(
      'Choose the language',
      name: 'Chooselanguage',
      desc: '',
      args: [],
    );
  }

  /// `results :`
  String get results {
    return Intl.message(
      'results :',
      name: 'results',
      desc: '',
      args: [],
    );
  }

  /// `type or select to search`
  String get typeorselecttosearch {
    return Intl.message(
      'type or select to search',
      name: 'typeorselecttosearch',
      desc: '',
      args: [],
    );
  }

  /// `General \nQuestion`
  String get General_n_Question {
    return Intl.message(
      'General \nQuestion',
      name: 'General_n_Question',
      desc: '',
      args: [],
    );
  }

  /// `Type your General question here`
  String get TypeyourGeneralquestionhere {
    return Intl.message(
      'Type your General question here',
      name: 'TypeyourGeneralquestionhere',
      desc: '',
      args: [],
    );
  }

  /// `YOUR QUESTION MAY OR MAY NOT BE ANSWERED`
  String get YOURQUESTIONMAYORMAYNOTBEANSWERED {
    return Intl.message(
      'YOUR QUESTION MAY OR MAY NOT BE ANSWERED',
      name: 'YOURQUESTIONMAYORMAYNOTBEANSWERED',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get Send {
    return Intl.message(
      'Send',
      name: 'Send',
      desc: '',
      args: [],
    );
  }

  /// `Type your answer with details`
  String get Typeyouranswerwithdetails {
    return Intl.message(
      'Type your answer with details',
      name: 'Typeyouranswerwithdetails',
      desc: '',
      args: [],
    );
  }

  /// `Answer`
  String get Answer {
    return Intl.message(
      'Answer',
      name: 'Answer',
      desc: '',
      args: [],
    );
  }

  /// `Type your question tilte`
  String get Typeyourquestiontilte {
    return Intl.message(
      'Type your question tilte',
      name: 'Typeyourquestiontilte',
      desc: '',
      args: [],
    );
  }

  /// `Type your question with details`
  String get Typeyourquestionwithdetails {
    return Intl.message(
      'Type your question with details',
      name: 'Typeyourquestionwithdetails',
      desc: '',
      args: [],
    );
  }

  /// `THE DETAIL ANSWER WILL COST BASED ON THE LAW PRACTITIONER'S RATE OR SET PRICE OF THIS CONSULTAION`
  String
      get THEDETAILANSWERWILLCOSTBASEDONTHELAWPRACTITIONERSRATEORSETPRICEOFTHISCONSULTAION {
    return Intl.message(
      'THE DETAIL ANSWER WILL COST BASED ON THE LAW PRACTITIONER\'S RATE OR SET PRICE OF THIS CONSULTAION',
      name:
          'THEDETAILANSWERWILLCOSTBASEDONTHELAWPRACTITIONERSRATEORSETPRICEOFTHISCONSULTAION',
      desc: '',
      args: [],
    );
  }

  /// `pay & send`
  String get paysend {
    return Intl.message(
      'pay & send',
      name: 'paysend',
      desc: '',
      args: [],
    );
  }

  /// `IF NOT ANSWERED IN 48 HOURS YOUR MONEY WILL BE SENT BACK TO YOUR ACCOUNT`
  String get IFNOTANSWEREDIN48HOURSYOURMONEYWILLBESENTBACKTOYOURACCOUNT {
    return Intl.message(
      'IF NOT ANSWERED IN 48 HOURS YOUR MONEY WILL BE SENT BACK TO YOUR ACCOUNT',
      name: 'IFNOTANSWEREDIN48HOURSYOURMONEYWILLBESENTBACKTOYOURACCOUNT',
      desc: '',
      args: [],
    );
  }

  /// `Type your replay`
  String get TYPEYOURreplay {
    return Intl.message(
      'Type your replay',
      name: 'TYPEYOURreplay',
      desc: '',
      args: [],
    );
  }

  /// `by answering more general question you will get higher chances to be at the top of the search result`
  String
      get byansweringmoregeneralquestionyouwillgethigherchancestobeatthetopofthesearchresult {
    return Intl.message(
      'by answering more general question you will get higher chances to be at the top of the search result',
      name:
          'byansweringmoregeneralquestionyouwillgethigherchancestobeatthetopofthesearchresult',
      desc: '',
      args: [],
    );
  }

  /// `Replayes`
  String get replayes {
    return Intl.message(
      'Replayes',
      name: 'replayes',
      desc: '',
      args: [],
    );
  }

  /// `ClosedConsultation`
  String get closedConsultation {
    return Intl.message(
      'ClosedConsultation',
      name: 'closedConsultation',
      desc: '',
      args: [],
    );
  }

  /// `Expertise`
  String get EXPERTISE {
    return Intl.message(
      'Expertise',
      name: 'EXPERTISE',
      desc: '',
      args: [],
    );
  }

  /// `send a question`
  String get sendaquestion {
    return Intl.message(
      'send a question',
      name: 'sendaquestion',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get Gallery {
    return Intl.message(
      'Gallery',
      name: 'Gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get Camera {
    return Intl.message(
      'Camera',
      name: 'Camera',
      desc: '',
      args: [],
    );
  }

  /// `Birth`
  String get birth {
    return Intl.message(
      'Birth',
      name: 'birth',
      desc: '',
      args: [],
    );
  }

  /// `consultation price:`
  String get consultationprice {
    return Intl.message(
      'consultation price:',
      name: 'consultationprice',
      desc: '',
      args: [],
    );
  }

  /// `add certification`
  String get addcertification {
    return Intl.message(
      'add certification',
      name: 'addcertification',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Num Of Consultation`
  String get numOfConsultation {
    return Intl.message(
      'Num Of Consultation',
      name: 'numOfConsultation',
      desc: '',
      args: [],
    );
  }

  /// `Years Of Practice`
  String get yearsOfPractice {
    return Intl.message(
      'Years Of Practice',
      name: 'yearsOfPractice',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
