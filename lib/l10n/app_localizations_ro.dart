// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get aboutText => 'Despre';

  @override
  String get advancedSettingsLabelText => 'Setări avansate';

  @override
  String get analyticsPolicyLabelText => 'Politica de analiză';

  @override
  String get analyticsPolicyText =>
      'Toate datele jurnalului de apeluri sunt analizate local pe dispozitivul dvs. și nu sunt niciodată transmise serverelor online, asigurându-vă confidențialitatea și menținând informațiile dvs. în siguranță și confidențialitate';

  @override
  String get analyticsScreenLabelText => 'Analize';

  @override
  String get appError => 'A apărut o eroare!';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => 'Aplică filtre';

  @override
  String get baseGhostErrorMessage => 'Ceva nu a mers bine';

  @override
  String get baseSettingsLabelText => 'Setări generale';

  @override
  String get blockedText => 'Blocat';

  @override
  String get callLogsExportFailureText => 'Eroare la descărcarea fișierului!';

  @override
  String get callLogsExportFormatLabelText =>
      'Formatul exportului jurnalelor de apeluri';

  @override
  String get callLogsExportSuccessText =>
      'Jurnalele de apeluri au fost extrase și descărcate cu succes';

  @override
  String get callTypeText => 'Tipul apelului';

  @override
  String get cancelText => 'Anulează';

  @override
  String get configureText => 'Configurează';

  @override
  String get confirmImportLabelText => 'Confirmă începerea importului';

  @override
  String get confirmImportText =>
      'Importul jurnalelor de apeluri este o sarcină importantă care poate corupe ireversibil jurnalele dvs. curente, poate suprascrie date și poate cauza inconsecvențe în istoricul dvs. Vă rugăm să rețineți că acest proces poate dura ceva timp și ar putea duce la problemele menționate mai sus. Procedați cu precauție.';

  @override
  String get continueText => 'Continuă';

  @override
  String get dateText => 'Data';

  @override
  String get donateText => 'Donează';

  @override
  String downloadConfirmationText(String currentImportType) {
    return 'Sigur doriți să descărcați jurnalele de apeluri în format $currentImportType? Această acțiune va salva istoricul apelurilor dvs. într-un fișier $currentImportType pe dispozitivul dvs.';
  }

  @override
  String get downloadText => 'Descarcă';

  @override
  String get dtAAcronymExapandedText => 'Numele complet al zilei săptămânii';

  @override
  String get dtBAcronymExapandedText => 'Numele complet al lunii';

  @override
  String get dtHAcronymExapandedText => 'Ora în format 24 de ore';

  @override
  String get dtIAcronymExapandedText => 'Ora în format 12 ore';

  @override
  String get dtMAcronymExapandedText => 'Minute';

  @override
  String get dtSAcronymExapandedText => 'Secunde';

  @override
  String get dtUAcronymExapandedText =>
      'Numărul săptămânii din an (duminica ca prima zi a săptămânii)';

  @override
  String get dtWAcronymExapandedText =>
      'Numărul săptămânii din an (lunea ca prima zi a săptămânii)';

  @override
  String get dtXAcronymExapandedText => 'Reprezentarea orei';

  @override
  String get dtYAcronymExapandedText => 'Anul cu secolul';

  @override
  String get dtZAcronymExapandedText => 'Numele fusului orar';

  @override
  String get dtaAcronymExapandedText => 'Numele prescurtat al zilei săptămânii';

  @override
  String get dtbAcronymExapandedText => 'Numele prescurtat al lunii';

  @override
  String get dtcAcronymExapandedText => 'Reprezentarea datei și orei';

  @override
  String get dtdAcronymExapandedText => 'Ziua lunii';

  @override
  String get dtfAcronymExapandedText => 'Milisecunde';

  @override
  String get dtjAcronymExapandedText => 'Ziua anului';

  @override
  String get dtmAcronymExapandedText => 'Luna ca număr';

  @override
  String get dtpAcronymExapandedText => 'Marcator AM/PM';

  @override
  String get dtxAcronymExapandedText => 'Reprezentarea datei';

  @override
  String get dtyAcronymExapandedText => 'Anul fără secol';

  @override
  String get dtzAcronymExapandedText => 'Decalajul fusului orar față de UTC';

  @override
  String get durationText => 'Durata';

  @override
  String get exploreNowText => 'Explorează acum';

  @override
  String get exploreProjectButtonText => 'Explorează proiectul pe Github';

  @override
  String get exportFileNameFormatLabelText =>
      'Formatul numelui fișierului de export';

  @override
  String get filenameFormatHintText => 'my-call-logs-[%token]';

  @override
  String get filenameFormatLabelText => 'Formatul numelui fișierului';

  @override
  String get filterText => 'Filtru';

  @override
  String get getStartedText => 'Începe';

  @override
  String get ghostErrorMessage => 'Hmm. Ceva nu a mers bine';

  @override
  String get hideText => 'Ascunde';

  @override
  String get hintMobileNumberText => '9XXXX XXXX';

  @override
  String get importCallLogsText => 'Importă jurnalele de apeluri';

  @override
  String get incomingText => 'Intrat';

  @override
  String get logsScreenLabelText => 'Jurnale';

  @override
  String get maximumDurationHintText => 'ex: 60';

  @override
  String get maximumDurationLabelText => 'Max (în sec.)';

  @override
  String get minimumDurationHintText => 'ex: 0';

  @override
  String get minimumDurationLabelText => 'Min (în sec.)';

  @override
  String get missedText => 'Pierdut';

  @override
  String get mobileNumberText => 'Număr de telefon mobil';

  @override
  String get nextText => 'Următorul';

  @override
  String get onboardingScreenFourSubtitle =>
      'Transferați fără probleme jurnalele de apeluri între dispozitive sau exportați-le pentru păstrare și analiză.';

  @override
  String get onboardingScreenFourTitle => 'Importă și exportă';

  @override
  String get onboardingScreenOneSubtitle =>
      'Aplicația dvs. ideală pentru gestionarea și analizarea jurnalelor de apeluri fără efort.';

  @override
  String get onboardingScreenOneTitle => 'Bun venit la Înregistrator!';

  @override
  String get onboardingScreenThreeSubtitle =>
      'Înțelegeți tiparele apelurilor dvs. ca niciodată și obțineți informații detaliate pentru a vă optimiza timpul.';

  @override
  String get onboardingScreenThreeTitle => 'Analizați apelurile dvs.';

  @override
  String get onboardingScreenTwoSubtitle =>
      'Căutați, filtrați și gestionați jurnalele de apeluri cu o interfață fluidă și intuitivă.';

  @override
  String get onboardingScreenTwoTitle => 'Gestionați jurnalele de apeluri';

  @override
  String get openText => 'Deschide';

  @override
  String get outgoingText => 'Ieșit';

  @override
  String get phoneAccountIdText => 'ID cont telefonic';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => 'platformă';

  @override
  String get randomDTRepr => 'Vin, 12 Iul 2024 14:15:00';

  @override
  String get randomMonthAbbr => 'Iul';

  @override
  String get randomMonthName => 'Iulie';

  @override
  String get randomWeekdayAbbr => 'Vin';

  @override
  String get randomWeekdayName => 'Vineri';

  @override
  String get refreshText => 'Reîmprospătează';

  @override
  String get rejectedText => 'Respins';

  @override
  String get reportIssueButtonText => 'Raportează o problemă sau un bug';

  @override
  String get resetText => 'Resetează';

  @override
  String get resetToDefaultText => 'Resetează la implicit';

  @override
  String get saveText => 'Salvare';

  @override
  String get settingsScreenLabelText => 'Setări';

  @override
  String get shareText => 'Distribuie';

  @override
  String get simText => 'Numele afișat al SIM-ului';

  @override
  String get skipText => 'Sari';

  @override
  String get startImportText => 'Începe importul';

  @override
  String get storagePolicyLabelText => 'Politica de stocare';

  @override
  String get storagePolicyText =>
      'Această aplicație stochează temporar fișierele generate, ștergându-le la ieșire. Puteți descărca jurnalele de apeluri în locația aleasă. Înregistrator accesează doar jurnalele de apeluri, asigurându-vă confidențialitatea.';

  @override
  String get supportedFormatInformation =>
      'Vă rugăm să rețineți: Doar formatul CSV este acceptat în prezent pentru importul jurnalelor de apeluri.';

  @override
  String get timeText => 'Ora';

  @override
  String get tokenAccordianText => 'jetoane de formatare a datei și orei';

  @override
  String get tokensInfoText =>
      'Puteți utiliza jetoanele furnizate pentru a personaliza formatul numelui de fișier în funcție de preferințele specifice de dată și oră.';

  @override
  String get unknownText => 'Necunoscut';

  @override
  String get versionText => 'versiune';

  @override
  String get viewText => 'Vizualizare';

  @override
  String get wifiIncomingText => 'WiFi Intrat';

  @override
  String get wifiOutgoingText => 'WiFi Ieșit';

  @override
  String get callStatsText => 'Statistici apeluri';

  @override
  String get callDurationText => 'Durata apelului';

  @override
  String get mostCalledNumberText => 'Cel mai apelat număr';

  @override
  String get callDirectionAnalysisText => 'Analiza direcției apelului';

  @override
  String get longestCallText => 'Cel mai lung apel';

  @override
  String topNLongestCalls(int n) {
    return 'Top $n cele mai lungi apeluri';
  }

  @override
  String get callText => 'Apel';

  @override
  String get smsText => 'SMS';

  @override
  String get nothingToDisplayText => 'Nimic de afișat';

  @override
  String get callsMadeText => 'Apeluri efectuate';

  @override
  String get callsReceivedText => 'Apeluri primite';

  @override
  String get callsMissedText => 'Apeluri pierdute';

  @override
  String get callsRejectedText => 'Apeluri respinse';

  @override
  String get callsBlockedText => 'Apeluri blocate';

  @override
  String get averageText => 'Medie';

  @override
  String get longestText => 'Cel mai lung';

  @override
  String get totalText => 'Total';

  @override
  String get todayText => 'Astăzi';

  @override
  String get yesterdayText => 'Ieri';

  @override
  String get thisMonthText => 'Luna aceasta';

  @override
  String get pastMonthText => 'Luna trecută';

  @override
  String get thisYearText => 'Anul acesta';

  @override
  String get pastYearText => 'Anul trecut';

  @override
  String get allTimeText => 'Tot timpul';

  @override
  String get customText => 'Personalizat';

  @override
  String get startDateText => 'Data de începere';

  @override
  String get endDateText => 'Data de încheiere';

  @override
  String get dateRangeText => 'Interval de date';

  @override
  String get searchByNumberText => 'Număr de telefon specific';

  @override
  String get phoneAccountIdFilterText => 'ID cont telefonic';

  @override
  String get filterByDurationText => 'Filtrează după durata apelului';

  @override
  String get filterByCallTypeText => 'Tipul apelului';

  @override
  String get answeredExternallyText => 'Răspuns extern';

  @override
  String get voiceMailText => 'Mesagerie vocală';

  @override
  String get exportOpenHintText => 'Export Deschide';

  @override
  String get anyText => 'Oricare';

  @override
  String get processingFileText => 'Se procesează fișierul';

  @override
  String get insertingLogsText => 'Se inserează jurnalele';

  @override
  String get takingMoreTimeText => 'Acest lucru poate dura mai mult';

  @override
  String get pleaseWaitText => 'Vă rugăm să așteptați';

  @override
  String get importSuccessMessageText =>
      'Jurnalele de apeluri au fost importate cu succes';

  @override
  String get failedToUpdateSettingsText =>
      'Nu s-a reușit actualizarea setărilor. Vă rugăm să încercați din nou mai târziu';

  @override
  String get shareSettingUpdateSuccessMsgText =>
      'Setările de partajare au fost actualizate cu succes.';

  @override
  String get downloadSettingUpdatedSuccessMsgText =>
      'Setările de descărcare au fost actualizate cu succes.';

  @override
  String get settingUpdateSuccessMsgText =>
      'Setarea a fost actualizată cu succes.';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText =>
      'Setările filtrului de durată au fost actualizate cu succes.';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      'Setările de filtrare după ID-ul contului de telefon au fost actualizate cu succes.';

  @override
  String get generalSettingUpdatedSuccessMsgText =>
      'Setările au fost actualizate cu succes.';

  @override
  String get importSettingUpdatedSuccessMsgText =>
      'Setările de import au fost actualizate cu succes.';

  @override
  String get exportFieldInfoText => 'Informații despre câmpurile de export';

  @override
  String get csvJsonExportNameField =>
      'Nume asociat cu intrarea în jurnalul de apeluri';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      'ID-ul contului telefonic asociat cu apelul identifică contul specific sau cartela SIM utilizată pentru a efectua sau primi apelul';

  @override
  String get csvJsonExportCallTypeField =>
      'Tipul apelului (de exemplu, intrare, ieșire, pierdut)';

  @override
  String get csvJsonExportNumberField =>
      'Numărul de telefon asociat cu intrarea în jurnalul de apeluri';

  @override
  String get csvJsonExportFormattedNumberField =>
      'Număr de telefon formatat, formatat cu reguli de formatare bazate pe țara în care se afla utilizatorul când s-a efectuat sau s-a primit apelul.';

  @override
  String get csvJsonExportSimDisplayField =>
      'Numele afișat al cartelei SIM asociate cu apelul';

  @override
  String get csvJsonExportTimestampField =>
      'Marcajul temporal (ora epocii) al apelului';

  @override
  String get csvJsonExportDurationField => 'Durata apelului în secunde';

  @override
  String get csvJsonExportCachedNumberLabelField =>
      'Eticheta asociată cu numărul de telefon memorat în cache';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      'Tipul de număr memorat în cache (Acasă, Serviciu etc.) asociat cu numărul de telefon, dacă există.';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      'Număr de telefon stocat sau memorat în cache asociat cu o intrare în jurnalul de apeluri pentru referință rapidă.';

  @override
  String get exportFieldInfoHintText => 'Informații despre câmpurile de export';

  @override
  String get naText => 'nu este cazul';

  @override
  String get confirmDownloadText => 'Confirmați descărcarea';

  @override
  String get mostReceivedNumberText => 'Numărul cel mai primit';

  @override
  String get confirmContactsSyncLabelText =>
      'Confirmați sincronizarea contactelor';

  @override
  String get confirmContactsSyncConfirmationText =>
      'Acest proces va analiza jurnalele de apeluri și va actualiza numele contactelor lipsă, potrivind-le cu contactele salvate. Nu va modifica alte detalii din istoricul apelurilor.';

  @override
  String get contactsSyncSuccessMessageText =>
      'Contactele au fost sincronizate cu succes cu jurnalele de apeluri';

  @override
  String get contactsSyncErrorMessageText =>
      'Eroare la sincronizarea contactelor!';

  @override
  String get contactsPermissionDenied =>
      'Permisiunea pentru contacte a fost refuzată!';

  @override
  String get syncContactsLabelText =>
      'Sincronizați contactele din jurnalul de apeluri';

  @override
  String get syncContactsCTAText => 'Sincronizați acum';

  @override
  String get softwareInformationText => 'Informații despre software';

  @override
  String get addToContactsText => 'Adaugă la contacte';

  @override
  String get addToContactsErrorText => 'Nu s-a putut adăuga un nou contact';

  @override
  String get appPermissionsDeniedError =>
      'Oh, nu! Se pare că accesul la jurnalele de apeluri a fost refuzat. Pentru a asigura funcționarea corectă a Logger, acordați permisiunea.';

  @override
  String get appFatalError => 'Ah, vai! S-a întâmplat ceva neașteptat!';

  @override
  String get appPreferencesError =>
      'Ah, vai! Eroare la încărcarea preferințelor.';

  @override
  String get uriPermissionError => 'Nu se pot obține permisiuni';

  @override
  String get fileGenerationError =>
      'A apărut o eroare la generarea fișierului. Vă rugăm să încercați din nou mai târziu';

  @override
  String get fileShareMessage =>
      'Partajați fișierul jurnalului de apeluri prin Gmail, WhatsApp etc...';

  @override
  String get fileShareSubject => 'Jurnale de apeluri';

  @override
  String get fileOpenError =>
      'Nu se poate deschide fișierul, încercați din nou mai târziu';

  @override
  String get openingFileLabel => 'Se deschide fișierul';

  @override
  String get viewContactLabel => 'Vezi contact';

  @override
  String get errorOpeningContact => 'Eroare la deschiderea contactului';

  @override
  String get waLaunchError => 'Nu s-a putut lansa WhatsApp';

  @override
  String get closeText => 'Închide';

  @override
  String get defaultPresetName => 'Presetare implicită';

  @override
  String get onLabel => 'Pornit';

  @override
  String get offLabel => 'Oprit';

  @override
  String get filterPresetTitle => 'Presetări filtru';

  @override
  String get addMorePresetsLabel => 'Adaugă presetare';

  @override
  String get deleteAllPresetsLabel => 'șterge tot';

  @override
  String get enablePresetsPlaceholderText =>
      'Activează presetările pentru a crea și comuta ușor între mai multe filtre pentru personalizarea rapidă a jurnalului de apeluri.';

  @override
  String get noPresetsPlaceholderText =>
      'Începeți să creați propriile presetări personalizate pentru filtrare rapidă';

  @override
  String get presetNameInputLabelText => 'Numele presetării';

  @override
  String get presetNameInputHintText => 'Introduceți un nume pentru presetare';

  @override
  String get defaultLabelText => 'Implicit';

  @override
  String get lastCallText => 'Ultimul apel';

  @override
  String get groupByContactAndTypeTitle => 'Grupare după contact și tip';

  @override
  String get groupByContactAndTypeDescription =>
      'Apelurile sunt grupate după contact și tipul apelului';

  @override
  String get groupByContactOnlyConsecutiveTitle =>
      'Grupare după contacte consecutive';

  @override
  String get groupByContactOnlyConsecutiveDescription =>
      'Combină apelurile consecutive de la același contact într-un singur grup';

  @override
  String get groupByContactOnlyTitle => 'Grupare după contact';

  @override
  String get groupByContactOnlyDescription =>
      'Grupează toate apelurile de la același contact';

  @override
  String get groupByNoneDescription =>
      'Fără grupare — fiecare apel este afișat separat';

  @override
  String get callGroupingText => 'Gruparea apelurilor';

  @override
  String get useGroupingSwitchText => 'Folosește gruparea cu filtre';

  @override
  String get clearFiltersTooltip => 'Șterge filtrele';

  @override
  String get scrollToTopTooltip => 'Derulează în sus';

  @override
  String get watchListText => 'Listă de monitorizare';

  @override
  String get roundDurationText => 'Rotunjește apelurile la minute';

  @override
  String get roundDurationTextSubtitle =>
      'Rotunjește apelurile la minutul cel mai apropiat pentru facturare';

  @override
  String get groupedCallSettingSubtitle =>
      'Alege cum să grupezi apelurile pentru o urmărire și o privire de ansamblu mai ușoară';

  @override
  String get filterPresetsSettingSubtitle =>
      'Creează, salvează și reutilizează filtre pentru a găsi apeluri cu ușurință';

  @override
  String get exportFilenameSettingSubtitle =>
      'Personalizează modul în care sunt denumite fișierele exportate';

  @override
  String get exportFormatSettingSubtitle =>
      'Alege formatul pentru jurnalele de apel exportate';

  @override
  String get importCallLogsSettingSubtitle =>
      'Importă istoricul apelurilor din alte surse sau copii de rezervă';

  @override
  String get appDetailsText => 'Informații și detalii despre aplicație';

  @override
  String get appDetailsSubText => 'Versiune • Donează • Raportare bug';

  @override
  String get enableDownloadConfirmationText => 'Confirmă descărcarea';

  @override
  String get enableDownloadConfirmationSubText =>
      'Solicită confirmare înainte de a descărca fișiere';

  @override
  String get enableCallDurationFilteringText => 'Filtrare după durată';

  @override
  String get enableCallDurationFilteringSubText =>
      'Filtrează apelurile după durata lor';

  @override
  String get enableCallLogCountVisibilityText => 'Număr de apeluri';

  @override
  String get enableCallLogCountVisibilitySubText =>
      'Afișează numărul de apeluri pentru fiecare zi';

  @override
  String get enableFilterByAccountIdText => 'Filtrare după ID cont';

  @override
  String get enableFilterByAccountIdSubText =>
      'Afișează apelurile pentru un SIM sau cont specific';

  @override
  String get showTotalCallDurationText => 'Durata totală a apelurilor';

  @override
  String get showTotalCallDurationSubText =>
      'Afișează timpul total petrecut la apeluri';

  @override
  String get disableLogsSharingText => 'Ascunde butonul de partajare';

  @override
  String get disableLogsSharingSubText =>
      'Ascunde butonul de partajare din jurnalul de apeluri';

  @override
  String get trackListLabelText => 'Lista de urmărire';

  @override
  String get tracklistPlaceholderText =>
      'Gestionează-ți lista de urmărire eficient. Apasă + (în dreapta sus) pentru a adăuga un număr, glisează spre stânga pe un element din listă și apasă Elimină pentru a opri urmărirea.';

  @override
  String get removeAllText => 'elimină tot';

  @override
  String get trackContactLabelText => 'Număr de telefon';

  @override
  String get trackContactText => 'Urmărește un contact';

  @override
  String get removeText => 'Elimină';

  @override
  String get iteractionScoreText => 'Scor de interacțiune';

  @override
  String get lastCallSinceText => 'Ultimul apel de la';

  @override
  String get avgCallsMonthText => 'Apeluri medii / lună';

  @override
  String get avgCallDurationText => 'Durata medie a apelurilor';

  @override
  String get peakCallDurationText => 'Durata maximă a apelurilor';

  @override
  String get callsPerWeekText => 'Apeluri medii / săptămână';

  @override
  String get callDistByWeekDay =>
      'Distribuția apelurilor pe zilele săptămânii (%)';

  @override
  String addToTrackList(Object maxItems) {
    return 'Adaugă până la $maxItems contacte în lista ta de urmărire pentru o urmărire ușoară.';
  }

  @override
  String get addText => 'Adaugă';

  @override
  String get numberAlreadyAddedErrorText => 'Numărul a fost deja adăugat';

  @override
  String get invalidNumberErrorText => 'Număr de telefon invalid';

  @override
  String get emptyPhoneNumberErrorText => 'Introduceți un număr de telefon';

  @override
  String get trackNumberErrorText =>
      'A apărut o eroare la adăugarea noului contact de urmărire';

  @override
  String get quickFilterText => 'Filtru rapid';
}
