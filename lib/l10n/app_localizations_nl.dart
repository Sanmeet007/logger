// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get aboutText => 'Over';

  @override
  String get advancedSettingsLabelText => 'Geavanceerde instellingen';

  @override
  String get analyticsPolicyLabelText => 'Analyticsbeleid';

  @override
  String get analyticsPolicyText =>
      'Alle oproeploggegevens worden lokaal op je apparaat geanalyseerd en nooit naar online servers verzonden, waardoor je privacy gewaarborgd blijft en je informatie veilig en vertrouwelijk blijft';

  @override
  String get analyticsScreenLabelText => 'Analytics';

  @override
  String get appError => 'Oeps! Er is iets fout gegaan';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => 'Filters toepassen';

  @override
  String get baseGhostErrorMessage => 'Er is iets fout gegaan';

  @override
  String get baseSettingsLabelText => 'Algemene instellingen';

  @override
  String get blockedText => 'Geblokkeerd';

  @override
  String get callLogsExportFailureText =>
      'Fout bij het downloaden van bestand!';

  @override
  String get callLogsExportFormatLabelText => 'Exportformaat oproeplogboeken';

  @override
  String get callLogsExportSuccessText =>
      'Oproeplogboeken succesvol geëxtraheerd en gedownload';

  @override
  String get callTypeText => 'Oproeptype';

  @override
  String get cancelText => 'Annuleren';

  @override
  String get configureText => 'Configureren';

  @override
  String get confirmImportLabelText => 'Bevestig start import';

  @override
  String get confirmImportText =>
      'Het importeren van oproeplogboeken is een belangrijke taak die je huidige logboeken onherstelbaar kan beschadigen, gegevens kan overschrijven en inconsistenties in je geschiedenis kan veroorzaken. Wees je ervan bewust dat dit proces enige tijd kan duren en tot de bovengenoemde problemen kan leiden. Ga voorzichtig te werk.';

  @override
  String get continueText => 'Doorgaan';

  @override
  String get dateText => 'Datum';

  @override
  String get donateText => 'Doneren';

  @override
  String downloadConfirmationText(String currentImportType) {
    return 'Weet je zeker dat je je oproeplogboeken in $currentImportType-formaat wilt downloaden? Met deze actie wordt je oproepgeschiedenis opgeslagen in een $currentImportType-bestand op je apparaat.';
  }

  @override
  String get downloadText => 'Downloaden';

  @override
  String get dtAAcronymExapandedText => 'Volledige naam van de weekdag';

  @override
  String get dtBAcronymExapandedText => 'Volledige naam van de maand';

  @override
  String get dtHAcronymExapandedText => 'Uur in 24-uurs formaat';

  @override
  String get dtIAcronymExapandedText => 'Uur in 12-uurs formaat';

  @override
  String get dtMAcronymExapandedText => 'Minuten';

  @override
  String get dtSAcronymExapandedText => 'Seconden';

  @override
  String get dtUAcronymExapandedText =>
      'Weeknummer van het jaar (zondag als de eerste dag van de week)';

  @override
  String get dtWAcronymExapandedText =>
      'Weeknummer van het jaar (maandag als de eerste dag van de week)';

  @override
  String get dtXAcronymExapandedText => 'Tijdweergave';

  @override
  String get dtYAcronymExapandedText => 'Jaar met eeuw';

  @override
  String get dtZAcronymExapandedText => 'Naam van de tijdzone';

  @override
  String get dtaAcronymExapandedText => 'Afgekorte naam van de weekdag';

  @override
  String get dtbAcronymExapandedText => 'Afgekorte naam van de maand';

  @override
  String get dtcAcronymExapandedText => 'Datum- en tijdweergave';

  @override
  String get dtdAcronymExapandedText => 'Dag van de maand';

  @override
  String get dtfAcronymExapandedText => 'Milliseconden';

  @override
  String get dtjAcronymExapandedText => 'Dag van het jaar';

  @override
  String get dtmAcronymExapandedText => 'Maand als een getal';

  @override
  String get dtpAcronymExapandedText => 'AM/PM-markering';

  @override
  String get dtxAcronymExapandedText => 'Datumweergave';

  @override
  String get dtyAcronymExapandedText => 'Jaar zonder eeuw';

  @override
  String get dtzAcronymExapandedText => 'Tijdzone-offset van UTC';

  @override
  String get durationText => 'Duur';

  @override
  String get exploreNowText => 'Nu verkennen';

  @override
  String get exploreProjectButtonText => 'Project verkennen op Github';

  @override
  String get exportFileNameFormatLabelText => 'Export bestandsnaamformaat';

  @override
  String get filenameFormatHintText => 'mijn-oproeplogboeken-[%token]';

  @override
  String get filenameFormatLabelText => 'Bestandsnaamformaat';

  @override
  String get filterText => 'Filter';

  @override
  String get getStartedText => 'Aan de slag';

  @override
  String get ghostErrorMessage => 'Hmm. Er is iets fout gegaan';

  @override
  String get hideText => 'Verbergen';

  @override
  String get hintMobileNumberText => '0XXXX XXXXX';

  @override
  String get importCallLogsText => 'Importeer je oproeplogboeken';

  @override
  String get incomingText => 'Inkomend';

  @override
  String get logsScreenLabelText => 'Logboeken';

  @override
  String get maximumDurationHintText => 'bv: 60';

  @override
  String get maximumDurationLabelText => 'Min (in sec)';

  @override
  String get minimumDurationHintText => 'bv: 0';

  @override
  String get minimumDurationLabelText => 'Min (in sec)';

  @override
  String get missedText => 'Gemist';

  @override
  String get mobileNumberText => 'Mobiel nummer';

  @override
  String get nextText => 'Volgende';

  @override
  String get onboardingScreenFourSubtitle =>
      'Breng moeiteloos oproeplogboeken over tussen apparaten of exporteer ze voor bewaring en analyse.';

  @override
  String get onboardingScreenFourTitle => 'Importeren & exporteren';

  @override
  String get onboardingScreenOneSubtitle =>
      'Je aangewezen app voor het moeiteloos beheren en analyseren van je oproeplogboeken.';

  @override
  String get onboardingScreenOneTitle => 'Welkom bij Logger!';

  @override
  String get onboardingScreenThreeSubtitle =>
      'Begrijp je oproeppatronen als nooit tevoren en krijg gedetailleerde inzichten om je tijd te optimaliseren.';

  @override
  String get onboardingScreenThreeTitle => 'Analyseer je oproepen';

  @override
  String get onboardingScreenTwoSubtitle =>
      'Zoek, filter en beheer je oproeplogboeken met een naadloze en intuïtieve interface.';

  @override
  String get onboardingScreenTwoTitle => 'Oproeplogboeken beheren';

  @override
  String get openText => 'Openen';

  @override
  String get outgoingText => 'Uitgaand';

  @override
  String get phoneAccountIdText => 'Telefoonaccount-ID';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => 'platform';

  @override
  String get randomDTRepr => 'Vr, 12 jul 2024 14:15:00';

  @override
  String get randomMonthAbbr => 'jul';

  @override
  String get randomMonthName => 'juli';

  @override
  String get randomWeekdayAbbr => 'Vr';

  @override
  String get randomWeekdayName => 'vrijdag';

  @override
  String get refreshText => 'Vernieuwen';

  @override
  String get rejectedText => 'Afgewezen';

  @override
  String get reportIssueButtonText => 'Een probleem of bug melden';

  @override
  String get resetText => 'Resetten';

  @override
  String get resetToDefaultText => 'Terugzetten naar standaard';

  @override
  String get saveText => 'Opslaan';

  @override
  String get settingsScreenLabelText => 'Instellingen';

  @override
  String get shareText => 'Delen';

  @override
  String get simText => 'SIM-weergavenaam';

  @override
  String get skipText => 'Overslaan';

  @override
  String get startImportText => 'Start import';

  @override
  String get storagePolicyLabelText => 'Opslagbeleid';

  @override
  String get storagePolicyText =>
      'Deze app slaat tijdelijk gegenereerde bestanden op en verwijdert ze bij het afsluiten. Je kunt oproeplogboeken downloaden naar de door jou gekozen locatie. Logger heeft alleen toegang tot oproeplogboeken, waardoor je privacy gewaarborgd is.';

  @override
  String get supportedFormatInformation =>
      'Let op: alleen CSV-formaat wordt momenteel ondersteund voor het importeren van oproeplogboeken.';

  @override
  String get timeText => 'Tijd';

  @override
  String get tokenAccordianText => 'datum- en tijdopmaak tokens';

  @override
  String get tokensInfoText =>
      'Je kunt de verstrekte tokens gebruiken om je bestandsnaamformaat aan te passen op basis van specifieke datum- en tijdvoorkeuren.';

  @override
  String get unknownText => 'Onbekend';

  @override
  String get versionText => 'versie';

  @override
  String get viewText => 'Bekijken';

  @override
  String get wifiIncomingText => 'Wifi Inkomend';

  @override
  String get wifiOutgoingText => 'Wifi Uitgaand';

  @override
  String get callStatsText => 'Oproepstatistieken';

  @override
  String get callDurationText => 'Gespreksduur';

  @override
  String get mostCalledNumberText => 'Meest gebelde nummer';

  @override
  String get callDirectionAnalysisText => 'Oproeprichtinganalyse';

  @override
  String get longestCallText => 'Langste gesprek';

  @override
  String topNLongestCalls(int n) {
    return 'Top $n langste gesprekken';
  }

  @override
  String get callText => 'Oproep';

  @override
  String get smsText => 'SMS';

  @override
  String get nothingToDisplayText => 'Niets om weer te geven';

  @override
  String get callsMadeText => 'Gepleegde oproepen';

  @override
  String get callsReceivedText => 'Ontvangen oproepen';

  @override
  String get callsMissedText => 'Gemiste oproepen';

  @override
  String get callsRejectedText => 'Afgewezen oproepen';

  @override
  String get callsBlockedText => 'Geblokkeerde oproepen';

  @override
  String get averageText => 'Gemiddelde';

  @override
  String get longestText => 'Langste';

  @override
  String get totalText => 'Totaal';

  @override
  String get todayText => 'Vandaag';

  @override
  String get yesterdayText => 'Gisteren';

  @override
  String get thisMonthText => 'Deze maand';

  @override
  String get pastMonthText => 'Vorige maand';

  @override
  String get thisYearText => 'Dit jaar';

  @override
  String get pastYearText => 'Vorig jaar';

  @override
  String get allTimeText => 'Alle tijden';

  @override
  String get customText => 'Aangepast';

  @override
  String get startDateText => 'Startdatum';

  @override
  String get endDateText => 'Einddatum';

  @override
  String get dateRangeText => 'Datumbereik';

  @override
  String get searchByNumberText => 'Specifiek telefoonnummer';

  @override
  String get phoneAccountIdFilterText => 'Telefoonaccount-ID';

  @override
  String get filterByDurationText => 'Filteren op gespreksduur';

  @override
  String get showUnknownContactsOnlyText => 'Unknown Contacts Only';

  @override
  String get filterByCallTypeText => 'Oproeptype';

  @override
  String get answeredExternallyText => 'Extern beantwoord';

  @override
  String get voiceMailText => 'VoiceMail';

  @override
  String get exportOpenHintText => 'Export openen';

  @override
  String get anyText => 'Elke';

  @override
  String get processingFileText => 'Bestand verwerken';

  @override
  String get insertingLogsText => 'Logboeken invoegen';

  @override
  String get takingMoreTimeText => 'Dit kan langer duren';

  @override
  String get pleaseWaitText => 'Even geduld aub';

  @override
  String get importSuccessMessageText =>
      'Oproeplogboeken succesvol geïmporteerd';

  @override
  String get failedToUpdateSettingsText =>
      'Instellingen konden niet worden bijgewerkt. Probeer het later opnieuw';

  @override
  String get shareSettingUpdateSuccessMsgText =>
      'Deelinstellingen succesvol bijgewerkt.';

  @override
  String get downloadSettingUpdatedSuccessMsgText =>
      'Downloadinstellingen succesvol bijgewerkt.';

  @override
  String get settingUpdateSuccessMsgText => 'Instelling succesvol bijgewerkt.';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText =>
      'Duurfilterinstellingen succesvol bijgewerkt.';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      'Filteren op telefoonaccount-id-instellingen succesvol bijgewerkt.';

  @override
  String get generalSettingUpdatedSuccessMsgText =>
      'Instellingen succesvol bijgewerkt.';

  @override
  String get importSettingUpdatedSuccessMsgText =>
      'Importinstellingen succesvol bijgewerkt.';

  @override
  String get exportFieldInfoText => 'Informatie over exportvelden';

  @override
  String get csvJsonExportNameField => 'Naam gekoppeld aan de oproeplogboeking';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      'De ID van het telefoonaccount dat aan de oproep is gekoppeld, identificeert het specifieke account of de simkaart die is gebruikt om het gesprek te plaatsen of te ontvangen';

  @override
  String get csvJsonExportCallTypeField =>
      'Type van de oproep (bv. inkomend, uitgaand, gemist)';

  @override
  String get csvJsonExportNumberField =>
      'Telefoonnummer gekoppeld aan de oproeplogboeking';

  @override
  String get csvJsonExportFormattedNumberField =>
      'Geformatteerd telefoonnummer, geformatteerd met opmaakregels op basis van het land waarin de gebruiker zich bevond toen het gesprek werd gepleegd of ontvangen.';

  @override
  String get csvJsonExportSimDisplayField =>
      'Weergavenaam van de simkaart die aan de oproep is gekoppeld';

  @override
  String get csvJsonExportTimestampField =>
      'Tijdstempel (epochtijd) van het gesprek';

  @override
  String get csvJsonExportDurationField => 'Duur van het gesprek in seconden';

  @override
  String get csvJsonExportCachedNumberLabelField =>
      'Label gekoppeld aan het in het cachegeheugen opgeslagen telefoonnummer';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      'Het type (Thuis, Werk, enz.) van het in het cachegeheugen opgeslagen nummer dat aan het telefoonnummer is gekoppeld, indien het bestaat.';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      'Opgeslagen of in het cachegeheugen opgeslagen telefoonnummer dat is gekoppeld aan een oproeplogboeking voor snelle referentie.';

  @override
  String get exportFieldInfoHintText => 'Info over exportvelden';

  @override
  String get naText => 'n.v.t.';

  @override
  String get confirmDownloadText => 'Download bevestigen';

  @override
  String get mostReceivedNumberText => 'Meest ontvangen nummer';

  @override
  String get confirmContactsSyncLabelText =>
      'Bevestig synchronisatie van contacten';

  @override
  String get confirmContactsSyncConfirmationText =>
      'Dit proces scant je oproeplogs en werkt ontbrekende contactnamen bij door ze te matchen met je opgeslagen contacten. Het zal geen andere details in je oproephistorie wijzigen.';

  @override
  String get contactsSyncSuccessMessageText =>
      'Contacten succesvol gesynchroniseerd met oproeplogs';

  @override
  String get contactsSyncErrorMessageText =>
      'Fout bij het synchroniseren van contacten!';

  @override
  String get contactsPermissionDenied =>
      'Toestemming voor contacten geweigerd!';

  @override
  String get syncContactsLabelText => 'Synchroniseer oproeplog contacten';

  @override
  String get syncContactsCTAText => 'Nu synchroniseren';

  @override
  String get softwareInformationText => 'Software-informatie';

  @override
  String get addToContactsText => 'Toevoegen aan contacten';

  @override
  String get addToContactsErrorText => 'Kan nieuw contact niet toevoegen';

  @override
  String get appPermissionsDeniedError =>
      'Oeps! Het lijkt erop dat toegang tot oproeplogboeken is geweigerd. Geef toestemming om ervoor te zorgen dat Logger soepel werkt.';

  @override
  String get appFatalError => 'Oeps! Er is iets onverwachts gebeurd!';

  @override
  String get appPreferencesError => 'Oeps! Fout bij het laden van voorkeuren.';

  @override
  String get uriPermissionError => 'Kan geen toestemming verkrijgen';

  @override
  String get fileGenerationError =>
      'Er is een fout opgetreden bij het genereren van het bestand. Probeer het later opnieuw';

  @override
  String get fileShareMessage =>
      'Deel het oproeplogbestand via Gmail, WhatsApp, etc...';

  @override
  String get fileShareSubject => 'Oproeplogboeken';

  @override
  String get fileOpenError =>
      'Kan bestand niet openen, probeer het later opnieuw';

  @override
  String get openingFileLabel => 'Bestand openen';

  @override
  String get viewContactLabel => 'Contact bekijken';

  @override
  String get errorOpeningContact => 'Fout bij openen van contact';

  @override
  String get waLaunchError => 'Kan WhatsApp niet starten';

  @override
  String get closeText => 'Sluiten';

  @override
  String get defaultPresetName => 'Standaard preset';

  @override
  String get onLabel => 'Ein';

  @override
  String get offLabel => 'Aus';

  @override
  String get filterPresetTitle => 'Filtervoreinstellungen';

  @override
  String get addMorePresetsLabel => 'Voorinstelling toevoegen';

  @override
  String get deleteAllPresetsLabel => 'alle löschen';

  @override
  String get enablePresetsPlaceholderText =>
      'Aktivieren Sie Voreinstellungen, um mehrere Filter einfach zu erstellen und zwischen ihnen zu wechseln, um das Anrufprotokoll schnell anzupassen.';

  @override
  String get noPresetsPlaceholderText =>
      'Beginnen Sie mit der Erstellung Ihrer eigenen benutzerdefinierten Voreinstellungen für schnelles Filtern';

  @override
  String get presetNameInputLabelText => 'Voreinstellungsname';

  @override
  String get presetNameInputHintText =>
      'Geben Sie einen Namen für die Voreinstellung ein';

  @override
  String get defaultLabelText => 'Standaard';

  @override
  String get lastCallText => 'Laatste oproep';

  @override
  String get groupByContactAndTypeTitle => 'Groepeer op contact en type';

  @override
  String get groupByContactAndTypeDescription =>
      'Oproepen worden gegroepeerd op contact en type oproep';

  @override
  String get groupByContactOnlyConsecutiveTitle =>
      'Groepeer opeenvolgende contacten';

  @override
  String get groupByContactOnlyConsecutiveDescription =>
      'Voegt opeenvolgende oproepen van hetzelfde contact samen in één groep';

  @override
  String get groupByContactOnlyTitle => 'Groepeer op contact';

  @override
  String get groupByContactOnlyDescription =>
      'Groepeert alle oproepen van hetzelfde contact';

  @override
  String get groupByNoneDescription =>
      'Geen groepering — elke oproep wordt afzonderlijk weergegeven';

  @override
  String get callGroupingText => 'Oproepgroepering';

  @override
  String get useGroupingSwitchText => 'Groepering met filters gebruiken';

  @override
  String get clearFiltersTooltip => 'Filters wissen';

  @override
  String get scrollToTopTooltip => 'Scroll naar boven';

  @override
  String get watchListText => 'Volglijst';

  @override
  String get roundDurationText => 'Rond gesprekken af op minuten';

  @override
  String get roundDurationTextSubtitle =>
      'Rond gesprekken af op de dichtstbijzijnde minuut voor facturering';

  @override
  String get groupedCallSettingSubtitle =>
      'Kies hoe oproepen gegroepeerd worden voor eenvoudigere tracking en overzicht';

  @override
  String get filterPresetsSettingSubtitle =>
      'Maak, sla op en hergebruik filters om oproepen eenvoudig te vinden';

  @override
  String get exportFilenameSettingSubtitle =>
      'Pas aan hoe uw geëxporteerde bestanden worden benoemd';

  @override
  String get exportFormatSettingSubtitle =>
      'Kies het formaat voor geëxporteerde oproeplogs';

  @override
  String get importCallLogsSettingSubtitle =>
      'Belgeschiedenis importeren vanuit andere bronnen of back-ups';

  @override
  String get appDetailsText => 'App-info & details';

  @override
  String get appDetailsSubText => 'Versie • Doneren • Bugrapport';

  @override
  String get enableDownloadConfirmationText => 'Download bevestigen';

  @override
  String get enableDownloadConfirmationSubText =>
      'Vraag om bevestiging voordat bestanden worden gedownload';

  @override
  String get enableCallDurationFilteringText => 'Filteren op duur';

  @override
  String get enableCallDurationFilteringSubText =>
      'Filter oproepen op basis van hun duur';

  @override
  String get enableCallLogCountVisibilityText => 'Aantal oproepen';

  @override
  String get enableCallLogCountVisibilitySubText =>
      'Aantal oproepen per dag weergeven';

  @override
  String get enableFilterByAccountIdText => 'Filteren op account-ID';

  @override
  String get enableFilterByAccountIdSubText =>
      'Toon oproepen voor een specifieke sim of account';

  @override
  String get showTotalCallDurationText => 'Totale gespreksduur';

  @override
  String get showTotalCallDurationSubText =>
      'Toon de totale tijd die aan oproepen is besteed';

  @override
  String get disableLogsSharingText => 'Deelknop verbergen';

  @override
  String get disableLogsSharingSubText =>
      'Verberg de deelknop in de oproeplogs';

  @override
  String get trackListLabelText => 'Volglijst';

  @override
  String get tracklistPlaceholderText =>
      'Beheer je gevolgde contacten efficiënt. Tik op + (rechtsboven) om een contact toe te voegen, veeg een lijstitem naar links en tik op Verwijderen om het volgen te stoppen.';

  @override
  String get removeAllText => 'alles verwijderen';

  @override
  String get trackContactLabelText => 'Contactnaam';

  @override
  String get trackContactText => 'Volg een contact';

  @override
  String get removeText => 'Verwijderen';

  @override
  String get iteractionScoreText => 'Interactie score';

  @override
  String get lastCallSinceText => 'Laatste oproep sinds';

  @override
  String get avgCallsMonthText => 'Gemiddeld aantal oproepen / maand';

  @override
  String get avgCallDurationText => 'Gemiddelde gespreksduur';

  @override
  String get peakCallDurationText => 'Langste gespreksduur';

  @override
  String get callsPerWeekText => 'Gemiddeld aantal oproepen / week';

  @override
  String get callDistByWeekDay => 'Oproepverdeling per weekdag (%)';

  @override
  String addToTrackList(Object maxItems) {
    return 'Voeg tot $maxItems contacten toe aan je volglijst voor eenvoudig bijhouden.';
  }

  @override
  String get addText => 'Toevoegen';

  @override
  String get numberAlreadyAddedErrorText => 'Contact al toegevoegd';

  @override
  String get invalidNumberErrorText => 'Ongeldig telefoonnummer';

  @override
  String get emptyPhoneNumberErrorText => 'Voer een contactnaam in';

  @override
  String get trackNumberErrorText =>
      'Er is iets misgegaan bij het toevoegen van het nieuwe contact';

  @override
  String get quickFilterText => 'Snelfilter';
}
