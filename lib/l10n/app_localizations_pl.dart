// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get aboutText => 'O Aplikacji';

  @override
  String get advancedSettingsLabelText => 'Ustawienia Zaawansowane';

  @override
  String get analyticsPolicyLabelText => 'Polityka Analityczna';

  @override
  String get analyticsPolicyText =>
      'Wszystkie dane dziennika połączeń są analizowane lokalnie na Twoim urządzeniu i nigdy nie są przesyłane na serwery online, zapewniając Twoją prywatność i bezpieczeństwo informacji';

  @override
  String get analyticsScreenLabelText => 'Analityka';

  @override
  String get appError => 'O nie! Coś poszło nie tak';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => 'Zastosuj Filtry';

  @override
  String get baseGhostErrorMessage => 'Coś poszło nie tak';

  @override
  String get baseSettingsLabelText => 'Ustawienia Ogólne';

  @override
  String get blockedText => 'Zablokowane';

  @override
  String get callLogsExportFailureText => 'Błąd podczas pobierania pliku!';

  @override
  String get callLogsExportFormatLabelText =>
      'Format eksportu dziennika połączeń';

  @override
  String get callLogsExportSuccessText =>
      'Dzienniki połączeń wyodrębnione i pomyślnie pobrane';

  @override
  String get callTypeText => 'Typ Połączenia';

  @override
  String get cancelText => 'Anuluj';

  @override
  String get configureText => 'Konfiguruj';

  @override
  String get confirmImportLabelText => 'Potwierdź Rozpoczęcie Importu';

  @override
  String get confirmImportText =>
      'Importowanie dzienników połączeń to znaczące zadanie, które może nieodwracalnie uszkodzić obecne dzienniki, nadpisać dane i spowodować niespójności w historii. Należy pamiętać, że ten proces może zająć trochę czasu i prowadzić do wspomnianych problemów. Prosimy o zachowanie ostrożności.';

  @override
  String get continueText => 'Kontynuuj';

  @override
  String get dateText => 'Data';

  @override
  String get donateText => 'Wesprzyj';

  @override
  String downloadConfirmationText(String currentImportType) {
    return 'Czy na pewno chcesz pobrać dzienniki połączeń w formacie $currentImportType? Spowoduje to zapisanie historii połączeń w pliku $currentImportType na Twoim urządzeniu.';
  }

  @override
  String get downloadText => 'Pobierz';

  @override
  String get dtAAcronymExapandedText => 'Pełna nazwa dnia tygodnia';

  @override
  String get dtBAcronymExapandedText => 'Pełna nazwa miesiąca';

  @override
  String get dtHAcronymExapandedText => 'Godzina w formacie 24-godzinnym';

  @override
  String get dtIAcronymExapandedText => 'Godzina w formacie 12-godzinnym';

  @override
  String get dtMAcronymExapandedText => 'Minuty';

  @override
  String get dtSAcronymExapandedText => 'Sekundy';

  @override
  String get dtUAcronymExapandedText =>
      'Numer tygodnia w roku (niedziela jako pierwszy dzień tygodnia)';

  @override
  String get dtWAcronymExapandedText =>
      'Numer tygodnia w roku (poniedziałek jako pierwszy dzień tygodnia)';

  @override
  String get dtXAcronymExapandedText => 'Reprezentacja czasu';

  @override
  String get dtYAcronymExapandedText => 'Rok z wiekiem';

  @override
  String get dtZAcronymExapandedText => 'Nazwa strefy czasowej';

  @override
  String get dtaAcronymExapandedText => 'Skrócona nazwa dnia tygodnia';

  @override
  String get dtbAcronymExapandedText => 'Skrócona nazwa miesiąca';

  @override
  String get dtcAcronymExapandedText => 'Reprezentacja daty i czasu';

  @override
  String get dtdAcronymExapandedText => 'Dzień miesiąca';

  @override
  String get dtfAcronymExapandedText => 'Milisekundy';

  @override
  String get dtjAcronymExapandedText => 'Dzień roku';

  @override
  String get dtmAcronymExapandedText => 'Miesiąc jako liczba';

  @override
  String get dtpAcronymExapandedText => 'Oznaczenie AM/PM';

  @override
  String get dtxAcronymExapandedText => 'Reprezentacja daty';

  @override
  String get dtyAcronymExapandedText => 'Rok bez wieku';

  @override
  String get dtzAcronymExapandedText =>
      'Przesunięcie strefy czasowej względem UTC';

  @override
  String get durationText => 'Czas Trwania';

  @override
  String get exploreNowText => 'Przeglądaj Teraz';

  @override
  String get exploreProjectButtonText => 'Przeglądaj Projekt na Githubie';

  @override
  String get exportFileNameFormatLabelText => 'Format nazwy pliku eksportu';

  @override
  String get filenameFormatHintText => 'moje-dzienniki-polaczen-[%token]';

  @override
  String get filenameFormatLabelText => 'Format Nazwy Pliku';

  @override
  String get filterText => 'Filtruj';

  @override
  String get getStartedText => 'Zacznij';

  @override
  String get ghostErrorMessage => 'Hmm. Coś poszło nie tak';

  @override
  String get hideText => 'Ukryj';

  @override
  String get hintMobileNumberText => '1XX XXX XXX';

  @override
  String get importCallLogsText => 'Importuj dzienniki połączeń';

  @override
  String get incomingText => 'Przychodzące';

  @override
  String get logsScreenLabelText => 'Dzienniki';

  @override
  String get maximumDurationHintText => 'np: 60';

  @override
  String get maximumDurationLabelText => 'Max (w sek)';

  @override
  String get minimumDurationHintText => 'np: 0';

  @override
  String get minimumDurationLabelText => 'Min (w sek)';

  @override
  String get missedText => 'Nieodebrane';

  @override
  String get mobileNumberText => 'Numer Telefonu';

  @override
  String get nextText => 'Dalej';

  @override
  String get onboardingScreenFourSubtitle =>
      'Bezproblemowo przesyłaj dzienniki połączeń między urządzeniami lub eksportuj je w celu zabezpieczenia i analizy.';

  @override
  String get onboardingScreenFourTitle => 'Import i Eksport';

  @override
  String get onboardingScreenOneSubtitle =>
      'Twoja aplikacja do łatwego zarządzania i analizowania dzienników połączeń.';

  @override
  String get onboardingScreenOneTitle => 'Witaj w Logger!';

  @override
  String get onboardingScreenThreeSubtitle =>
      'Zrozum swoje wzorce połączeń jak nigdy dotąd i uzyskaj szczegółowe informacje, aby zoptymalizować swój czas.';

  @override
  String get onboardingScreenThreeTitle => 'Analizuj Swoje Połączenia';

  @override
  String get onboardingScreenTwoSubtitle =>
      'Wyszukuj, filtruj i zarządzaj dziennikami połączeń za pomocą płynnego i intuicyjnego interfejsu.';

  @override
  String get onboardingScreenTwoTitle => 'Zarządzaj Dziennikami Połączeń';

  @override
  String get openText => 'Otwórz';

  @override
  String get outgoingText => 'Wychodzące';

  @override
  String get phoneAccountIdText => 'ID Konta Telefonicznego';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => 'platforma';

  @override
  String get randomDTRepr => 'Pt, 12 Lip 2024 14:15:00';

  @override
  String get randomMonthAbbr => 'Lip';

  @override
  String get randomMonthName => 'Lipiec';

  @override
  String get randomWeekdayAbbr => 'Pt';

  @override
  String get randomWeekdayName => 'Piątek';

  @override
  String get refreshText => 'Odśwież';

  @override
  String get rejectedText => 'Odrzucone';

  @override
  String get reportIssueButtonText => 'Zgłoś Problem lub Błąd';

  @override
  String get resetText => 'Resetuj';

  @override
  String get resetToDefaultText => 'Przywróć Domyślne';

  @override
  String get saveText => 'Zapisz';

  @override
  String get settingsScreenLabelText => 'Ustawienia';

  @override
  String get shareText => 'Udostępnij';

  @override
  String get simText => 'Nazwa Wyświetlana SIM';

  @override
  String get skipText => 'Pomiń';

  @override
  String get startImportText => 'Rozpocznij Import';

  @override
  String get storagePolicyLabelText => 'Polityka Przechowywania';

  @override
  String get storagePolicyText =>
      'Ta aplikacja tymczasowo przechowuje wygenerowane pliki, usuwając je przy wyjściu. Możesz pobrać dzienniki połączeń do wybranej lokalizacji. Logger uzyskuje dostęp tylko do dzienników połączeń, zapewniając Twoją prywatność.';

  @override
  String get supportedFormatInformation =>
      'Uwaga: Obecnie obsługiwany jest tylko format CSV do importowania dzienników połączeń.';

  @override
  String get timeText => 'Godzina';

  @override
  String get tokenAccordianText => 'tokeny formatowania daty i czasu';

  @override
  String get tokensInfoText =>
      'Możesz użyć podanych tokenów, aby dostosować format nazwy pliku na podstawie konkretnych preferencji daty i czasu.';

  @override
  String get unknownText => 'Nieznane';

  @override
  String get versionText => 'wersja';

  @override
  String get viewText => 'Wyświetl';

  @override
  String get wifiIncomingText => 'Wifi Przychodzące';

  @override
  String get wifiOutgoingText => 'Wifi Wychodzące';

  @override
  String get callStatsText => 'Statystyki Połączeń';

  @override
  String get callDurationText => 'Czas Trwania Połączenia';

  @override
  String get mostCalledNumberText => 'Najczęściej Wybierany Numer';

  @override
  String get callDirectionAnalysisText => 'Analiza Kierunku Połączeń';

  @override
  String get longestCallText => 'Najdłuższe Połączenie';

  @override
  String topNLongestCalls(int n) {
    return 'Top $n Najdłuższych Połączeń';
  }

  @override
  String get callText => 'Połączenie';

  @override
  String get smsText => 'SMS';

  @override
  String get nothingToDisplayText => 'Brak danych do wyświetlenia';

  @override
  String get callsMadeText => 'Wykonane Połączenia';

  @override
  String get callsReceivedText => 'Odebrane Połączenia';

  @override
  String get callsMissedText => 'Nieodebrane Połączenia';

  @override
  String get callsRejectedText => 'Odrzucone Połączenia';

  @override
  String get callsBlockedText => 'Zablokowane Połączenia';

  @override
  String get averageText => 'Średnia';

  @override
  String get longestText => 'Najdłuższe';

  @override
  String get totalText => 'Suma';

  @override
  String get todayText => 'Dzisiaj';

  @override
  String get yesterdayText => 'Wczoraj';

  @override
  String get thisMonthText => 'Ten Miesiąc';

  @override
  String get pastMonthText => 'Ubiegły Miesiąc';

  @override
  String get thisYearText => 'Ten Rok';

  @override
  String get pastYearText => 'Ubiegły Rok';

  @override
  String get allTimeText => 'Cały Czas';

  @override
  String get customText => 'Własny';

  @override
  String get startDateText => 'Data Początkowa';

  @override
  String get endDateText => 'Data Końcowa';

  @override
  String get dateRangeText => 'Zakres Dat';

  @override
  String get searchByNumberText => 'Konkretny Numer Telefonu';

  @override
  String get phoneAccountIdFilterText => 'ID Konta Telefonicznego';

  @override
  String get filterByDurationText => 'Filtruj po Czasie Trwania Połączenia';

  @override
  String get showUnknownContactsOnlyText => 'Unknown Contacts Only';

  @override
  String get filterByCallTypeText => 'Typ Połączenia';

  @override
  String get answeredExternallyText => 'Odebrane Zewnętrznie';

  @override
  String get voiceMailText => 'Poczta Głosowa';

  @override
  String get exportOpenHintText => 'Otwórz Eksport';

  @override
  String get anyText => 'Dowolne';

  @override
  String get processingFileText => 'Przetwarzanie pliku';

  @override
  String get insertingLogsText => 'Wstawianie logów';

  @override
  String get takingMoreTimeText => 'To może zająć więcej czasu';

  @override
  String get pleaseWaitText => 'Proszę czekać';

  @override
  String get importSuccessMessageText =>
      'Dzienniki połączeń zaimportowane pomyślnie';

  @override
  String get failedToUpdateSettingsText =>
      'Nie udało się zaktualizować ustawień. Spróbuj ponownie później';

  @override
  String get shareSettingUpdateSuccessMsgText =>
      'Ustawienia udostępniania zostały pomyślnie zaktualizowane.';

  @override
  String get downloadSettingUpdatedSuccessMsgText =>
      'Ustawienia pobierania zostały pomyślnie zaktualizowane.';

  @override
  String get settingUpdateSuccessMsgText =>
      'Ustawienia zostały pomyślnie zaktualizowane.';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText =>
      'Ustawienia filtra czasu trwania zostały pomyślnie zaktualizowane.';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      'Ustawienia filtra po identyfikatorze konta telefonu zostały pomyślnie zaktualizowane.';

  @override
  String get generalSettingUpdatedSuccessMsgText =>
      'Ustawienia zostały pomyślnie zaktualizowane.';

  @override
  String get importSettingUpdatedSuccessMsgText =>
      'Ustawienia importu zostały pomyślnie zaktualizowane.';

  @override
  String get exportFieldInfoText => 'Informacje o polach eksportu';

  @override
  String get csvJsonExportNameField =>
      'Nazwa powiązana z wpisem w dzienniku połączeń';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      'Identyfikator konta telefonicznego powiązany z połączeniem, który identyfikuje konkretne konto lub kartę SIM użytą do wykonania lub odebrania połączenia';

  @override
  String get csvJsonExportCallTypeField =>
      'Typ połączenia (np. przychodzące, wychodzące, nieodebrane)';

  @override
  String get csvJsonExportNumberField =>
      'Numer telefonu powiązany z wpisem w dzienniku połączeń';

  @override
  String get csvJsonExportFormattedNumberField =>
      'Sformatowany numer telefonu, sformatowany zgodnie z regułami formatowania w oparciu o kraj, w którym użytkownik przebywał podczas wykonywania lub odbierania połączenia.';

  @override
  String get csvJsonExportSimDisplayField =>
      'Nazwa wyświetlana karty SIM powiązanej z połączeniem';

  @override
  String get csvJsonExportTimestampField =>
      'Znacznik czasu (czas epoki) połączenia';

  @override
  String get csvJsonExportDurationField =>
      'Czas trwania połączenia w sekundach';

  @override
  String get csvJsonExportCachedNumberLabelField =>
      'Etykieta powiązana z numerem telefonu w pamięci podręcznej';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      'Typ numeru w pamięci podręcznej (Dom, Praca itp.) powiązany z numerem telefonu, jeśli istnieje.';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      'Zapisany lub zapisany w pamięci podręcznej numer telefonu powiązany z wpisem dziennika połączeń w celu szybkiego odniesienia.';

  @override
  String get exportFieldInfoHintText => 'Informacje o Polach Eksportu';

  @override
  String get naText => 'nie dotyczy';

  @override
  String get confirmDownloadText => 'Potwierdź pobieranie';

  @override
  String get mostReceivedNumberText => 'Najczęściej odebrany numer';

  @override
  String get confirmContactsSyncLabelText =>
      'Potwierdź synchronizację kontaktów';

  @override
  String get confirmContactsSyncConfirmationText =>
      'Ten proces zeskanuje Twoje dzienniki połączeń i zaktualizuje brakujące nazwy kontaktów, dopasowując je do zapisanych kontaktów. Nie zmieni żadnych innych szczegółów w historii połączeń.';

  @override
  String get contactsSyncSuccessMessageText =>
      'Kontakty pomyślnie zsynchronizowane z dziennikami połączeń';

  @override
  String get contactsSyncErrorMessageText => 'Błąd synchronizacji kontaktów!';

  @override
  String get contactsPermissionDenied => 'Odmówiono dostępu do kontaktów!';

  @override
  String get syncContactsLabelText =>
      'Synchronizuj kontakty z dziennikami połączeń';

  @override
  String get syncContactsCTAText => 'Synchronizuj teraz';

  @override
  String get softwareInformationText => 'Informacje o oprogramowaniu';

  @override
  String get addToContactsText => 'Dodaj do kontaktów';

  @override
  String get addToContactsErrorText => 'Nie można dodać nowego kontaktu';

  @override
  String get appPermissionsDeniedError =>
      'Ups! Wygląda na to, że odmówiono dostępu do dzienników połączeń. Aby Logger działał poprawnie, udziel zgody.';

  @override
  String get appFatalError => 'Ups! Wystąpił nieoczekiwany błąd!';

  @override
  String get appPreferencesError => 'Ups! Błąd podczas ładowania preferencji.';

  @override
  String get uriPermissionError => 'Nie można uzyskać uprawnień';

  @override
  String get fileGenerationError =>
      'Wystąpił błąd podczas generowania pliku. Spróbuj ponownie później';

  @override
  String get fileShareMessage =>
      'Udostępnij plik dziennika połączeń przez Gmail, WhatsApp itp...';

  @override
  String get fileShareSubject => 'Dzienniki połączeń';

  @override
  String get fileOpenError =>
      'Nie można otworzyć pliku, spróbuj ponownie później';

  @override
  String get openingFileLabel => 'Otwieranie pliku';

  @override
  String get viewContactLabel => 'Zobacz kontakt';

  @override
  String get errorOpeningContact => 'Błąd podczas otwierania kontaktu';

  @override
  String get waLaunchError => 'Nie można uruchomić WhatsApp';

  @override
  String get closeText => 'Zamknij';

  @override
  String get defaultPresetName => 'Domyślny preset';

  @override
  String get onLabel => 'Włączone';

  @override
  String get offLabel => 'Wyłączone';

  @override
  String get filterPresetTitle => 'Presety filtrów';

  @override
  String get addMorePresetsLabel => 'Dodaj preset';

  @override
  String get deleteAllPresetsLabel => 'usuń wszystko';

  @override
  String get enablePresetsPlaceholderText =>
      'Włącz presety, aby łatwo tworzyć i przełączać się między wieloma filtrami dla szybkiej personalizacji dziennika połączeń.';

  @override
  String get noPresetsPlaceholderText =>
      'Zacznij tworzyć własne presety dla szybkiego filtrowania';

  @override
  String get presetNameInputLabelText => 'Nazwa presetu';

  @override
  String get presetNameInputHintText => 'Wpisz nazwę dla presetu';

  @override
  String get defaultLabelText => 'Domyślny';

  @override
  String get lastCallText => 'Ostatnie połączenie';

  @override
  String get groupByContactAndTypeTitle => 'Grupuj według kontaktu i rodzaju';

  @override
  String get groupByContactAndTypeDescription =>
      'Połączenia są grupowane według kontaktu i rodzaju połączenia';

  @override
  String get groupByContactOnlyConsecutiveTitle =>
      'Grupuj według kolejnych kontaktów';

  @override
  String get groupByContactOnlyConsecutiveDescription =>
      'Łączy kolejne połączenia od tego samego kontaktu w jedną grupę';

  @override
  String get groupByContactOnlyTitle => 'Grupuj według kontaktu';

  @override
  String get groupByContactOnlyDescription =>
      'Grupuje wszystkie połączenia od tego samego kontaktu';

  @override
  String get groupByNoneDescription =>
      'Brak grupowania — każde połączenie wyświetlane jest osobno';

  @override
  String get callGroupingText => 'Grupowanie połączeń';

  @override
  String get useGroupingSwitchText => 'Użyj grupowania z filtrami';

  @override
  String get clearFiltersTooltip => 'Wyczyść filtry';

  @override
  String get scrollToTopTooltip => 'Przewiń na górę';

  @override
  String get watchListText => 'Lista obserwowanych';

  @override
  String get roundDurationText => 'Zaokrąglaj czas rozmów do minut';

  @override
  String get roundDurationTextSubtitle =>
      'Zaokrąglaj rozmowy do najbliższej minuty do celów rozliczeniowych';

  @override
  String get groupedCallSettingSubtitle =>
      'Wybierz sposób grupowania rozmów dla łatwiejszego śledzenia i przeglądu';

  @override
  String get filterPresetsSettingSubtitle =>
      'Twórz, zapisuj i używaj filtrów, aby łatwo znaleźć rozmowy';

  @override
  String get exportFilenameSettingSubtitle =>
      'Dostosuj nazwy eksportowanych plików';

  @override
  String get exportFormatSettingSubtitle =>
      'Wybierz format eksportowanych rejestrów połączeń';

  @override
  String get importCallLogsSettingSubtitle =>
      'Importuj historię połączeń z innych źródeł lub kopii zapasowych';

  @override
  String get appDetailsText => 'Informacje o aplikacji i szczegóły';

  @override
  String get appDetailsSubText => 'Wersja • Darowizna • Zgłoś błąd';

  @override
  String get enableDownloadConfirmationText => 'Potwierdź pobranie';

  @override
  String get enableDownloadConfirmationSubText =>
      'Poproś o potwierdzenie przed pobraniem plików';

  @override
  String get enableCallDurationFilteringText =>
      'Filtrowanie według czasu trwania';

  @override
  String get enableCallDurationFilteringSubText =>
      'Filtruj połączenia według ich długości';

  @override
  String get enableCallLogCountVisibilityText => 'Liczba połączeń';

  @override
  String get enableCallLogCountVisibilitySubText =>
      'Wyświetl liczbę połączeń dla każdego dnia';

  @override
  String get enableFilterByAccountIdText => 'Filtruj według ID konta';

  @override
  String get enableFilterByAccountIdSubText =>
      'Pokaż połączenia dla konkretnej karty SIM lub konta';

  @override
  String get showTotalCallDurationText => 'Łączny czas połączeń';

  @override
  String get showTotalCallDurationSubText =>
      'Pokaż całkowity czas spędzony na rozmowach';

  @override
  String get disableLogsSharingText => 'Ukryj przycisk udostępniania';

  @override
  String get disableLogsSharingSubText =>
      'Ukryj przycisk udostępniania w historii połączeń';

  @override
  String get trackListLabelText => 'Lista śledzenia';

  @override
  String get tracklistPlaceholderText =>
      'Zarządzaj śledzonymi kontaktami efektywnie. Stuknij + (w prawym górnym rogu), aby dodać kontakt, przesuń w lewo element listy i stuknij Usuń, aby przestać śledzić.';

  @override
  String get removeAllText => 'usuń wszystko';

  @override
  String get trackContactLabelText => 'Nazwa kontaktu';

  @override
  String get trackContactText => 'Śledź kontakt';

  @override
  String get removeText => 'Usuń';

  @override
  String get iteractionScoreText => 'Wskaźnik interakcji';

  @override
  String get lastCallSinceText => 'Ostatnie połączenie od';

  @override
  String get avgCallsMonthText => 'Średnia liczba połączeń / miesiąc';

  @override
  String get avgCallDurationText => 'Średni czas połączenia';

  @override
  String get peakCallDurationText => 'Najdłuższe połączenie';

  @override
  String get callsPerWeekText => 'Średnia liczba połączeń / tydzień';

  @override
  String get callDistByWeekDay => 'Rozkład połączeń według dnia tygodnia (%)';

  @override
  String addToTrackList(Object maxItems) {
    return 'Dodaj do $maxItems kontaktów do swojej listy śledzenia, aby łatwo śledzić.';
  }

  @override
  String get addText => 'Dodaj';

  @override
  String get numberAlreadyAddedErrorText => 'Kontakt już dodany';

  @override
  String get invalidNumberErrorText => 'Nieprawidłowy numer telefonu';

  @override
  String get emptyPhoneNumberErrorText => 'Wprowadź nazwę kontaktu';

  @override
  String get trackNumberErrorText =>
      'Wystąpił błąd podczas dodawania nowego kontaktu do śledzenia';

  @override
  String get quickFilterText => 'Szybki filtr';
}
