// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get aboutText => 'Om';

  @override
  String get advancedSettingsLabelText => 'Avancerade Inställningar';

  @override
  String get analyticsPolicyLabelText => 'Analyspolicy';

  @override
  String get analyticsPolicyText =>
      'All samtalsloggdata analyseras lokalt på din enhet och överförs aldrig till onlineservrar, vilket garanterar din integritet och håller din information säker och konfidentiell';

  @override
  String get analyticsScreenLabelText => 'Analys';

  @override
  String get appError => 'Hoppsan! Något gick fel';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => 'Tillämpa Filter';

  @override
  String get baseGhostErrorMessage => 'Något gick fel';

  @override
  String get baseSettingsLabelText => 'Allmänna Inställningar';

  @override
  String get blockedText => 'Blockerad';

  @override
  String get callLogsExportFailureText => 'Fel vid nedladdning av filen!';

  @override
  String get callLogsExportFormatLabelText => 'Exportformat för samtalsloggar';

  @override
  String get callLogsExportSuccessText =>
      'Samtalsloggar extraherade och nedladdade';

  @override
  String get callTypeText => 'Samtalstyp';

  @override
  String get cancelText => 'Avbryt';

  @override
  String get configureText => 'Konfigurera';

  @override
  String get confirmImportLabelText => 'Bekräfta Importstart';

  @override
  String get confirmImportText =>
      'Att importera samtalsloggar är en betydande uppgift som oåterkalleligt kan skada dina nuvarande loggar, skriva över data och orsaka inkonsekvenser i din historik. Observera att denna process kan ta tid och kan leda till de problem som nämns ovan. Fortsätt med försiktighet.';

  @override
  String get continueText => 'Fortsätt';

  @override
  String get dateText => 'Datum';

  @override
  String get donateText => 'Donera';

  @override
  String downloadConfirmationText(String currentImportType) {
    return 'Är du säker på att du vill ladda ner dina samtalsloggar i $currentImportType format? Denna åtgärd sparar din samtalshistorik till en $currentImportType fil på din enhet.';
  }

  @override
  String get downloadText => 'Ladda ner';

  @override
  String get dtAAcronymExapandedText => 'Fullständigt veckodagsnamn';

  @override
  String get dtBAcronymExapandedText => 'Fullständigt månadsnamn';

  @override
  String get dtHAcronymExapandedText => 'Timme i 24-timmarsformat';

  @override
  String get dtIAcronymExapandedText => 'Timme i 12-timmarsformat';

  @override
  String get dtMAcronymExapandedText => 'Minuter';

  @override
  String get dtSAcronymExapandedText => 'Sekunder';

  @override
  String get dtUAcronymExapandedText =>
      'Veckonummer på året (söndag som första dagen i veckan)';

  @override
  String get dtWAcronymExapandedText =>
      'Veckonummer på året (måndag som första dagen i veckan)';

  @override
  String get dtXAcronymExapandedText => 'Tidsrepresentation';

  @override
  String get dtYAcronymExapandedText => 'År med århundrade';

  @override
  String get dtZAcronymExapandedText => 'Tidszonsnamn';

  @override
  String get dtaAcronymExapandedText => 'Förkortat veckodagsnamn';

  @override
  String get dtbAcronymExapandedText => 'Förkortat månadsnamn';

  @override
  String get dtcAcronymExapandedText => 'Datum- och tidsrepresentation';

  @override
  String get dtdAcronymExapandedText => 'Dag i månaden';

  @override
  String get dtfAcronymExapandedText => 'Millisekunder';

  @override
  String get dtjAcronymExapandedText => 'Dag på året';

  @override
  String get dtmAcronymExapandedText => 'Månad som ett nummer';

  @override
  String get dtpAcronymExapandedText => 'AM/PM markör';

  @override
  String get dtxAcronymExapandedText => 'Datumpresentation';

  @override
  String get dtyAcronymExapandedText => 'År utan århundrade';

  @override
  String get dtzAcronymExapandedText => 'Tidszon offset från UTC';

  @override
  String get durationText => 'Varaktighet';

  @override
  String get exploreNowText => 'Utforska nu';

  @override
  String get exploreProjectButtonText => 'Utforska Projekt på Github';

  @override
  String get exportFileNameFormatLabelText => 'Exportfilnamnsformat';

  @override
  String get filenameFormatHintText => 'mina-samtalsloggar-[%token]';

  @override
  String get filenameFormatLabelText => 'Filnamnsformat';

  @override
  String get filterText => 'Filter';

  @override
  String get getStartedText => 'Kom igång';

  @override
  String get ghostErrorMessage => 'Hmm. Något gick fel';

  @override
  String get hideText => 'Dölj';

  @override
  String get hintMobileNumberText => 'XXX XXX XX';

  @override
  String get importCallLogsText => 'Importera dina samtalsloggar';

  @override
  String get incomingText => 'Inkommande';

  @override
  String get logsScreenLabelText => 'Loggar';

  @override
  String get maximumDurationHintText => 't.ex.: 60';

  @override
  String get maximumDurationLabelText => 'Max (i sek)';

  @override
  String get minimumDurationHintText => 't.ex.: 0';

  @override
  String get minimumDurationLabelText => 'Min (i sek)';

  @override
  String get missedText => 'Missat';

  @override
  String get mobileNumberText => 'Mobilnummer';

  @override
  String get nextText => 'Nästa';

  @override
  String get onboardingScreenFourSubtitle =>
      'Överför enkelt samtalsloggar mellan enheter eller exportera dem för säker förvaring och analys.';

  @override
  String get onboardingScreenFourTitle => 'Importera & Exportera';

  @override
  String get onboardingScreenOneSubtitle =>
      'Din app för att hantera och analysera dina samtalsloggar utan ansträngning.';

  @override
  String get onboardingScreenOneTitle => 'Välkommen till Loggare!';

  @override
  String get onboardingScreenThreeSubtitle =>
      'Förstå dina samtalsmönster som aldrig förr och få detaljerade insikter för att optimera din tid.';

  @override
  String get onboardingScreenThreeTitle => 'Analysera dina samtal';

  @override
  String get onboardingScreenTwoSubtitle =>
      'Sök, filtrera och hantera dina samtalsloggar med ett sömlöst och intuitivt gränssnitt.';

  @override
  String get onboardingScreenTwoTitle => 'Hantera Samtalsloggar';

  @override
  String get openText => 'Öppna';

  @override
  String get outgoingText => 'Utgående';

  @override
  String get phoneAccountIdText => 'Telefonkonto-ID';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => 'plattform';

  @override
  String get randomDTRepr => 'Fre, 12 Jul 2024 14:15:00';

  @override
  String get randomMonthAbbr => 'Jul';

  @override
  String get randomMonthName => 'Juli';

  @override
  String get randomWeekdayAbbr => 'Fre';

  @override
  String get randomWeekdayName => 'Fredag';

  @override
  String get refreshText => 'Uppdatera';

  @override
  String get rejectedText => 'Avvisat';

  @override
  String get reportIssueButtonText => 'Rapportera ett Problem eller Bugg';

  @override
  String get resetText => 'Återställ';

  @override
  String get resetToDefaultText => 'Återställ till Standard';

  @override
  String get saveText => 'Spara';

  @override
  String get settingsScreenLabelText => 'Inställningar';

  @override
  String get shareText => 'Dela';

  @override
  String get simText => 'SIM-visningsnamn';

  @override
  String get skipText => 'Hoppa över';

  @override
  String get startImportText => 'Starta Import';

  @override
  String get storagePolicyLabelText => 'Lagringspolicy';

  @override
  String get storagePolicyText =>
      'Den här appen lagrar tillfälligt genererade filer och raderar dem när den avslutas. Du kan ladda ner samtalsloggar till den plats du väljer. Loggern får endast tillgång till samtalsloggar, vilket garanterar din integritet.';

  @override
  String get supportedFormatInformation =>
      'Observera: Endast CSV-format stöds för närvarande för import av samtalsloggar.';

  @override
  String get timeText => 'Tid';

  @override
  String get tokenAccordianText => 'datum- och tidsformateringstoken';

  @override
  String get tokensInfoText =>
      'Du kan använda de tillhandahållna token för att anpassa ditt filnamnsformat baserat på specifika datum- och tidsinställningar.';

  @override
  String get unknownText => 'Okänd';

  @override
  String get versionText => 'version';

  @override
  String get viewText => 'Visa';

  @override
  String get wifiIncomingText => 'Wifi Inkommande';

  @override
  String get wifiOutgoingText => 'Wifi Utgående';

  @override
  String get callStatsText => 'Samtalsstatistik';

  @override
  String get callDurationText => 'Samtalstid';

  @override
  String get mostCalledNumberText => 'Mest Ringda Nummer';

  @override
  String get callDirectionAnalysisText => 'Samtalsriktningsanalys';

  @override
  String get longestCallText => 'Längsta Samtal';

  @override
  String topNLongestCalls(int n) {
    return 'Topp $n Längsta Samtal';
  }

  @override
  String get callText => 'Samtal';

  @override
  String get smsText => 'SMS';

  @override
  String get nothingToDisplayText => 'Inget att visa';

  @override
  String get callsMadeText => 'Gjorda Samtal';

  @override
  String get callsReceivedText => 'Mottagna Samtal';

  @override
  String get callsMissedText => 'Missade Samtal';

  @override
  String get callsRejectedText => 'Avvisade Samtal';

  @override
  String get callsBlockedText => 'Blockerade Samtal';

  @override
  String get averageText => 'Genomsnitt';

  @override
  String get longestText => 'Längst';

  @override
  String get totalText => 'Totalt';

  @override
  String get todayText => 'I dag';

  @override
  String get yesterdayText => 'I går';

  @override
  String get thisMonthText => 'Denna Månad';

  @override
  String get pastMonthText => 'Förra Månaden';

  @override
  String get thisYearText => 'Detta År';

  @override
  String get pastYearText => 'Förra Året';

  @override
  String get allTimeText => 'All Tid';

  @override
  String get customText => 'Anpassad';

  @override
  String get startDateText => 'Startdatum';

  @override
  String get endDateText => 'Slutdatum';

  @override
  String get dateRangeText => 'Datumintervall';

  @override
  String get searchByNumberText => 'Specifikt Telefonnummer';

  @override
  String get phoneAccountIdFilterText => 'Telefonkonto-ID';

  @override
  String get filterByDurationText => 'Filtrera efter Samtalstid';

  @override
  String get showUnknownContactsOnlyText => 'Unknown Contacts Only';

  @override
  String get filterByCallTypeText => 'Samtalstyp';

  @override
  String get answeredExternallyText => 'Besvarad Externt';

  @override
  String get voiceMailText => 'Röstbrevlåda';

  @override
  String get exportOpenHintText => 'Öppna Export';

  @override
  String get anyText => 'Valfritt';

  @override
  String get processingFileText => 'Bearbetar fil';

  @override
  String get insertingLogsText => 'Infogar loggar';

  @override
  String get takingMoreTimeText => 'Detta kan ta längre tid';

  @override
  String get pleaseWaitText => 'Vänta';

  @override
  String get importSuccessMessageText => 'Samtalsloggar importerades';

  @override
  String get failedToUpdateSettingsText =>
      'Det gick inte att uppdatera inställningarna. Försök igen senare';

  @override
  String get shareSettingUpdateSuccessMsgText =>
      'Delningsinställningarna har uppdaterats.';

  @override
  String get downloadSettingUpdatedSuccessMsgText =>
      'Nedladdningsinställningarna har uppdaterats.';

  @override
  String get settingUpdateSuccessMsgText => 'Inställningen uppdaterades.';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText =>
      'Inställningarna för varaktighetsfilter har uppdaterats.';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      'Inställningarna för filter efter telefonkonto-id har uppdaterats.';

  @override
  String get generalSettingUpdatedSuccessMsgText =>
      'Inställningarna uppdaterades.';

  @override
  String get importSettingUpdatedSuccessMsgText =>
      'Importinställningarna har uppdaterats.';

  @override
  String get exportFieldInfoText => 'Exportfältsinformation';

  @override
  String get csvJsonExportNameField =>
      'Namn som är kopplat till samtalsloggsposten';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      'ID för det telefonkonto som är kopplat till samtalet identifierar det specifika konto eller SIM-kort som användes för att ringa eller ta emot samtalet';

  @override
  String get csvJsonExportCallTypeField =>
      'Typ av samtal (t.ex. inkommande, utgående, missat)';

  @override
  String get csvJsonExportNumberField =>
      'Telefonnummer som är kopplat till samtalsloggsposten';

  @override
  String get csvJsonExportFormattedNumberField =>
      'Formaterat telefonnummer, formaterat med formateringsregler baserade på det land som användaren befann sig i när samtalet gjordes eller mottogs.';

  @override
  String get csvJsonExportSimDisplayField =>
      'Visningsnamn för SIM-kortet som är kopplat till samtalet';

  @override
  String get csvJsonExportTimestampField =>
      'Tidsstämpel (epoktid) för samtalet';

  @override
  String get csvJsonExportDurationField => 'Samtalets varaktighet i sekunder';

  @override
  String get csvJsonExportCachedNumberLabelField =>
      'Etikett som är kopplad till det cachade telefonnumret';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      'Den cachade nummertypen (Hem, Arbete etc.) som är kopplad till telefonnumret, om det finns.';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      'Lagrat eller cachat telefonnummer som är kopplat till en samtalsloggspost för snabb referens.';

  @override
  String get exportFieldInfoHintText => 'Information om Exportfält';

  @override
  String get naText => 'Ej tillämpligt';

  @override
  String get confirmDownloadText => 'Bekräfta nedladdning';

  @override
  String get mostReceivedNumberText => 'Mest mottagna nummer';

  @override
  String get confirmContactsSyncLabelText =>
      'Bekräfta synkronisering av kontakter';

  @override
  String get confirmContactsSyncConfirmationText =>
      'Denna process kommer att skanna dina samtalsloggar och uppdatera saknade kontaktpersonnamn genom att matcha dem med dina sparade kontakter. Den kommer inte att ändra några andra detaljer i din samtalshistorik.';

  @override
  String get contactsSyncSuccessMessageText =>
      'Kontakter synkroniserades framgångsrikt med samtalsloggar';

  @override
  String get contactsSyncErrorMessageText =>
      'Fel vid synkronisering av kontakter!';

  @override
  String get contactsPermissionDenied => 'Behörighet för kontakter nekades!';

  @override
  String get syncContactsLabelText => 'Synkronisera samtalsloggkontakter';

  @override
  String get syncContactsCTAText => 'Synkronisera nu';

  @override
  String get softwareInformationText => 'Programvaruinformation';

  @override
  String get addToContactsText => 'Lägg till i kontakter';

  @override
  String get addToContactsErrorText => 'Kunde inte lägga till ny kontakt';

  @override
  String get appPermissionsDeniedError =>
      'Oj då! Det verkar som att åtkomst till samtalsloggar har nekats. För att Logger ska fungera smidigt, vänligen ge tillstånd.';

  @override
  String get appFatalError => 'Åh nej! Något oväntat hände!';

  @override
  String get appPreferencesError =>
      'Åh nej! Fel vid inläsning av inställningar.';

  @override
  String get uriPermissionError => 'Kunde inte få behörigheter';

  @override
  String get fileGenerationError =>
      'Ett fel uppstod vid generering av filen. Försök igen senare';

  @override
  String get fileShareMessage =>
      'Dela samtalsloggfil via Gmail, WhatsApp, etc...';

  @override
  String get fileShareSubject => 'Samtalsloggar';

  @override
  String get fileOpenError => 'Kunde inte öppna filen, försök igen senare';

  @override
  String get openingFileLabel => 'Öppnar fil';

  @override
  String get viewContactLabel => 'Visa kontakt';

  @override
  String get errorOpeningContact => 'Fel vid öppning av kontakt';

  @override
  String get waLaunchError => 'Kunde inte starta WhatsApp';

  @override
  String get closeText => 'Stäng';

  @override
  String get defaultPresetName => 'Standardförinställning';

  @override
  String get onLabel => 'På';

  @override
  String get offLabel => 'Av';

  @override
  String get filterPresetTitle => 'Filterförinställningar';

  @override
  String get addMorePresetsLabel => 'Lägg till förinställning';

  @override
  String get deleteAllPresetsLabel => 'radera alla';

  @override
  String get enablePresetsPlaceholderText =>
      'Aktivera förinställningar för att enkelt skapa och växla mellan flera filter för snabb anpassning av samtalsloggen.';

  @override
  String get noPresetsPlaceholderText =>
      'Börja skapa dina egna anpassade förinställningar för snabb filtrering';

  @override
  String get presetNameInputLabelText => 'Förinställningsnamn';

  @override
  String get presetNameInputHintText => 'Ange ett namn för förinställningen';

  @override
  String get defaultLabelText => 'Standard';

  @override
  String get lastCallText => 'Senaste samtal';

  @override
  String get groupByContactAndTypeTitle => 'Gruppera efter kontakt och typ';

  @override
  String get groupByContactAndTypeDescription =>
      'Samtal grupperas efter kontakt och samtalstyp';

  @override
  String get groupByContactOnlyConsecutiveTitle =>
      'Gruppera efter på varandra följande kontakter';

  @override
  String get groupByContactOnlyConsecutiveDescription =>
      'Slår ihop på varandra följande samtal från samma kontakt till en grupp';

  @override
  String get groupByContactOnlyTitle => 'Gruppera efter kontakt';

  @override
  String get groupByContactOnlyDescription =>
      'Grupperar alla samtal från samma kontakt';

  @override
  String get groupByNoneDescription =>
      'Ingen gruppering — varje samtal visas separat';

  @override
  String get callGroupingText => 'Samtalsgruppering';

  @override
  String get useGroupingSwitchText => 'Använd gruppering med filter';

  @override
  String get clearFiltersTooltip => 'Rensa filter';

  @override
  String get scrollToTopTooltip => 'Skrolla till toppen';

  @override
  String get watchListText => 'Bevakningslista';

  @override
  String get roundDurationText => 'Avrunda samtal till minuter';

  @override
  String get roundDurationTextSubtitle =>
      'Avrunda samtal till närmaste minut för fakturering';

  @override
  String get groupedCallSettingSubtitle =>
      'Välj hur samtal ska grupperas för enklare spårning och översikt';

  @override
  String get filterPresetsSettingSubtitle =>
      'Skapa, spara och återanvänd filter för att enkelt hitta samtal';

  @override
  String get exportFilenameSettingSubtitle =>
      'Anpassa hur dina exporterade filer namnges';

  @override
  String get exportFormatSettingSubtitle =>
      'Välj format för exporterade samtalsloggar';

  @override
  String get importCallLogsSettingSubtitle =>
      'Importera samtalshistorik från andra källor eller säkerhetskopior';

  @override
  String get appDetailsText => 'Appinformation & detaljer';

  @override
  String get appDetailsSubText => 'Version • Donera • Felrapport';

  @override
  String get enableDownloadConfirmationText => 'Bekräfta nedladdning';

  @override
  String get enableDownloadConfirmationSubText =>
      'Begär bekräftelse innan filer laddas ner';

  @override
  String get enableCallDurationFilteringText => 'Filtrering efter varaktighet';

  @override
  String get enableCallDurationFilteringSubText =>
      'Filtrera samtal baserat på deras längd';

  @override
  String get enableCallLogCountVisibilityText => 'Antal samtal';

  @override
  String get enableCallLogCountVisibilitySubText => 'Visa antal samtal per dag';

  @override
  String get enableFilterByAccountIdText => 'Filtrera efter konto-ID';

  @override
  String get enableFilterByAccountIdSubText =>
      'Visa samtal för ett specifikt SIM-kort eller konto';

  @override
  String get showTotalCallDurationText => 'Total samtalstid';

  @override
  String get showTotalCallDurationSubText =>
      'Visa den totala tiden som spenderats i samtal';

  @override
  String get disableLogsSharingText => 'Dölj dela-knappen';

  @override
  String get disableLogsSharingSubText => 'Dölj dela-knappen i samtalsloggen';

  @override
  String get trackListLabelText => 'Spårningslista';

  @override
  String get tracklistPlaceholderText =>
      'Hantera dina spårade kontakter effektivt. Tryck på + (uppe till höger) för att lägga till en kontakt, svep ett listobjekt åt vänster och tryck på Ta bort för att sluta spåra.';

  @override
  String get removeAllText => 'ta bort alla';

  @override
  String get trackContactLabelText => 'Kontaktnamn';

  @override
  String get trackContactText => 'Spåra en kontakt';

  @override
  String get removeText => 'Ta bort';

  @override
  String get iteractionScoreText => 'Interaktionspoäng';

  @override
  String get lastCallSinceText => 'Senaste samtal sedan';

  @override
  String get avgCallsMonthText => 'Genomsnittliga samtal / månad';

  @override
  String get avgCallDurationText => 'Genomsnittlig samtalslängd';

  @override
  String get peakCallDurationText => 'Högsta samtalslängd';

  @override
  String get callsPerWeekText => 'Genomsnittliga samtal / vecka';

  @override
  String get callDistByWeekDay => 'Samtalsfördelning per veckodag (%)';

  @override
  String addToTrackList(Object maxItems) {
    return 'Lägg till upp till $maxItems kontakter i din spårningslista för enkel uppföljning.';
  }

  @override
  String get addText => 'Lägg till';

  @override
  String get numberAlreadyAddedErrorText => 'Kontakt redan tillagd';

  @override
  String get invalidNumberErrorText => 'Ogiltigt telefonnummer';

  @override
  String get emptyPhoneNumberErrorText => 'Ange ett kontaktnamn';

  @override
  String get trackNumberErrorText =>
      'Ett fel uppstod vid tillägg av ny spårningskontakt';

  @override
  String get quickFilterText => 'Snabbfilter';
}
