// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get aboutText => 'About';

  @override
  String get advancedSettingsLabelText => 'Advanced Settings';

  @override
  String get analyticsPolicyLabelText => 'Analytics Policy';

  @override
  String get analyticsPolicyText =>
      'All call log data is analyzed locally on your device and never transmitted to online servers, ensuring your privacy and keeping your information safe and confidential';

  @override
  String get analyticsScreenLabelText => 'Analytics';

  @override
  String get appError => 'Ah snap! Something went wrong';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => 'Apply Filters';

  @override
  String get baseGhostErrorMessage => 'Something went wrong';

  @override
  String get baseSettingsLabelText => 'General Settings';

  @override
  String get blockedText => 'Blocked';

  @override
  String get callLogsExportFailureText => 'Error while downloading file !';

  @override
  String get callLogsExportFormatLabelText => 'Call logs export format';

  @override
  String get callLogsExportSuccessText =>
      'Call logs extracted and downloaded successfully';

  @override
  String get callTypeText => 'Call Type';

  @override
  String get cancelText => 'Cancel';

  @override
  String get configureText => 'Configure';

  @override
  String get confirmImportLabelText => 'Confirm Import Start';

  @override
  String get confirmImportText =>
      'Importing call logs is a significant task that can irreversibly corrupt your current logs, overwrite data, and cause inconsistencies in your history. Please be aware that this process may take some time and could lead to the issues mentioned above. Proceed with caution.';

  @override
  String get continueText => 'Continue';

  @override
  String get dateText => 'Date';

  @override
  String get donateText => 'Donate';

  @override
  String downloadConfirmationText(String currentImportType) {
    return 'Are you sure you want to download your call logs in $currentImportType format? This action will save your call history to a $currentImportType file on your device.';
  }

  @override
  String get downloadText => 'Download';

  @override
  String get dtAAcronymExapandedText => 'Full weekday name';

  @override
  String get dtBAcronymExapandedText => 'Full month name';

  @override
  String get dtHAcronymExapandedText => 'Hour in 24-hour format';

  @override
  String get dtIAcronymExapandedText => 'Hour in 12-hour format';

  @override
  String get dtMAcronymExapandedText => 'Minutes';

  @override
  String get dtSAcronymExapandedText => 'Seconds';

  @override
  String get dtUAcronymExapandedText =>
      'Week number of the year (Sunday as the first day of the week)';

  @override
  String get dtWAcronymExapandedText =>
      'Week number of the year (Monday as the first day of the week)';

  @override
  String get dtXAcronymExapandedText => 'Time representation';

  @override
  String get dtYAcronymExapandedText => 'Year with century';

  @override
  String get dtZAcronymExapandedText => 'Time zone name';

  @override
  String get dtaAcronymExapandedText => 'Abbreviated weekday name';

  @override
  String get dtbAcronymExapandedText => 'Abbreviated month name';

  @override
  String get dtcAcronymExapandedText => 'Date and time representation';

  @override
  String get dtdAcronymExapandedText => 'Day of the month';

  @override
  String get dtfAcronymExapandedText => 'Milliseconds';

  @override
  String get dtjAcronymExapandedText => 'Day of the year';

  @override
  String get dtmAcronymExapandedText => 'Month as a number';

  @override
  String get dtpAcronymExapandedText => 'AM/PM marker';

  @override
  String get dtxAcronymExapandedText => 'Date representation';

  @override
  String get dtyAcronymExapandedText => 'Year without century';

  @override
  String get dtzAcronymExapandedText => 'Time zone offset from UTC';

  @override
  String get durationText => 'Duration';

  @override
  String get exploreNowText => 'Explore now';

  @override
  String get exploreProjectButtonText => 'Explore Project on Github';

  @override
  String get exportFileNameFormatLabelText => 'Export filename format';

  @override
  String get filenameFormatHintText => 'my-call-logs-[%token]';

  @override
  String get filenameFormatLabelText => 'Filename format';

  @override
  String get filterText => 'Filter';

  @override
  String get getStartedText => 'Get Started';

  @override
  String get ghostErrorMessage => 'Hmm. Something went wrong';

  @override
  String get hideText => 'Hide';

  @override
  String get hintMobileNumberText => '9XXXX XXXX';

  @override
  String get importCallLogsText => 'Import your call logs';

  @override
  String get incomingText => 'Incoming';

  @override
  String get logsScreenLabelText => 'Logs';

  @override
  String get maximumDurationHintText => 'eg: 60';

  @override
  String get maximumDurationLabelText => 'Max (in secs)';

  @override
  String get minimumDurationHintText => 'eg: 0';

  @override
  String get minimumDurationLabelText => 'Min (in secs)';

  @override
  String get missedText => 'Missed';

  @override
  String get mobileNumberText => 'Mobile Number';

  @override
  String get nextText => 'Next';

  @override
  String get onboardingScreenFourSubtitle =>
      'Seamlessly transfer call logs between devices or export them for safekeeping and analysis.';

  @override
  String get onboardingScreenFourTitle => 'Import & Export';

  @override
  String get onboardingScreenOneSubtitle =>
      'Your go-to app for managing and analyzing your call logs effortlessly.';

  @override
  String get onboardingScreenOneTitle => 'Welcome to Logger!';

  @override
  String get onboardingScreenThreeSubtitle =>
      'Understand your call patterns like never before and get detailed insights to optimize your time.';

  @override
  String get onboardingScreenThreeTitle => 'Analyze Your Calls';

  @override
  String get onboardingScreenTwoSubtitle =>
      'Search, filter, and manage your call logs with a seamless and intuitive interface.';

  @override
  String get onboardingScreenTwoTitle => 'Manage Call Logs';

  @override
  String get openText => 'Open';

  @override
  String get outgoingText => 'Outgoing';

  @override
  String get phoneAccountIdText => 'Phone Account ID';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => 'platform';

  @override
  String get randomDTRepr => 'Fri, Jul 12 2024 14:15:00';

  @override
  String get randomMonthAbbr => 'Jul';

  @override
  String get randomMonthName => 'July';

  @override
  String get randomWeekdayAbbr => 'Fri';

  @override
  String get randomWeekdayName => 'Friday';

  @override
  String get refreshText => 'Refresh';

  @override
  String get rejectedText => 'Rejected';

  @override
  String get reportIssueButtonText => 'Report a Problem or Bug';

  @override
  String get resetText => 'Reset';

  @override
  String get resetToDefaultText => 'Reset to Default';

  @override
  String get saveText => 'Save';

  @override
  String get settingsScreenLabelText => 'Settings';

  @override
  String get shareText => 'Share';

  @override
  String get simText => 'SIM Display Name';

  @override
  String get skipText => 'Skip';

  @override
  String get startImportText => 'Start Import';

  @override
  String get storagePolicyLabelText => 'Storage Policy';

  @override
  String get storagePolicyText =>
      'This app temporarily stores generated files, deleting them on exit. You can download call logs to your chosen location. Logger only accesses call logs, ensuring your privacy.';

  @override
  String get supportedFormatInformation =>
      'Please note: Only CSV format is currently supported for importing call logs.';

  @override
  String get timeText => 'Time';

  @override
  String get tokenAccordianText => 'date & time formatting tokens';

  @override
  String get tokensInfoText =>
      'You can use the tokens provided to customize your filename format based on specific date and time preferences.';

  @override
  String get unknownText => 'Unknown';

  @override
  String get versionText => 'version';

  @override
  String get viewText => 'View';

  @override
  String get wifiIncomingText => 'Wifi Incoming';

  @override
  String get wifiOutgoingText => 'Wifi Outgoing';

  @override
  String get callStatsText => 'Call Statistics';

  @override
  String get callDurationText => 'Call Duration';

  @override
  String get mostCalledNumberText => 'Most Called Number';

  @override
  String get callDirectionAnalysisText => 'Call Direction Analysis';

  @override
  String get longestCallText => 'Longest Call';

  @override
  String topNLongestCalls(int n) {
    return 'Top $n Longest Calls';
  }

  @override
  String get callText => 'Call';

  @override
  String get smsText => 'SMS';

  @override
  String get nothingToDisplayText => 'Nothing to display';

  @override
  String get callsMadeText => 'Calls Made';

  @override
  String get callsReceivedText => 'Calls Received';

  @override
  String get callsMissedText => 'Calls Missed';

  @override
  String get callsRejectedText => 'Calls Rejected';

  @override
  String get callsBlockedText => 'Calls Blocked';

  @override
  String get averageText => 'Average';

  @override
  String get longestText => 'Longest';

  @override
  String get totalText => 'Total';

  @override
  String get todayText => 'Today';

  @override
  String get yesterdayText => 'Yesterday';

  @override
  String get thisMonthText => 'This Month';

  @override
  String get pastMonthText => 'Past Month';

  @override
  String get thisYearText => 'This Year';

  @override
  String get pastYearText => 'Past Year';

  @override
  String get allTimeText => 'All Time';

  @override
  String get customText => 'Custom';

  @override
  String get startDateText => 'Start Date';

  @override
  String get endDateText => 'End Date';

  @override
  String get dateRangeText => 'Date range';

  @override
  String get searchByNumberText => 'Specific Phone Number';

  @override
  String get phoneAccountIdFilterText => 'Phone Account ID';

  @override
  String get filterByDurationText => 'Filter by Call Duration';

  @override
  String get filterByCallTypeText => 'Call Type';

  @override
  String get answeredExternallyText => 'Answered Externally';

  @override
  String get voiceMailText => 'Voice Mail';

  @override
  String get exportOpenHintText => 'Export Open';

  @override
  String get anyText => 'Any';

  @override
  String get processingFileText => 'Processing file';

  @override
  String get insertingLogsText => 'Inserting logs';

  @override
  String get takingMoreTimeText => 'This may take longer';

  @override
  String get pleaseWaitText => 'Please wait';

  @override
  String get importSuccessMessageText => 'Call logs imported successfully';

  @override
  String get failedToUpdateSettingsText =>
      'Failed to update settings. Please try again later';

  @override
  String get shareSettingUpdateSuccessMsgText =>
      'Sharing settings updated successfully.';

  @override
  String get downloadSettingUpdatedSuccessMsgText =>
      'Downloading settings updated successfully.';

  @override
  String get settingUpdateSuccessMsgText => 'Setting updated successfully.';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText =>
      'Duration filter settings updated successfully.';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      'Filter by phone account id settings updated successfully.';

  @override
  String get generalSettingUpdatedSuccessMsgText =>
      'Settings updated successfully.';

  @override
  String get importSettingUpdatedSuccessMsgText =>
      'Import settings updated successfully.';

  @override
  String get exportFieldInfoText => 'Export fields information';

  @override
  String get csvJsonExportNameField =>
      'Name associated with the call log entry';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      'The ID of the phone account associated with the call identifies the specific account or SIM card used to place or receive the call';

  @override
  String get csvJsonExportCallTypeField =>
      'Type of the call (e.g., incoming, outgoing, missed)';

  @override
  String get csvJsonExportNumberField =>
      'Phone number associated with the call log entry';

  @override
  String get csvJsonExportFormattedNumberField =>
      'Formatted phone number, formatted with formatting rules based on the country the user was in when the call was made or received.';

  @override
  String get csvJsonExportSimDisplayField =>
      'Display name of the SIM card associated with the call';

  @override
  String get csvJsonExportTimestampField =>
      'Timestamp (epoch time) of the call';

  @override
  String get csvJsonExportDurationField => 'Duration of the call in seconds';

  @override
  String get csvJsonExportCachedNumberLabelField =>
      'Label associated with the cached phone number';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      'The cached number type (Home, Work, etc) associated with the phone number, if it exists.';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      'Stored or cached phone number associated with a call log entry for quick reference.';

  @override
  String get exportFieldInfoHintText => 'Export Fields Info';

  @override
  String get naText => 'n/a';

  @override
  String get confirmDownloadText => 'Confirm Download';

  @override
  String get mostReceivedNumberText => 'Most Recieved Number';

  @override
  String get confirmContactsSyncLabelText => 'Confirm Sync Contacts';

  @override
  String get confirmContactsSyncConfirmationText =>
      'This process will scan your call logs and update missing contact names by matching them with your saved contacts. It won\'t modify any other details in your call history.';

  @override
  String get contactsSyncSuccessMessageText =>
      'Contacts synced successfully with call logs';

  @override
  String get contactsSyncErrorMessageText => 'Error syncing contacts !';

  @override
  String get contactsPermissionDenied => 'Permission to contacts were denied !';

  @override
  String get syncContactsLabelText => 'Sync Call Log Contacts';

  @override
  String get syncContactsCTAText => 'Sync Now';

  @override
  String get softwareInformationText => 'Software Information';

  @override
  String get addToContactsText => 'Add Contact';

  @override
  String get addToContactsErrorText => 'Unable to add new contact';

  @override
  String get appPermissionsDeniedError =>
      'Uh-oh! It seems like access to call logs has been denied. To ensure Logger works smoothly, please grant permission. ';

  @override
  String get appFatalError => 'Ah snap! Something unexpected happened!';

  @override
  String get appPreferencesError => 'Ah! Snap error loading preferences';

  @override
  String get uriPermissionError => 'Unable to get permissions';

  @override
  String get fileGenerationError =>
      'An error occured while generating file. Please try again later';

  @override
  String get fileShareMessage =>
      'Share call logs file via gmail , whatsapp etc...';

  @override
  String get fileShareSubject => 'Call Logs';

  @override
  String get fileOpenError => 'Unable to open file please try again later';

  @override
  String get openingFileLabel => 'Opening file';

  @override
  String get viewContactLabel => 'View Contact';

  @override
  String get errorOpeningContact => 'Error opening contact';

  @override
  String get waLaunchError => 'Could not launch WhatsApp';

  @override
  String get closeText => 'Close';

  @override
  String get defaultPresetName => 'DefaultPreset';

  @override
  String get onLabel => 'On';

  @override
  String get offLabel => 'Off';

  @override
  String get filterPresetTitle => 'Filter presets';

  @override
  String get addMorePresetsLabel => 'add preset';

  @override
  String get deleteAllPresetsLabel => 'delete all';

  @override
  String get enablePresetsPlaceholderText =>
      'Enable presets to effortlessly create and switch between multiple filters for quick call log customization.';

  @override
  String get noPresetsPlaceholderText =>
      'Start creating your own custom presets for quick filtering';

  @override
  String get presetNameInputLabelText => 'Preset Name';

  @override
  String get presetNameInputHintText => 'Enter a name for preset';

  @override
  String get defaultLabelText => 'default';

  @override
  String get lastCallText => 'Last call';

  @override
  String get groupByContactAndTypeTitle => 'Group by Contact and Type';

  @override
  String get groupByContactAndTypeDescription =>
      'Calls are grouped by both the contact and the call type';

  @override
  String get groupByContactOnlyConsecutiveTitle =>
      'Group by Consecutive Contacts';

  @override
  String get groupByContactOnlyConsecutiveDescription =>
      'Merges consecutive calls from the same contact into a single group';

  @override
  String get groupByContactOnlyTitle => 'Group by Contact';

  @override
  String get groupByContactOnlyDescription =>
      'Groups all calls from the same contact together';

  @override
  String get groupByNoneDescription =>
      'No grouping applied — each call is shown separately';

  @override
  String get callGroupingText => 'Call grouping';

  @override
  String get useGroupingSwitchText => 'Use grouping with filters';

  @override
  String get clearFiltersTooltip => 'Clear filters';

  @override
  String get scrollToTopTooltip => 'Scroll to top';

  @override
  String get watchListText => 'Watch list';

  @override
  String get roundDurationText => 'Round calls to minutes';

  @override
  String get roundDurationTextSubtitle =>
      'Round calls up to the nearest minute for billing';

  @override
  String get groupedCallSettingSubtitle =>
      'Choose how to group calls for easier tracking and overview';

  @override
  String get filterPresetsSettingSubtitle =>
      'Create, save, and reuse filters to find calls easily';

  @override
  String get exportFilenameSettingSubtitle =>
      'Customize how your exported files are named';

  @override
  String get exportFormatSettingSubtitle =>
      'Choose the format for exported call logs';

  @override
  String get importCallLogsSettingSubtitle =>
      'Import call history from other sources or backups';

  @override
  String get appDetailsText => 'App Info & Details';

  @override
  String get appDetailsSubText => 'Version • Donate • Bug Report';

  @override
  String get enableDownloadConfirmationText => 'Confirm download';

  @override
  String get enableDownloadConfirmationSubText =>
      'Prompt before downloading files';

  @override
  String get enableCallDurationFilteringText => 'Duration filtering';

  @override
  String get enableCallDurationFilteringSubText =>
      'Filter calls based on their duration';

  @override
  String get enableCallLogCountVisibilityText => 'Call logs count';

  @override
  String get enableCallLogCountVisibilitySubText =>
      'Display number of calls for each day';

  @override
  String get enableFilterByAccountIdText => 'Filter by account ID';

  @override
  String get enableFilterByAccountIdSubText =>
      'Show calls for a specific SIM or account';

  @override
  String get showTotalCallDurationText => 'Total call duration';

  @override
  String get showTotalCallDurationSubText =>
      'Display the total time spent on calls';

  @override
  String get disableLogsSharingText => 'Hide share button';

  @override
  String get disableLogsSharingSubText =>
      'Conceal the share button in the call logs';

  @override
  String get trackListLabelText => 'Tracklist';

  @override
  String get tracklistPlaceholderText =>
      'Manage your track list efficiently. Tap + (top-right) to add a number, swipe left on a list item and tap Remove to untrack.';

  @override
  String get removeAllText => 'remove all';

  @override
  String get trackContactLabelText => 'Phone Number';

  @override
  String get trackContactText => 'Track a Contact';

  @override
  String get removeText => 'Remove';

  @override
  String get iteractionScoreText => 'Interaction Score';

  @override
  String get lastCallSinceText => 'Last call since';

  @override
  String get avgCallsMonthText => 'Average Calls / Month';

  @override
  String get avgCallDurationText => 'Average Call Duration';

  @override
  String get peakCallDurationText => 'Peak Call Duration';

  @override
  String get callsPerWeekText => 'Average Calls / Week';

  @override
  String get callDistByWeekDay => 'Call Distribution by Weekday (%)';

  @override
  String addToTrackList(Object maxItems) {
    return 'Add up to $maxItems contacts to your tracklist for easy tracking.';
  }

  @override
  String get addText => 'Add';

  @override
  String get numberAlreadyAddedErrorText => 'Number already added';

  @override
  String get invalidNumberErrorText => 'Invalid phone number';

  @override
  String get emptyPhoneNumberErrorText => 'Enter a phone number';

  @override
  String get trackNumberErrorText =>
      'Something went wrong adding new track contact';

  @override
  String get quickFilterText => 'Quick Filter';
}
