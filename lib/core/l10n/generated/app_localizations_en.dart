// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Skill Swap BD';

  @override
  String get errorNoInternet => 'No internet connection';

  @override
  String get errorTimeout => 'Request timed out';

  @override
  String get errorSessionExpired => 'Session expired';

  @override
  String get errorGeneric => 'Something went wrong';

  @override
  String get commonSave => 'Save';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonRetry => 'Retry';

  @override
  String get commonOk => 'OK';

  @override
  String get commonError => 'Error';

  @override
  String get commonSuccess => 'Success';

  @override
  String get commonBack => 'Back';

  @override
  String get commonSearch => 'Search';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonLoading => 'Loading...';

  @override
  String get commonSend => 'Send';

  @override
  String get validationRequired => 'This field is required';

  @override
  String get validationInvalidPhone => 'Invalid phone number';

  @override
  String get validationInvalidEmail => 'Invalid email address';

  @override
  String get validationInvalidAmount => 'Invalid amount';

  @override
  String get validationPasswordTooShort => 'Password must be at least 6 characters';

  @override
  String get authLoginTitle => 'Welcome Back';

  @override
  String get authLoginSubtitle => 'Sign in to exchange skills with peers in Bangladesh';

  @override
  String get authRegisterTitle => 'Join SkillSwap BD';

  @override
  String get authRegisterSubtitle => 'Create an account and start bartering knowledge';

  @override
  String get authEmailLabel => 'Email address';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authConfirmPasswordLabel => 'Confirm Password';

  @override
  String get authSignInButton => 'Sign In';

  @override
  String get authSignUpButton => 'Create Account';

  @override
  String get authGoogleSignInButton => 'Continue with Google';

  @override
  String get authNoAccount => 'Don\'t have an account? Sign up';

  @override
  String get authHaveAccount => 'Already have an account? Sign in';

  @override
  String get authSignOutButton => 'Sign Out';

  @override
  String get authLoginSuccess => 'Logged in successfully';

  @override
  String get authRegisterSuccess => 'Account created successfully';

  @override
  String get authSignOutSuccess => 'Signed out successfully';

  @override
  String get profileTitle => 'My Profile';

  @override
  String get profileEditTitle => 'Edit Profile';

  @override
  String get profileFullNameLabel => 'Full Name';

  @override
  String get profileBioLabel => 'Bio';

  @override
  String get profileSkillsOfferedLabel => 'Skills I Can Teach / Offer';

  @override
  String get profileSkillsLearnedLabel => 'Skills I Want to Learn';

  @override
  String get profileAddSkillHint => 'Type a skill and press Enter or tap Add';

  @override
  String get profileSaveSuccess => 'Profile updated successfully';

  @override
  String get profileSkillExchanged => 'Mutual Skill Swap';

  @override
  String get discoveryTitle => 'Skill Barter Feed';

  @override
  String get discoverySearchHint => 'Search skills (e.g. Flutter, English)...';

  @override
  String get discoveryOfferingFilter => 'Skills Offered';

  @override
  String get discoveryLearningFilter => 'Skills Wanted';

  @override
  String get discoveryConnectButton => 'Chat / Swap Skill';

  @override
  String get discoveryNoUsersFound => 'No users found matching your criteria';

  @override
  String get discoveryMutualMatch => 'Mutual Match!';

  @override
  String get chatTitle => 'Chat';

  @override
  String get chatMessageHint => 'Type a message...';

  @override
  String get chatEmptyState => 'Say hello to start exchanging skills!';

  @override
  String get chatConnectedBadge => 'Skill Exchange Partner';
}
