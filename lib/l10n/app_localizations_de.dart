// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get aboutText => 'Über';

  @override
  String get advancedSettingsLabelText => 'Erweiterte Einstellungen';

  @override
  String get analyticsPolicyLabelText => 'Statistik-Richtlinie';

  @override
  String get analyticsPolicyText =>
      'Alle Anrufprotokolldaten werden lokal auf Ihrem Gerät analysiert und niemals an Online-Server übertragen, um Ihre Privatsphäre zu schützen und Ihre Informationen sicher und vertraulich zu halten.';

  @override
  String get analyticsScreenLabelText => 'Statistiken';

  @override
  String get appError => 'Ach, Mist! Etwas ist schief gelaufen';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => 'Filter anwenden';

  @override
  String get baseGhostErrorMessage => 'Etwas ist schief gelaufen';

  @override
  String get baseSettingsLabelText => 'Allgemeine Einstellungen';

  @override
  String get blockedText => 'Blockiert';

  @override
  String get callLogsExportFailureText =>
      'Fehler beim Herunterladen der Datei!';

  @override
  String get callLogsExportFormatLabelText =>
      'Exportformat für Anrufprotokolle';

  @override
  String get callLogsExportSuccessText =>
      'Anrufprotokolle erfolgreich extrahiert und heruntergeladen';

  @override
  String get callTypeText => 'Art des Anrufs';

  @override
  String get cancelText => 'Abbrechen';

  @override
  String get configureText => 'Konfigurieren';

  @override
  String get confirmImportLabelText => 'Importstart bestätigen';

  @override
  String get confirmImportText =>
      'Das Importieren von Anrufprotokollen ist eine umfangreiche Aufgabe, die Ihre aktuellen Protokolle unwiderruflich beschädigen, Daten überschreiben und Inkonsistenzen in Ihrem Verlauf verursachen kann. Bitte beachten Sie, dass dieser Vorgang einige Zeit in Anspruch nehmen kann und zu den oben genannten Problemen führen kann. Gehen Sie mit Vorsicht vor.';

  @override
  String get continueText => 'Weiter';

  @override
  String get dateText => 'Datum';

  @override
  String get donateText => 'Spenden';

  @override
  String downloadConfirmationText(String currentImportType) {
    return 'Sind Sie sicher, dass Sie Ihre Anrufprotokolle im Format $currentImportType herunterladen möchten? Mit dieser Aktion wird Ihr Anrufprotokoll in einer Datei $currentImportType auf Ihrem Gerät gespeichert.';
  }

  @override
  String get downloadText => 'Downloaden';

  @override
  String get dtAAcronymExapandedText => 'Vollständiger Name des Wochentags';

  @override
  String get dtBAcronymExapandedText => 'Vollständiger Name des Monats';

  @override
  String get dtHAcronymExapandedText => 'Uhrzeit im 24-Stunden-Format';

  @override
  String get dtIAcronymExapandedText => 'Uhrzeit im 12-Stunden-Format';

  @override
  String get dtMAcronymExapandedText => 'Minuten';

  @override
  String get dtSAcronymExapandedText => 'Sekunden';

  @override
  String get dtUAcronymExapandedText =>
      'Wochennummer des Jahres (Sonntag als erster Tag der Woche)';

  @override
  String get dtWAcronymExapandedText =>
      'Wochennummer des Jahres (Montag als erster Tag der Woche)';

  @override
  String get dtXAcronymExapandedText => 'Zeitliche Darstellung';

  @override
  String get dtYAcronymExapandedText => 'Jahr mit Jahrhundert';

  @override
  String get dtZAcronymExapandedText => 'Name der Zeitzone';

  @override
  String get dtaAcronymExapandedText => 'Abgekürzter Name des Wochentags';

  @override
  String get dtbAcronymExapandedText => 'Abgekürzter Monatsname';

  @override
  String get dtcAcronymExapandedText => 'Darstellung von Datum und Uhrzeit';

  @override
  String get dtdAcronymExapandedText => 'Tag des Monats';

  @override
  String get dtfAcronymExapandedText => 'Millisekunden';

  @override
  String get dtjAcronymExapandedText => 'Tag des Jahres';

  @override
  String get dtmAcronymExapandedText => 'Monat als Nummerr';

  @override
  String get dtpAcronymExapandedText => 'AM/PM-Markierung';

  @override
  String get dtxAcronymExapandedText => 'Darstellung des Datums';

  @override
  String get dtyAcronymExapandedText => 'Jahr ohne Jahrhundert';

  @override
  String get dtzAcronymExapandedText => 'Zeitzonenabweichung von UTC';

  @override
  String get durationText => 'Dauer';

  @override
  String get exploreNowText => 'Jetzt erkunden';

  @override
  String get exploreProjectButtonText => 'Projekt auf Github erkunden';

  @override
  String get exportFileNameFormatLabelText => 'Dateinamenformat exportieren';

  @override
  String get filenameFormatHintText => 'mein-anruf-protokoll-[%token]';

  @override
  String get filenameFormatLabelText => 'Dateinamen-Format';

  @override
  String get filterText => 'Filter';

  @override
  String get getStartedText => 'Los geht\'s';

  @override
  String get ghostErrorMessage => 'Hmm. Etwas ist schief gelaufen';

  @override
  String get hideText => 'Ausblenden';

  @override
  String get hintMobileNumberText => '9XXXX XXXX';

  @override
  String get importCallLogsText => 'Importieren Sie Ihre Anrufprotokolle';

  @override
  String get incomingText => 'Eingehende';

  @override
  String get logsScreenLabelText => 'Protokolle';

  @override
  String get maximumDurationHintText => 'bsp: 60';

  @override
  String get maximumDurationLabelText => 'Max (in secs)';

  @override
  String get minimumDurationHintText => 'bsp: 0';

  @override
  String get minimumDurationLabelText => 'Min (in secs)';

  @override
  String get missedText => 'Verpasst';

  @override
  String get mobileNumberText => 'Handynummer';

  @override
  String get nextText => 'Weiter';

  @override
  String get onboardingScreenFourSubtitle =>
      'Übertragen Sie Anrufprotokolle nahtlos zwischen Geräten oder exportieren Sie sie zur sicheren Aufbewahrung und Analyse.';

  @override
  String get onboardingScreenFourTitle => 'Importieren und Exportieren';

  @override
  String get onboardingScreenOneSubtitle =>
      'Die ideale Anwendung für die mühelose Verwaltung und Analyse Ihrer Anrufprotokolle.';

  @override
  String get onboardingScreenOneTitle => 'Wilkommen zu Logger!';

  @override
  String get onboardingScreenThreeSubtitle =>
      'Verstehen Sie Ihre Anrufmuster wie nie zuvor und erhalten Sie detaillierte Einblicke, um Ihre Zeit zu optimieren.';

  @override
  String get onboardingScreenThreeTitle => 'Analysieren Sie Ihre Anrufe';

  @override
  String get onboardingScreenTwoSubtitle =>
      'Suchen, filtern und verwalten Sie Ihre Anrufprotokolle über eine nahtlose und intuitive Oberfläche.';

  @override
  String get onboardingScreenTwoTitle => 'Anrufprotokolle verwalten';

  @override
  String get openText => 'Öffnen';

  @override
  String get outgoingText => 'Ausgehend';

  @override
  String get phoneAccountIdText => 'Telefonkonto-ID';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => 'Platform';

  @override
  String get randomDTRepr => 'Fri, Jul 12 2024 14:15:00';

  @override
  String get randomMonthAbbr => 'Jul';

  @override
  String get randomMonthName => 'Juli';

  @override
  String get randomWeekdayAbbr => 'Fr';

  @override
  String get randomWeekdayName => 'Freitag';

  @override
  String get refreshText => 'Aktualisieren';

  @override
  String get rejectedText => 'Abgelehnt';

  @override
  String get reportIssueButtonText => 'Ein Problem oder einen Fehler melden';

  @override
  String get resetText => 'zurücksetzen';

  @override
  String get resetToDefaultText => 'Auf Standard zurücksetzen';

  @override
  String get saveText => 'Speichern';

  @override
  String get settingsScreenLabelText => 'Einstellungen';

  @override
  String get shareText => 'Teilen';

  @override
  String get simText => 'SIM-Anzeigename';

  @override
  String get skipText => 'Überspringen';

  @override
  String get startImportText => 'Import starten';

  @override
  String get storagePolicyLabelText => 'Speicher-Richtlinien';

  @override
  String get storagePolicyText =>
      'Diese App speichert die erzeugten Dateien vorübergehend und löscht sie beim Beenden. Sie können Anrufprotokolle an den von Ihnen gewählten Ort herunterladen. Logger greift nur auf Anrufprotokolle zu, um Ihre Privatsphäre zu schützen.';

  @override
  String get supportedFormatInformation =>
      'Bitte beachten Sie: Derzeit wird nur das CSV-Format für den Import von Anrufprotokollen unterstützt.';

  @override
  String get timeText => 'Zeit';

  @override
  String get tokenAccordianText => 'Datum- und Zeitformatierungstoken';

  @override
  String get tokensInfoText =>
      'Sie können die bereitgestellten Token verwenden, um Ihr Dateinamenformat auf der Grundlage bestimmter Datums- und Zeitpräferenzen anzupassen.';

  @override
  String get unknownText => 'Unbekannt';

  @override
  String get versionText => 'version';

  @override
  String get viewText => 'Siehe';

  @override
  String get wifiIncomingText => 'Wifi Eingehend';

  @override
  String get wifiOutgoingText => 'Wifi ausgehend';

  @override
  String get callStatsText => 'Anruf Statistiken';

  @override
  String get callDurationText => 'Anrufdauer';

  @override
  String get mostCalledNumberText => 'Meistgewählte Nummer';

  @override
  String get callDirectionAnalysisText => 'Analyse der Anrufrichtung';

  @override
  String get longestCallText => 'Längster Anruf';

  @override
  String topNLongestCalls(int n) {
    return 'Top $n Längste Anrufe';
  }

  @override
  String get callText => 'Anruf';

  @override
  String get smsText => 'SMS';

  @override
  String get nothingToDisplayText => 'Nichts anzuzeigen';

  @override
  String get callsMadeText => 'Getätigte Anrufe';

  @override
  String get callsReceivedText => 'Empfangene Anrufe';

  @override
  String get callsMissedText => 'Verpasste Anrufe';

  @override
  String get callsRejectedText => 'Abgelehnte Anrufe';

  @override
  String get callsBlockedText => 'Blockierte Anrufe';

  @override
  String get averageText => 'Durchschnitt';

  @override
  String get longestText => 'Längster';

  @override
  String get totalText => 'Insgesamt';

  @override
  String get todayText => 'Heute';

  @override
  String get yesterdayText => 'Gestern';

  @override
  String get thisMonthText => 'Dieser Monat';

  @override
  String get pastMonthText => 'letzer Monat';

  @override
  String get thisYearText => 'Dieses Jahr';

  @override
  String get pastYearText => 'Letzes Jahr';

  @override
  String get allTimeText => 'Gesamt';

  @override
  String get customText => 'Benutzerdefiniert';

  @override
  String get startDateText => 'Startdatum';

  @override
  String get endDateText => 'Enddatum';

  @override
  String get dateRangeText => 'Zeitspanne';

  @override
  String get searchByNumberText => 'Spezifische Telefonnummer';

  @override
  String get phoneAccountIdFilterText => 'Telefon Kontonummer';

  @override
  String get filterByDurationText => 'Nach Anrufdauer filtern';

  @override
  String get filterByCallTypeText => 'Art des Anrufs';

  @override
  String get answeredExternallyText => 'Extern beantwortet';

  @override
  String get voiceMailText => 'Mailbox';

  @override
  String get exportOpenHintText => 'Exportieren Öffnen';

  @override
  String get anyText => 'Beliebig';

  @override
  String get processingFileText => 'Datei wird verarbeitet';

  @override
  String get insertingLogsText => 'Protokolle einfügen';

  @override
  String get takingMoreTimeText => 'Dies kann länger dauern';

  @override
  String get pleaseWaitText => 'Bitte Warten';

  @override
  String get importSuccessMessageText =>
      'Anrufprotokolle erfolgreich importiert';

  @override
  String get failedToUpdateSettingsText =>
      'Die Einstellungen konnten nicht aktualisiert werden. Bitte versuchen Sie es später erneut';

  @override
  String get shareSettingUpdateSuccessMsgText =>
      'Freigabeeinstellungen erfolgreich aktualisiert.';

  @override
  String get downloadSettingUpdatedSuccessMsgText =>
      'Downloadeinstellungen erfolgreich aktualisiert.';

  @override
  String get settingUpdateSuccessMsgText =>
      'Die Einstellung wurde erfolgreich aktualisiert.';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText =>
      'Dauerfiltereinstellungen erfolgreich aktualisiert.';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      'Die Einstellungen für die Filterung nach Telefonkontonummern wurden erfolgreich aktualisiert.';

  @override
  String get generalSettingUpdatedSuccessMsgText =>
      'Einstellungen erfolgreich aktualisiert.';

  @override
  String get importSettingUpdatedSuccessMsgText =>
      'Importiereinstellungen erfolgreich aktualisiert';

  @override
  String get exportFieldInfoText => 'Informationen zu Exportfeldern';

  @override
  String get csvJsonExportNameField =>
      'Mit dem Anrufprotokolleintrag verbundener Name';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      'Die Telefonkonto-ID, das mit dem Anruf verbunden ist, identifiziert das spezifische Konto oder die SIM-Karte, die zum Tätigen oder Entgegennehmen des Anrufs verwendet wurde.';

  @override
  String get csvJsonExportCallTypeField =>
      'Art des Anrufs (z. B. eingehend, ausgehend, verpasst)';

  @override
  String get csvJsonExportNumberField =>
      'Mit dem Anrufprotokolleintrag verbundene Rufnummer';

  @override
  String get csvJsonExportFormattedNumberField =>
      'Formatierte Telefonnummer, formatiert mit Formatierungsregeln auf der Grundlage des Landes, in dem sich der Benutzer befand, als der Anruf getätigt oder entgegengenommen wurde.';

  @override
  String get csvJsonExportSimDisplayField =>
      'Anzeige des Namens der mit dem Anruf verbundenen SIM-Karte';

  @override
  String get csvJsonExportTimestampField =>
      'Zeitstempel (Epochenzeit) des Anrufs';

  @override
  String get csvJsonExportDurationField => 'Dauer des Anrufs in Sekunden';

  @override
  String get csvJsonExportCachedNumberLabelField =>
      'Mit der zwischengespeicherten Rufnummer verbundenes Label';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      'Die Art der zwischengespeicherten Nummer (Privat, Arbeit usw.), die mit der Telefonnummer verknüpft ist, falls vorhanden.';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      'Gespeicherte oder zwischengespeicherte Telefonnummer, die mit einem Anrufprotokolleintrag verbunden ist, um einen schnellen Zugriff zu ermöglichen.';

  @override
  String get exportFieldInfoHintText => 'Informationen zu Exportfeldern';

  @override
  String get naText => 'k.A.';

  @override
  String get confirmDownloadText => 'Download bevestigen';

  @override
  String get mostReceivedNumberText => 'Am meisten empfangene Nummer';

  @override
  String get confirmContactsSyncLabelText =>
      'Bestätigen Sie die Synchronisierung der Kontakte';

  @override
  String get confirmContactsSyncConfirmationText =>
      'Dieser Prozess scannt Ihre Anrufprotokolle und aktualisiert fehlende Kontaktnamen, indem er sie mit Ihren gespeicherten Kontakten abgleicht. Es wird keine anderen Details in Ihrem Anrufverlauf ändern.';

  @override
  String get contactsSyncSuccessMessageText =>
      'Kontakte erfolgreich mit den Anrufprotokollen synchronisiert';

  @override
  String get contactsSyncErrorMessageText =>
      'Fehler bei der Synchronisierung der Kontakte!';

  @override
  String get contactsPermissionDenied =>
      'Zugriffsberechtigung für Kontakte verweigert!';

  @override
  String get syncContactsLabelText => 'Anrufprotokollkontakte synchronisieren';

  @override
  String get syncContactsCTAText => 'Jetzt synchronisieren';

  @override
  String get softwareInformationText => 'Software-Informationen';

  @override
  String get addToContactsText => 'Zu Kontakten hinzufügen';

  @override
  String get addToContactsErrorText =>
      'Neuen Kontakt konnte nicht hinzugefügt werden';

  @override
  String get appPermissionsDeniedError =>
      'Oh nein! Es scheint, als ob der Zugriff auf die Anrufprotokolle verweigert wurde. Bitte erteile die Berechtigung, damit Logger reibungslos funktioniert.';

  @override
  String get appFatalError => 'Oh je! Etwas Unerwartetes ist passiert!';

  @override
  String get appPreferencesError =>
      'Oh je! Fehler beim Laden der Einstellungen.';

  @override
  String get uriPermissionError =>
      'Berechtigungen konnten nicht erhalten werden';

  @override
  String get fileGenerationError =>
      'Beim Erstellen der Datei ist ein Fehler aufgetreten. Bitte versuchen Sie es später erneut';

  @override
  String get fileShareMessage =>
      'Teilen Sie die Anrufprotokolldatei über Gmail, WhatsApp usw...';

  @override
  String get fileShareSubject => 'Anrufprotokolle';

  @override
  String get fileOpenError =>
      'Datei konnte nicht geöffnet werden, bitte versuchen Sie es später erneut';

  @override
  String get openingFileLabel => 'Datei wird geöffnet';

  @override
  String get viewContactLabel => 'Kontakt anzeigen';

  @override
  String get errorOpeningContact => 'Fehler beim Öffnen des Kontakts';

  @override
  String get waLaunchError => 'WhatsApp konnte nicht gestartet werden';

  @override
  String get closeText => 'Schließen';

  @override
  String get defaultPresetName => 'Standardvoreinstellung';

  @override
  String get onLabel => 'Ein';

  @override
  String get offLabel => 'Aus';

  @override
  String get filterPresetTitle => 'Filtervoreinstellungen';

  @override
  String get addMorePresetsLabel => 'mehr hinzufügen';

  @override
  String get deleteAllPresetsLabel => 'Voreinstellung hinzufügen';

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
  String get defaultLabelText => 'Standard';

  @override
  String get lastCallText => 'Letzter Anruf';

  @override
  String get groupByContactAndTypeTitle => 'Nach Kontakt und Typ gruppieren';

  @override
  String get groupByContactAndTypeDescription =>
      'Anrufe werden nach Kontakt und Anrufart gruppiert';

  @override
  String get groupByContactOnlyConsecutiveTitle =>
      'Nach aufeinanderfolgenden Kontakten gruppieren';

  @override
  String get groupByContactOnlyConsecutiveDescription =>
      'Fasst aufeinanderfolgende Anrufe desselben Kontakts zu einer Gruppe zusammen';

  @override
  String get groupByContactOnlyTitle => 'Nach Kontakt gruppieren';

  @override
  String get groupByContactOnlyDescription =>
      'Fasst alle Anrufe desselben Kontakts zusammen';

  @override
  String get groupByNoneDescription =>
      'Keine Gruppierung – jeder Anruf wird einzeln angezeigt';

  @override
  String get callGroupingText => 'Anrufgruppierung';

  @override
  String get useGroupingSwitchText => 'Gruppierung mit Filtern verwenden';

  @override
  String get clearFiltersTooltip => 'Filter zurücksetzen';

  @override
  String get scrollToTopTooltip => 'Nach oben scrollen';

  @override
  String get watchListText => 'Beobachtungsliste';

  @override
  String get roundDurationText => 'Dauer auf Minuten runden';

  @override
  String get roundDurationTextSubtitle =>
      'Runden Sie Anrufe auf die nächste volle Minute für die Abrechnung';

  @override
  String get groupedCallSettingSubtitle =>
      'Wählen Sie, wie Anrufe gruppiert werden sollen, um eine einfachere Nachverfolgung und Übersicht zu ermöglichen';

  @override
  String get filterPresetsSettingSubtitle =>
      'Erstellen, speichern und wiederverwenden Sie Filter, um Anrufe einfach zu finden';

  @override
  String get exportFilenameSettingSubtitle =>
      'Passen Sie an, wie Ihre exportierten Dateien benannt werden';

  @override
  String get exportFormatSettingSubtitle =>
      'Wählen Sie das Format für exportierte Anrufprotokolle';

  @override
  String get importCallLogsSettingSubtitle =>
      'Anrufverlauf aus anderen Quellen oder Sicherungen importieren';

  @override
  String get appDetailsText => 'App-Informationen & Details';

  @override
  String get appDetailsSubText => 'Version • Spenden • Fehlerbericht';

  @override
  String get enableDownloadConfirmationText => 'Download bestätigen';

  @override
  String get enableDownloadConfirmationSubText =>
      'Vor dem Herunterladen eine Bestätigung anfordern';

  @override
  String get enableCallDurationFilteringText => 'Dauerfilter';

  @override
  String get enableCallDurationFilteringSubText => 'Anrufe nach Dauer filtern';

  @override
  String get enableCallLogCountVisibilityText => 'Anrufprotokoll-Anzahl';

  @override
  String get enableCallLogCountVisibilitySubText =>
      'Anzahl der Anrufe pro Tag anzeigen';

  @override
  String get enableFilterByAccountIdText => 'Nach Account-ID filtern';

  @override
  String get enableFilterByAccountIdSubText =>
      'Anrufe für eine bestimmte SIM oder ein Konto anzeigen';

  @override
  String get showTotalCallDurationText => 'Gesamtdauer der Anrufe';

  @override
  String get showTotalCallDurationSubText => 'Gesamte Gesprächszeit anzeigen';

  @override
  String get disableLogsSharingText => 'Teilen-Button ausblenden';

  @override
  String get disableLogsSharingSubText =>
      'Den Teilen-Button in den Anrufprotokollen verbergen';

  @override
  String get trackListLabelText => 'Trackliste';

  @override
  String get tracklistPlaceholderText =>
      'Verwalten Sie Ihre Trackliste effizient. Tippen Sie auf + (oben rechts), um eine Nummer hinzuzufügen, wischen Sie nach links auf einem Listeneintrag und tippen Sie auf Entfernen, um die Verfolgung zu stoppen.';

  @override
  String get removeAllText => 'alle entfernen';

  @override
  String get trackContactLabelText => 'Telefonnummer';

  @override
  String get trackContactText => 'Kontakt verfolgen';

  @override
  String get removeText => 'Entfernen';

  @override
  String get iteractionScoreText => 'Interaktionspunktzahl';

  @override
  String get lastCallSinceText => 'Letzter Anruf seit';

  @override
  String get avgCallsMonthText => 'Durchschnittliche Anrufe / Monat';

  @override
  String get avgCallDurationText => 'Durchschnittliche Anrufdauer';

  @override
  String get peakCallDurationText => 'Höchste Anrufdauer';

  @override
  String get callsPerWeekText => 'Durchschnittliche Anrufe / Woche';

  @override
  String get callDistByWeekDay => 'Anrufverteilung nach Wochentagen (%)';

  @override
  String addToTrackList(Object maxItems) {
    return 'Fügen Sie bis zu $maxItems Kontakte zu Ihrer Trackliste für einfaches Tracking hinzu.';
  }

  @override
  String get addText => 'Hinzufügen';

  @override
  String get numberAlreadyAddedErrorText => 'Nummer bereits hinzugefügt';

  @override
  String get invalidNumberErrorText => 'Ungültige Telefonnummer';

  @override
  String get emptyPhoneNumberErrorText => 'Geben Sie eine Telefonnummer ein';

  @override
  String get trackNumberErrorText =>
      'Beim Hinzufügen des neuen Track-Kontakts ist ein Fehler aufgetreten';

  @override
  String get quickFilterText => 'Schnellfilter';
}
