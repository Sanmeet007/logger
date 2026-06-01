import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fi'),
    Locale('fr'),
    Locale('hi'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sv'),
    Locale('tr'),
    Locale('zh')
  ];

  /// Text or label used to direct the user to an About page for the app.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutText;

  /// Label for a section displaying advanced settings.
  ///
  /// In en, this message translates to:
  /// **'Advanced Settings'**
  String get advancedSettingsLabelText;

  /// Label for the section explaining the app's analytics policy.
  ///
  /// In en, this message translates to:
  /// **'Analytics Policy'**
  String get analyticsPolicyLabelText;

  /// Details about how call log data is analyzed locally without being transmitted to online servers, emphasizing privacy.
  ///
  /// In en, this message translates to:
  /// **'All call log data is analyzed locally on your device and never transmitted to online servers, ensuring your privacy and keeping your information safe and confidential'**
  String get analyticsPolicyText;

  /// Label for the screen displaying call analytics and insights.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get analyticsScreenLabelText;

  /// Generic error message displayed when an unknown error occurs.
  ///
  /// In en, this message translates to:
  /// **'Ah snap! Something went wrong'**
  String get appError;

  /// The title of the application.
  ///
  /// In en, this message translates to:
  /// **'Logger'**
  String get appTitle;

  /// Text for a button to apply the selected filters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get applyFiltersText;

  /// A base-level generic error message.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get baseGhostErrorMessage;

  /// Label for a section displaying general or basic settings.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get baseSettingsLabelText;

  /// Label indicating blocked calls.
  ///
  /// In en, this message translates to:
  /// **'Blocked'**
  String get blockedText;

  /// Message displayed when an error occurs during the export or download of call logs.
  ///
  /// In en, this message translates to:
  /// **'Error while downloading file !'**
  String get callLogsExportFailureText;

  /// Label for the option to select the format for exporting call logs.
  ///
  /// In en, this message translates to:
  /// **'Call logs export format'**
  String get callLogsExportFormatLabelText;

  /// Message displayed when call logs are successfully exported and downloaded.
  ///
  /// In en, this message translates to:
  /// **'Call logs extracted and downloaded successfully'**
  String get callLogsExportSuccessText;

  /// Label used to indicate the type of a call (e.g., incoming, outgoing, missed).
  ///
  /// In en, this message translates to:
  /// **'Call Type'**
  String get callTypeText;

  /// Text for a button to cancel an operation or close a dialog.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelText;

  /// Text for a button to configure specific settings or options.
  ///
  /// In en, this message translates to:
  /// **'Configure'**
  String get configureText;

  /// Label for the section or dialog confirming the start of the import process.
  ///
  /// In en, this message translates to:
  /// **'Confirm Import Start'**
  String get confirmImportLabelText;

  /// Warning message explaining the risks and potential consequences of importing call logs, including data corruption and overwriting.
  ///
  /// In en, this message translates to:
  /// **'Importing call logs is a significant task that can irreversibly corrupt your current logs, overwrite data, and cause inconsistencies in your history. Please be aware that this process may take some time and could lead to the issues mentioned above. Proceed with caution.'**
  String get confirmImportText;

  /// Text for a button to proceed to the next step in a process.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// Label used to display or refer to dates.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateText;

  /// Text for a button encouraging users to donate to support the app.
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get donateText;

  /// Confirmation message shown before downloading call logs in the selected format, mentioning the type of file and its storage location.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to download your call logs in {currentImportType} format? This action will save your call history to a {currentImportType} file on your device.'**
  String downloadConfirmationText(String currentImportType);

  /// Text for a button to download files or data.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get downloadText;

  /// Explanation for the token representing the full weekday name (e.g., Friday).
  ///
  /// In en, this message translates to:
  /// **'Full weekday name'**
  String get dtAAcronymExapandedText;

  /// Explanation for the token representing the full month name (e.g., July).
  ///
  /// In en, this message translates to:
  /// **'Full month name'**
  String get dtBAcronymExapandedText;

  /// Explanation for the token representing the hour in 24-hour format (e.g., 14 for 2 PM).
  ///
  /// In en, this message translates to:
  /// **'Hour in 24-hour format'**
  String get dtHAcronymExapandedText;

  /// Explanation for the token representing the hour in 12-hour format (e.g., 2 for 2 PM).
  ///
  /// In en, this message translates to:
  /// **'Hour in 12-hour format'**
  String get dtIAcronymExapandedText;

  /// Explanation for the token representing minutes (e.g., 15).
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get dtMAcronymExapandedText;

  /// Explanation for the token representing seconds (e.g., 00).
  ///
  /// In en, this message translates to:
  /// **'Seconds'**
  String get dtSAcronymExapandedText;

  /// Explanation for the token representing the week number of the year with Sunday as the first day of the week.
  ///
  /// In en, this message translates to:
  /// **'Week number of the year (Sunday as the first day of the week)'**
  String get dtUAcronymExapandedText;

  /// Explanation for the token representing the week number of the year with Monday as the first day of the week.
  ///
  /// In en, this message translates to:
  /// **'Week number of the year (Monday as the first day of the week)'**
  String get dtWAcronymExapandedText;

  /// Explanation for the token representing the time representation (e.g., 14:15:00).
  ///
  /// In en, this message translates to:
  /// **'Time representation'**
  String get dtXAcronymExapandedText;

  /// Explanation for the token representing the year with century (e.g., 2024).
  ///
  /// In en, this message translates to:
  /// **'Year with century'**
  String get dtYAcronymExapandedText;

  /// Explanation for the token representing the time zone name (e.g., IST).
  ///
  /// In en, this message translates to:
  /// **'Time zone name'**
  String get dtZAcronymExapandedText;

  /// Explanation for the token representing the abbreviated weekday name (e.g., Fri).
  ///
  /// In en, this message translates to:
  /// **'Abbreviated weekday name'**
  String get dtaAcronymExapandedText;

  /// Explanation for the token representing the abbreviated month name (e.g., Jul).
  ///
  /// In en, this message translates to:
  /// **'Abbreviated month name'**
  String get dtbAcronymExapandedText;

  /// Explanation for the token representing the combined date and time representation.
  ///
  /// In en, this message translates to:
  /// **'Date and time representation'**
  String get dtcAcronymExapandedText;

  /// Explanation for the token representing the day of the month (e.g., 12).
  ///
  /// In en, this message translates to:
  /// **'Day of the month'**
  String get dtdAcronymExapandedText;

  /// Explanation for the token representing milliseconds.
  ///
  /// In en, this message translates to:
  /// **'Milliseconds'**
  String get dtfAcronymExapandedText;

  /// Explanation for the token representing the day of the year (e.g., 193 for July 12).
  ///
  /// In en, this message translates to:
  /// **'Day of the year'**
  String get dtjAcronymExapandedText;

  /// Explanation for the token representing the month as a number (e.g., 07 for July).
  ///
  /// In en, this message translates to:
  /// **'Month as a number'**
  String get dtmAcronymExapandedText;

  /// Explanation for the token representing the AM/PM marker.
  ///
  /// In en, this message translates to:
  /// **'AM/PM marker'**
  String get dtpAcronymExapandedText;

  /// Explanation for the token representing the date representation (e.g., Fri, Jul 12, 2024).
  ///
  /// In en, this message translates to:
  /// **'Date representation'**
  String get dtxAcronymExapandedText;

  /// Explanation for the token representing the year without century (e.g., 24).
  ///
  /// In en, this message translates to:
  /// **'Year without century'**
  String get dtyAcronymExapandedText;

  /// Explanation for the token representing the time zone offset from UTC (e.g., +0530).
  ///
  /// In en, this message translates to:
  /// **'Time zone offset from UTC'**
  String get dtzAcronymExapandedText;

  /// Label used to display the duration of a call or event.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get durationText;

  /// Text encouraging the user to begin exploring the app's features.
  ///
  /// In en, this message translates to:
  /// **'Explore now'**
  String get exploreNowText;

  /// Text for a button that links to the app's project repository on GitHub.
  ///
  /// In en, this message translates to:
  /// **'Explore Project on Github'**
  String get exploreProjectButtonText;

  /// Label for the option to configure the filename format for exported files.
  ///
  /// In en, this message translates to:
  /// **'Export filename format'**
  String get exportFileNameFormatLabelText;

  /// Hint text suggesting an example for the filename format.
  ///
  /// In en, this message translates to:
  /// **'my-call-logs-[%token]'**
  String get filenameFormatHintText;

  /// Label for the input field to configure the filename format.
  ///
  /// In en, this message translates to:
  /// **'Filename format'**
  String get filenameFormatLabelText;

  /// Text for a button to apply filters to data or views.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filterText;

  /// Text displayed on a button or screen for initiating the app's onboarding process.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStartedText;

  /// Error message shown for non-specific issues, styled slightly differently from the base error message.
  ///
  /// In en, this message translates to:
  /// **'Hmm. Something went wrong'**
  String get ghostErrorMessage;

  /// Text for a button to hide details or content.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hideText;

  /// Hint text displayed in the input field for entering a mobile number.
  ///
  /// In en, this message translates to:
  /// **'9XXXX XXXX'**
  String get hintMobileNumberText;

  /// Text describing the action of importing call logs into the app.
  ///
  /// In en, this message translates to:
  /// **'Import your call logs'**
  String get importCallLogsText;

  /// Label indicating incoming calls.
  ///
  /// In en, this message translates to:
  /// **'Incoming'**
  String get incomingText;

  /// Label for the screen displaying call logs.
  ///
  /// In en, this message translates to:
  /// **'Logs'**
  String get logsScreenLabelText;

  /// Hint text suggesting an example value for the maximum call duration.
  ///
  /// In en, this message translates to:
  /// **'eg: 60'**
  String get maximumDurationHintText;

  /// Label for the input field to specify the maximum call duration in seconds.
  ///
  /// In en, this message translates to:
  /// **'Max (in secs)'**
  String get maximumDurationLabelText;

  /// Hint text suggesting an example value for the minimum call duration.
  ///
  /// In en, this message translates to:
  /// **'eg: 0'**
  String get minimumDurationHintText;

  /// Label for the input field to specify the minimum call duration in seconds.
  ///
  /// In en, this message translates to:
  /// **'Min (in secs)'**
  String get minimumDurationLabelText;

  /// Label indicating missed calls.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get missedText;

  /// Label used to display or refer to a mobile number.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumberText;

  /// Text displayed on a button to proceed to the next step.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextText;

  /// Subtitle for the fourth onboarding screen, explaining how users can transfer or export call logs.
  ///
  /// In en, this message translates to:
  /// **'Seamlessly transfer call logs between devices or export them for safekeeping and analysis.'**
  String get onboardingScreenFourSubtitle;

  /// Title for the fourth onboarding screen, showcasing the app's import and export features.
  ///
  /// In en, this message translates to:
  /// **'Import & Export'**
  String get onboardingScreenFourTitle;

  /// Subtitle for the first onboarding screen, introducing Logger as a call log management and analysis app.
  ///
  /// In en, this message translates to:
  /// **'Your go-to app for managing and analyzing your call logs effortlessly.'**
  String get onboardingScreenOneSubtitle;

  /// Title for the first onboarding screen welcoming the user to Logger.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Logger!'**
  String get onboardingScreenOneTitle;

  /// Subtitle for the third onboarding screen, explaining the detailed insights the app provides about call patterns.
  ///
  /// In en, this message translates to:
  /// **'Understand your call patterns like never before and get detailed insights to optimize your time.'**
  String get onboardingScreenThreeSubtitle;

  /// Title for the third onboarding screen, emphasizing the app's call analysis capabilities.
  ///
  /// In en, this message translates to:
  /// **'Analyze Your Calls'**
  String get onboardingScreenThreeTitle;

  /// Subtitle for the second onboarding screen, describing the app's intuitive interface for managing call logs.
  ///
  /// In en, this message translates to:
  /// **'Search, filter, and manage your call logs with a seamless and intuitive interface.'**
  String get onboardingScreenTwoSubtitle;

  /// Title for the second onboarding screen, highlighting the app's call log management features.
  ///
  /// In en, this message translates to:
  /// **'Manage Call Logs'**
  String get onboardingScreenTwoTitle;

  /// Text for a button or action to open a specific item or section.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get openText;

  /// Label indicating outgoing calls.
  ///
  /// In en, this message translates to:
  /// **'Outgoing'**
  String get outgoingText;

  /// Label used to display the identifier for the phone account used for the call.
  ///
  /// In en, this message translates to:
  /// **'Phone Account ID'**
  String get phoneAccountIdText;

  /// Text indicating the name of the platform, e.g., Android.
  ///
  /// In en, this message translates to:
  /// **'Android'**
  String get platformNameText;

  /// Label used to display the platform on which the app is running.
  ///
  /// In en, this message translates to:
  /// **'platform'**
  String get platformText;

  /// Example of a full date and time representation (e.g., Fri, Jul 12 2024 14:15:00).
  ///
  /// In en, this message translates to:
  /// **'Fri, Jul 12 2024 14:15:00'**
  String get randomDTRepr;

  /// Example of an abbreviated month name (e.g., Jul).
  ///
  /// In en, this message translates to:
  /// **'Jul'**
  String get randomMonthAbbr;

  /// Example of a full month name (e.g., July).
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get randomMonthName;

  /// Example of an abbreviated weekday name (e.g., Fri).
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get randomWeekdayAbbr;

  /// Example of a full weekday name (e.g., Friday).
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get randomWeekdayName;

  /// Text for a button to refresh the current view or data.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refreshText;

  /// Label indicating rejected calls.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejectedText;

  /// Text for a button that allows users to report a problem or bug.
  ///
  /// In en, this message translates to:
  /// **'Report a Problem or Bug'**
  String get reportIssueButtonText;

  /// Text for a button to reset the current settings or input.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetText;

  /// Text for a button that resets all settings or filters to their default values.
  ///
  /// In en, this message translates to:
  /// **'Reset to Default'**
  String get resetToDefaultText;

  /// Text for a button to save changes or preferences.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveText;

  /// Label for the settings screen where users can configure the app.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsScreenLabelText;

  /// Text for a button to share files or information.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareText;

  /// Label used to display the name of the SIM card associated with the call.
  ///
  /// In en, this message translates to:
  /// **'SIM Display Name'**
  String get simText;

  /// Text displayed on a button to skip the current step.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipText;

  /// Text for a button to start importing call logs.
  ///
  /// In en, this message translates to:
  /// **'Start Import'**
  String get startImportText;

  /// Label for the section or option related to the app's storage policy.
  ///
  /// In en, this message translates to:
  /// **'Storage Policy'**
  String get storagePolicyLabelText;

  /// Description of the app's policy for temporary file storage and call log privacy.
  ///
  /// In en, this message translates to:
  /// **'This app temporarily stores generated files, deleting them on exit. You can download call logs to your chosen location. Logger only accesses call logs, ensuring your privacy.'**
  String get storagePolicyText;

  /// Information about the supported formats for importing call logs, currently limited to CSV.
  ///
  /// In en, this message translates to:
  /// **'Please note: Only CSV format is currently supported for importing call logs.'**
  String get supportedFormatInformation;

  /// Label used to display or refer to time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get timeText;

  /// Label for an accordion section detailing date and time formatting tokens.
  ///
  /// In en, this message translates to:
  /// **'date & time formatting tokens'**
  String get tokenAccordianText;

  /// Information about tokens that can be used to customize filename formats based on date and time.
  ///
  /// In en, this message translates to:
  /// **'You can use the tokens provided to customize your filename format based on specific date and time preferences.'**
  String get tokensInfoText;

  /// Text displayed when the required information is not available.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknownText;

  /// Label used to display the app version.
  ///
  /// In en, this message translates to:
  /// **'version'**
  String get versionText;

  /// Text for a button to view details or content.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get viewText;

  /// Label indicating incoming calls made over WiFi.
  ///
  /// In en, this message translates to:
  /// **'Wifi Incoming'**
  String get wifiIncomingText;

  /// Label indicating outgoing calls made over WiFi.
  ///
  /// In en, this message translates to:
  /// **'Wifi Outgoing'**
  String get wifiOutgoingText;

  /// Text for the 'Call Statistics' section
  ///
  /// In en, this message translates to:
  /// **'Call Statistics'**
  String get callStatsText;

  /// Text for the 'Call Duration' section
  ///
  /// In en, this message translates to:
  /// **'Call Duration'**
  String get callDurationText;

  /// Text for the 'Most Called Number' section
  ///
  /// In en, this message translates to:
  /// **'Most Called Number'**
  String get mostCalledNumberText;

  /// Text for the 'Call Direction Analysis' section
  ///
  /// In en, this message translates to:
  /// **'Call Direction Analysis'**
  String get callDirectionAnalysisText;

  /// Text for the 'Longest Call' section
  ///
  /// In en, this message translates to:
  /// **'Longest Call'**
  String get longestCallText;

  /// Text for the top N longest calls, where N is a number.
  ///
  /// In en, this message translates to:
  /// **'Top {n} Longest Calls'**
  String topNLongestCalls(int n);

  /// Text for 'Call' button
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get callText;

  /// Text for 'SMS' section
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get smsText;

  /// Text displayed when there's no data to show
  ///
  /// In en, this message translates to:
  /// **'Nothing to display'**
  String get nothingToDisplayText;

  /// Text for the 'Calls Made' section
  ///
  /// In en, this message translates to:
  /// **'Calls Made'**
  String get callsMadeText;

  /// Text for the 'Calls Received' section
  ///
  /// In en, this message translates to:
  /// **'Calls Received'**
  String get callsReceivedText;

  /// Text for the 'Calls Missed' section
  ///
  /// In en, this message translates to:
  /// **'Calls Missed'**
  String get callsMissedText;

  /// Text for the 'Calls Rejected' section
  ///
  /// In en, this message translates to:
  /// **'Calls Rejected'**
  String get callsRejectedText;

  /// Text for the 'Calls Blocked' section
  ///
  /// In en, this message translates to:
  /// **'Calls Blocked'**
  String get callsBlockedText;

  /// Text for 'Average' section
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get averageText;

  /// Text for 'Longest' section
  ///
  /// In en, this message translates to:
  /// **'Longest'**
  String get longestText;

  /// Text for 'Total' section
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalText;

  /// Text for 'Today' section
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayText;

  /// Text for 'Yesterday' section
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterdayText;

  /// Text for 'This Month' section
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonthText;

  /// Text for 'Past Month' section
  ///
  /// In en, this message translates to:
  /// **'Past Month'**
  String get pastMonthText;

  /// Text for 'This Year' section
  ///
  /// In en, this message translates to:
  /// **'This Year'**
  String get thisYearText;

  /// Text for 'Past Year' section
  ///
  /// In en, this message translates to:
  /// **'Past Year'**
  String get pastYearText;

  /// Text for 'All Time' section
  ///
  /// In en, this message translates to:
  /// **'All Time'**
  String get allTimeText;

  /// Text for 'Custom' section
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get customText;

  /// Text for the 'Start Date' field
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDateText;

  /// Text for the 'End Date' field
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDateText;

  /// Text for the 'Date range' section
  ///
  /// In en, this message translates to:
  /// **'Date range'**
  String get dateRangeText;

  /// Text for searching by specific phone number
  ///
  /// In en, this message translates to:
  /// **'Specific Phone Number'**
  String get searchByNumberText;

  /// Text for filtering by phone account ID
  ///
  /// In en, this message translates to:
  /// **'Phone Account ID'**
  String get phoneAccountIdFilterText;

  /// Text for filtering by call duration
  ///
  /// In en, this message translates to:
  /// **'Filter by Call Duration'**
  String get filterByDurationText;

  /// Text for filtering by call type
  ///
  /// In en, this message translates to:
  /// **'Call Type'**
  String get filterByCallTypeText;

  /// Text for the 'Answered Externally' section
  ///
  /// In en, this message translates to:
  /// **'Answered Externally'**
  String get answeredExternallyText;

  /// Text for 'Voice Mail' section
  ///
  /// In en, this message translates to:
  /// **'Voice Mail'**
  String get voiceMailText;

  /// Text for hint about exporting open
  ///
  /// In en, this message translates to:
  /// **'Export Open'**
  String get exportOpenHintText;

  /// Text for 'Any' option
  ///
  /// In en, this message translates to:
  /// **'Any'**
  String get anyText;

  /// Text for 'Processing file' section
  ///
  /// In en, this message translates to:
  /// **'Processing file'**
  String get processingFileText;

  /// Text for 'Inserting logs' section
  ///
  /// In en, this message translates to:
  /// **'Inserting logs'**
  String get insertingLogsText;

  /// Text for 'This may take longer' message
  ///
  /// In en, this message translates to:
  /// **'This may take longer'**
  String get takingMoreTimeText;

  /// Text for 'Please wait' message
  ///
  /// In en, this message translates to:
  /// **'Please wait'**
  String get pleaseWaitText;

  /// Text for successful import message
  ///
  /// In en, this message translates to:
  /// **'Call logs imported successfully'**
  String get importSuccessMessageText;

  /// Text for failed settings update message
  ///
  /// In en, this message translates to:
  /// **'Failed to update settings. Please try again later'**
  String get failedToUpdateSettingsText;

  /// Text for successful sharing settings update message
  ///
  /// In en, this message translates to:
  /// **'Sharing settings updated successfully.'**
  String get shareSettingUpdateSuccessMsgText;

  /// Text for successful downloading settings update message
  ///
  /// In en, this message translates to:
  /// **'Downloading settings updated successfully.'**
  String get downloadSettingUpdatedSuccessMsgText;

  /// Text for successful setting update message
  ///
  /// In en, this message translates to:
  /// **'Setting updated successfully.'**
  String get settingUpdateSuccessMsgText;

  /// Text for successful duration filter settings update message
  ///
  /// In en, this message translates to:
  /// **'Duration filter settings updated successfully.'**
  String get durationFilterSettingUpdatedSuccessMsgText;

  /// Text for successful filter by phone account id settings update message
  ///
  /// In en, this message translates to:
  /// **'Filter by phone account id settings updated successfully.'**
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText;

  /// Text for successful general settings update message
  ///
  /// In en, this message translates to:
  /// **'Settings updated successfully.'**
  String get generalSettingUpdatedSuccessMsgText;

  /// Text for successful import settings update message
  ///
  /// In en, this message translates to:
  /// **'Import settings updated successfully.'**
  String get importSettingUpdatedSuccessMsgText;

  /// Text for 'Export fields information' section
  ///
  /// In en, this message translates to:
  /// **'Export fields information'**
  String get exportFieldInfoText;

  /// Text for 'Name associated with the call log entry' field
  ///
  /// In en, this message translates to:
  /// **'Name associated with the call log entry'**
  String get csvJsonExportNameField;

  /// Text for 'The ID of the phone account associated with the call identifies the specific account or SIM card used to place or receive the call' field
  ///
  /// In en, this message translates to:
  /// **'The ID of the phone account associated with the call identifies the specific account or SIM card used to place or receive the call'**
  String get csvJsonExportPhoneAccountIdField;

  /// Text for 'Type of the call (e.g., incoming, outgoing, missed)' field
  ///
  /// In en, this message translates to:
  /// **'Type of the call (e.g., incoming, outgoing, missed)'**
  String get csvJsonExportCallTypeField;

  /// Text for 'Phone number associated with the call log entry' field
  ///
  /// In en, this message translates to:
  /// **'Phone number associated with the call log entry'**
  String get csvJsonExportNumberField;

  /// Text for 'Formatted phone number' field
  ///
  /// In en, this message translates to:
  /// **'Formatted phone number, formatted with formatting rules based on the country the user was in when the call was made or received.'**
  String get csvJsonExportFormattedNumberField;

  /// Text for 'Display name of the SIM card associated with the call' field
  ///
  /// In en, this message translates to:
  /// **'Display name of the SIM card associated with the call'**
  String get csvJsonExportSimDisplayField;

  /// Text for 'Timestamp (epoch time) of the call' field
  ///
  /// In en, this message translates to:
  /// **'Timestamp (epoch time) of the call'**
  String get csvJsonExportTimestampField;

  /// Text for 'Duration of the call in seconds' field
  ///
  /// In en, this message translates to:
  /// **'Duration of the call in seconds'**
  String get csvJsonExportDurationField;

  /// Text for 'Label associated with the cached phone number' field
  ///
  /// In en, this message translates to:
  /// **'Label associated with the cached phone number'**
  String get csvJsonExportCachedNumberLabelField;

  /// Text for 'The cached number type (Home, Work, etc)' field
  ///
  /// In en, this message translates to:
  /// **'The cached number type (Home, Work, etc) associated with the phone number, if it exists.'**
  String get csvJsonExportCachedNumberTypeField;

  /// Text for 'Stored or cached phone number associated with a call log entry' field
  ///
  /// In en, this message translates to:
  /// **'Stored or cached phone number associated with a call log entry for quick reference.'**
  String get csvJsonExportCachedMatchedNumberField;

  /// Text for 'Export Fields Info' hint
  ///
  /// In en, this message translates to:
  /// **'Export Fields Info'**
  String get exportFieldInfoHintText;

  /// Text for 'n/a' (Not Applicable)
  ///
  /// In en, this message translates to:
  /// **'n/a'**
  String get naText;

  /// Text or label for a confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Confirm Download'**
  String get confirmDownloadText;

  /// Label for most recieved number.
  ///
  /// In en, this message translates to:
  /// **'Most Recieved Number'**
  String get mostReceivedNumberText;

  /// Label for confirming the contacts sync action.
  ///
  /// In en, this message translates to:
  /// **'Confirm Sync Contacts'**
  String get confirmContactsSyncLabelText;

  /// Message explaining what the sync process will do, specifically updating missing contact names in call logs without modifying other details.
  ///
  /// In en, this message translates to:
  /// **'This process will scan your call logs and update missing contact names by matching them with your saved contacts. It won\'t modify any other details in your call history.'**
  String get confirmContactsSyncConfirmationText;

  /// Success message shown after the contacts are successfully synced with the call logs.
  ///
  /// In en, this message translates to:
  /// **'Contacts synced successfully with call logs'**
  String get contactsSyncSuccessMessageText;

  /// Error message shown if there is an issue syncing the contacts.
  ///
  /// In en, this message translates to:
  /// **'Error syncing contacts !'**
  String get contactsSyncErrorMessageText;

  /// Message shown when the user denies permission to access contacts.
  ///
  /// In en, this message translates to:
  /// **'Permission to contacts were denied !'**
  String get contactsPermissionDenied;

  /// Label for the sync contacts feature in the UI.
  ///
  /// In en, this message translates to:
  /// **'Sync Call Log Contacts'**
  String get syncContactsLabelText;

  /// Call-to-action button text that prompts the user to initiate the sync process.
  ///
  /// In en, this message translates to:
  /// **'Sync Now'**
  String get syncContactsCTAText;

  /// No description provided for @softwareInformationText.
  ///
  /// In en, this message translates to:
  /// **'Software Information'**
  String get softwareInformationText;

  /// No description provided for @addToContactsText.
  ///
  /// In en, this message translates to:
  /// **'Add Contact'**
  String get addToContactsText;

  /// No description provided for @addToContactsErrorText.
  ///
  /// In en, this message translates to:
  /// **'Unable to add new contact'**
  String get addToContactsErrorText;

  /// No description provided for @appPermissionsDeniedError.
  ///
  /// In en, this message translates to:
  /// **'Uh-oh! It seems like access to call logs has been denied. To ensure Logger works smoothly, please grant permission. '**
  String get appPermissionsDeniedError;

  /// No description provided for @appFatalError.
  ///
  /// In en, this message translates to:
  /// **'Ah snap! Something unexpected happened!'**
  String get appFatalError;

  /// No description provided for @appPreferencesError.
  ///
  /// In en, this message translates to:
  /// **'Ah! Snap error loading preferences'**
  String get appPreferencesError;

  /// No description provided for @uriPermissionError.
  ///
  /// In en, this message translates to:
  /// **'Unable to get permissions'**
  String get uriPermissionError;

  /// No description provided for @fileGenerationError.
  ///
  /// In en, this message translates to:
  /// **'An error occured while generating file. Please try again later'**
  String get fileGenerationError;

  /// No description provided for @fileShareMessage.
  ///
  /// In en, this message translates to:
  /// **'Share call logs file via gmail , whatsapp etc...'**
  String get fileShareMessage;

  /// No description provided for @fileShareSubject.
  ///
  /// In en, this message translates to:
  /// **'Call Logs'**
  String get fileShareSubject;

  /// No description provided for @fileOpenError.
  ///
  /// In en, this message translates to:
  /// **'Unable to open file please try again later'**
  String get fileOpenError;

  /// No description provided for @openingFileLabel.
  ///
  /// In en, this message translates to:
  /// **'Opening file'**
  String get openingFileLabel;

  /// No description provided for @viewContactLabel.
  ///
  /// In en, this message translates to:
  /// **'View Contact'**
  String get viewContactLabel;

  /// No description provided for @errorOpeningContact.
  ///
  /// In en, this message translates to:
  /// **'Error opening contact'**
  String get errorOpeningContact;

  /// No description provided for @waLaunchError.
  ///
  /// In en, this message translates to:
  /// **'Could not launch WhatsApp'**
  String get waLaunchError;

  /// No description provided for @closeText.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeText;

  /// No description provided for @defaultPresetName.
  ///
  /// In en, this message translates to:
  /// **'DefaultPreset'**
  String get defaultPresetName;

  /// No description provided for @onLabel.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get onLabel;

  /// No description provided for @offLabel.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get offLabel;

  /// No description provided for @filterPresetTitle.
  ///
  /// In en, this message translates to:
  /// **'Filter presets'**
  String get filterPresetTitle;

  /// No description provided for @addMorePresetsLabel.
  ///
  /// In en, this message translates to:
  /// **'add preset'**
  String get addMorePresetsLabel;

  /// No description provided for @deleteAllPresetsLabel.
  ///
  /// In en, this message translates to:
  /// **'delete all'**
  String get deleteAllPresetsLabel;

  /// No description provided for @enablePresetsPlaceholderText.
  ///
  /// In en, this message translates to:
  /// **'Enable presets to effortlessly create and switch between multiple filters for quick call log customization.'**
  String get enablePresetsPlaceholderText;

  /// No description provided for @noPresetsPlaceholderText.
  ///
  /// In en, this message translates to:
  /// **'Start creating your own custom presets for quick filtering'**
  String get noPresetsPlaceholderText;

  /// No description provided for @presetNameInputLabelText.
  ///
  /// In en, this message translates to:
  /// **'Preset Name'**
  String get presetNameInputLabelText;

  /// No description provided for @presetNameInputHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter a name for preset'**
  String get presetNameInputHintText;

  /// No description provided for @defaultLabelText.
  ///
  /// In en, this message translates to:
  /// **'default'**
  String get defaultLabelText;

  /// No description provided for @lastCallText.
  ///
  /// In en, this message translates to:
  /// **'Last call'**
  String get lastCallText;

  /// No description provided for @groupByContactAndTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Group by Contact and Type'**
  String get groupByContactAndTypeTitle;

  /// No description provided for @groupByContactAndTypeDescription.
  ///
  /// In en, this message translates to:
  /// **'Calls are grouped by both the contact and the call type'**
  String get groupByContactAndTypeDescription;

  /// No description provided for @groupByContactOnlyConsecutiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Group by Consecutive Contacts'**
  String get groupByContactOnlyConsecutiveTitle;

  /// No description provided for @groupByContactOnlyConsecutiveDescription.
  ///
  /// In en, this message translates to:
  /// **'Merges consecutive calls from the same contact into a single group'**
  String get groupByContactOnlyConsecutiveDescription;

  /// No description provided for @groupByContactOnlyTitle.
  ///
  /// In en, this message translates to:
  /// **'Group by Contact'**
  String get groupByContactOnlyTitle;

  /// No description provided for @groupByContactOnlyDescription.
  ///
  /// In en, this message translates to:
  /// **'Groups all calls from the same contact together'**
  String get groupByContactOnlyDescription;

  /// No description provided for @groupByNoneDescription.
  ///
  /// In en, this message translates to:
  /// **'No grouping applied — each call is shown separately'**
  String get groupByNoneDescription;

  /// No description provided for @callGroupingText.
  ///
  /// In en, this message translates to:
  /// **'Call grouping'**
  String get callGroupingText;

  /// No description provided for @useGroupingSwitchText.
  ///
  /// In en, this message translates to:
  /// **'Use grouping with filters'**
  String get useGroupingSwitchText;

  /// No description provided for @clearFiltersTooltip.
  ///
  /// In en, this message translates to:
  /// **'Clear filters'**
  String get clearFiltersTooltip;

  /// No description provided for @scrollToTopTooltip.
  ///
  /// In en, this message translates to:
  /// **'Scroll to top'**
  String get scrollToTopTooltip;

  /// No description provided for @watchListText.
  ///
  /// In en, this message translates to:
  /// **'Watch list'**
  String get watchListText;

  /// No description provided for @roundDurationText.
  ///
  /// In en, this message translates to:
  /// **'Round calls to minutes'**
  String get roundDurationText;

  /// No description provided for @roundDurationTextSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Round calls up to the nearest minute for billing'**
  String get roundDurationTextSubtitle;

  /// No description provided for @groupedCallSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose how to group calls for easier tracking and overview'**
  String get groupedCallSettingSubtitle;

  /// No description provided for @filterPresetsSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create, save, and reuse filters to find calls easily'**
  String get filterPresetsSettingSubtitle;

  /// No description provided for @exportFilenameSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize how your exported files are named'**
  String get exportFilenameSettingSubtitle;

  /// No description provided for @exportFormatSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the format for exported call logs'**
  String get exportFormatSettingSubtitle;

  /// No description provided for @importCallLogsSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Import call history from other sources or backups'**
  String get importCallLogsSettingSubtitle;

  /// No description provided for @appDetailsText.
  ///
  /// In en, this message translates to:
  /// **'App Info & Details'**
  String get appDetailsText;

  /// No description provided for @appDetailsSubText.
  ///
  /// In en, this message translates to:
  /// **'Version • Donate • Bug Report'**
  String get appDetailsSubText;

  /// Label for enabling donwload confirmation setting.
  ///
  /// In en, this message translates to:
  /// **'Confirm download'**
  String get enableDownloadConfirmationText;

  /// No description provided for @enableDownloadConfirmationSubText.
  ///
  /// In en, this message translates to:
  /// **'Prompt before downloading files'**
  String get enableDownloadConfirmationSubText;

  /// Option to enable filtering of call logs by duration.
  ///
  /// In en, this message translates to:
  /// **'Duration filtering'**
  String get enableCallDurationFilteringText;

  /// No description provided for @enableCallDurationFilteringSubText.
  ///
  /// In en, this message translates to:
  /// **'Filter calls based on their duration'**
  String get enableCallDurationFilteringSubText;

  /// Option to show the total count of call logs.
  ///
  /// In en, this message translates to:
  /// **'Call logs count'**
  String get enableCallLogCountVisibilityText;

  /// No description provided for @enableCallLogCountVisibilitySubText.
  ///
  /// In en, this message translates to:
  /// **'Display number of calls for each day'**
  String get enableCallLogCountVisibilitySubText;

  /// Option to enable filtering call logs by account ID.
  ///
  /// In en, this message translates to:
  /// **'Filter by account ID'**
  String get enableFilterByAccountIdText;

  /// No description provided for @enableFilterByAccountIdSubText.
  ///
  /// In en, this message translates to:
  /// **'Show calls for a specific SIM or account'**
  String get enableFilterByAccountIdSubText;

  /// Option to display the total duration of all calls.
  ///
  /// In en, this message translates to:
  /// **'Total call duration'**
  String get showTotalCallDurationText;

  /// No description provided for @showTotalCallDurationSubText.
  ///
  /// In en, this message translates to:
  /// **'Display the total time spent on calls'**
  String get showTotalCallDurationSubText;

  /// Text to disable the sharing of call logs.
  ///
  /// In en, this message translates to:
  /// **'Hide share button'**
  String get disableLogsSharingText;

  /// No description provided for @disableLogsSharingSubText.
  ///
  /// In en, this message translates to:
  /// **'Conceal the share button in the call logs'**
  String get disableLogsSharingSubText;

  /// No description provided for @trackListLabelText.
  ///
  /// In en, this message translates to:
  /// **'Tracklist'**
  String get trackListLabelText;

  /// No description provided for @tracklistPlaceholderText.
  ///
  /// In en, this message translates to:
  /// **'Manage your track list efficiently. Tap + (top-right) to add a number, swipe left on a list item and tap Remove to untrack.'**
  String get tracklistPlaceholderText;

  /// No description provided for @removeAllText.
  ///
  /// In en, this message translates to:
  /// **'remove all'**
  String get removeAllText;

  /// No description provided for @trackContactLabelText.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get trackContactLabelText;

  /// No description provided for @trackContactText.
  ///
  /// In en, this message translates to:
  /// **'Track a Contact'**
  String get trackContactText;

  /// No description provided for @removeText.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get removeText;

  /// No description provided for @iteractionScoreText.
  ///
  /// In en, this message translates to:
  /// **'Interaction Score'**
  String get iteractionScoreText;

  /// No description provided for @lastCallSinceText.
  ///
  /// In en, this message translates to:
  /// **'Last call since'**
  String get lastCallSinceText;

  /// No description provided for @avgCallsMonthText.
  ///
  /// In en, this message translates to:
  /// **'Average Calls / Month'**
  String get avgCallsMonthText;

  /// No description provided for @avgCallDurationText.
  ///
  /// In en, this message translates to:
  /// **'Average Call Duration'**
  String get avgCallDurationText;

  /// No description provided for @peakCallDurationText.
  ///
  /// In en, this message translates to:
  /// **'Peak Call Duration'**
  String get peakCallDurationText;

  /// No description provided for @callsPerWeekText.
  ///
  /// In en, this message translates to:
  /// **'Average Calls / Week'**
  String get callsPerWeekText;

  /// No description provided for @callDistByWeekDay.
  ///
  /// In en, this message translates to:
  /// **'Call Distribution by Weekday (%)'**
  String get callDistByWeekDay;

  /// Instruction text to tell the user they can add contacts to the tracklist
  ///
  /// In en, this message translates to:
  /// **'Add up to {maxItems} contacts to your tracklist for easy tracking.'**
  String addToTrackList(Object maxItems);

  /// No description provided for @addText.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addText;

  /// No description provided for @numberAlreadyAddedErrorText.
  ///
  /// In en, this message translates to:
  /// **'Number already added'**
  String get numberAlreadyAddedErrorText;

  /// No description provided for @invalidNumberErrorText.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get invalidNumberErrorText;

  /// No description provided for @emptyPhoneNumberErrorText.
  ///
  /// In en, this message translates to:
  /// **'Enter a phone number'**
  String get emptyPhoneNumberErrorText;

  /// No description provided for @trackNumberErrorText.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong adding new track contact'**
  String get trackNumberErrorText;

  /// No description provided for @quickFilterText.
  ///
  /// In en, this message translates to:
  /// **'Quick Filter'**
  String get quickFilterText;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fi',
        'fr',
        'hi',
        'ja',
        'ko',
        'nl',
        'pl',
        'pt',
        'ro',
        'ru',
        'sv',
        'tr',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sv':
      return AppLocalizationsSv();
    case 'tr':
      return AppLocalizationsTr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
