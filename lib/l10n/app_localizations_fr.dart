// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get aboutText => 'À propos';

  @override
  String get advancedSettingsLabelText => 'Paramètres avancés';

  @override
  String get analyticsPolicyLabelText => 'Politique d\'analyse';

  @override
  String get analyticsPolicyText =>
      'Toutes les données du journal d\'appels sont analysées localement sur votre appareil et ne sont jamais transmises à des serveurs en ligne, garantissant ainsi votre confidentialité et la sécurité de vos informations.';

  @override
  String get analyticsScreenLabelText => 'Analytique';

  @override
  String get appError => 'Zut ! Une erreur s\'est produite';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => 'Appliquer les filtres';

  @override
  String get baseGhostErrorMessage => 'Une erreur s\'est produite';

  @override
  String get baseSettingsLabelText => 'Paramètres généraux';

  @override
  String get blockedText => 'Bloqué';

  @override
  String get callLogsExportFailureText =>
      'Erreur lors du téléchargement du fichier !';

  @override
  String get callLogsExportFormatLabelText =>
      'Format d\'exportation des journaux d\'appels';

  @override
  String get callLogsExportSuccessText =>
      'Journaux d\'appels extraits et téléchargés avec succès';

  @override
  String get callTypeText => 'Type d\'appel';

  @override
  String get cancelText => 'Annuler';

  @override
  String get configureText => 'Configurer';

  @override
  String get confirmImportLabelText => 'Confirmer le début de l\'importation';

  @override
  String get confirmImportText =>
      'L\'importation des journaux d\'appels est une tâche importante qui peut corrompre de manière irréversible vos journaux actuels, écraser des données et entraîner des incohérences dans votre historique. Veuillez noter que ce processus peut prendre un certain temps et pourrait entraîner les problèmes mentionnés ci-dessus. Procéder avec prudence.';

  @override
  String get continueText => 'Continuer';

  @override
  String get dateText => 'Date';

  @override
  String get donateText => 'Faire un don';

  @override
  String downloadConfirmationText(String currentImportType) {
    return 'Êtes-vous sûr de vouloir télécharger vos journaux d\'appels au format $currentImportType ? Cette action enregistrera votre historique d\'appels dans un fichier $currentImportType sur votre appareil.';
  }

  @override
  String get downloadText => 'Télécharger';

  @override
  String get dtAAcronymExapandedText => 'Nom complet du jour de la semaine';

  @override
  String get dtBAcronymExapandedText => 'Nom complet du mois';

  @override
  String get dtHAcronymExapandedText => 'Heure au format 24 heures';

  @override
  String get dtIAcronymExapandedText => 'Heure au format 12 heures';

  @override
  String get dtMAcronymExapandedText => 'Minutes';

  @override
  String get dtSAcronymExapandedText => 'Secondes';

  @override
  String get dtUAcronymExapandedText =>
      'Numéro de la semaine de l\'année (dimanche comme premier jour de la semaine)';

  @override
  String get dtWAcronymExapandedText =>
      'Numéro de la semaine de l\'année (lundi comme premier jour de la semaine)';

  @override
  String get dtXAcronymExapandedText => 'Représentation de l\'heure';

  @override
  String get dtYAcronymExapandedText => 'Année avec le siècle';

  @override
  String get dtZAcronymExapandedText => 'Nom du fuseau horaire';

  @override
  String get dtaAcronymExapandedText => 'Nom abrégé du jour de la semaine';

  @override
  String get dtbAcronymExapandedText => 'Nom abrégé du mois';

  @override
  String get dtcAcronymExapandedText =>
      'Représentation de la date et de l\'heure';

  @override
  String get dtdAcronymExapandedText => 'Jour du mois';

  @override
  String get dtfAcronymExapandedText => 'Millisecondes';

  @override
  String get dtjAcronymExapandedText => 'Jour de l\'année';

  @override
  String get dtmAcronymExapandedText => 'Mois sous forme de nombre';

  @override
  String get dtpAcronymExapandedText => 'Marqueur AM/PM';

  @override
  String get dtxAcronymExapandedText => 'Représentation de la date';

  @override
  String get dtyAcronymExapandedText => 'Année sans le siècle';

  @override
  String get dtzAcronymExapandedText =>
      'Décalage du fuseau horaire par rapport à UTC';

  @override
  String get durationText => 'Durée';

  @override
  String get exploreNowText => 'Explorer maintenant';

  @override
  String get exploreProjectButtonText => 'Explorer le projet sur Github';

  @override
  String get exportFileNameFormatLabelText =>
      'Format du nom de fichier d\'exportation';

  @override
  String get filenameFormatHintText => 'mes-journaux-appel-[%jeton]';

  @override
  String get filenameFormatLabelText => 'Format du nom de fichier';

  @override
  String get filterText => 'Filtrer';

  @override
  String get getStartedText => 'Commencer';

  @override
  String get ghostErrorMessage => 'Hmm. Une erreur s\'est produite';

  @override
  String get hideText => 'Masquer';

  @override
  String get hintMobileNumberText => '9XXXX XXXX';

  @override
  String get importCallLogsText => 'Importer vos journaux d\'appels';

  @override
  String get incomingText => 'Entrant';

  @override
  String get logsScreenLabelText => 'Journaux';

  @override
  String get maximumDurationHintText => 'ex : 60';

  @override
  String get maximumDurationLabelText => 'Max (en secondes)';

  @override
  String get minimumDurationHintText => 'ex : 0';

  @override
  String get minimumDurationLabelText => 'Min (en secondes)';

  @override
  String get missedText => 'Manqué';

  @override
  String get mobileNumberText => 'Numéro de mobile';

  @override
  String get nextText => 'Suivant';

  @override
  String get onboardingScreenFourSubtitle =>
      'Transférez facilement les journaux d\'appels entre les appareils ou exportez-les pour les conserver et les analyser.';

  @override
  String get onboardingScreenFourTitle => 'Importer et exporter';

  @override
  String get onboardingScreenOneSubtitle =>
      'Votre application incontournable pour gérer et analyser vos journaux d\'appels sans effort.';

  @override
  String get onboardingScreenOneTitle => 'Bienvenue dans Journal !';

  @override
  String get onboardingScreenThreeSubtitle =>
      'Comprenez vos habitudes d\'appel comme jamais auparavant et obtenez des informations détaillées pour optimiser votre temps.';

  @override
  String get onboardingScreenThreeTitle => 'Analysez vos appels';

  @override
  String get onboardingScreenTwoSubtitle =>
      'Recherchez, filtrez et gérez vos journaux d\'appels grâce à une interface fluide et intuitive.';

  @override
  String get onboardingScreenTwoTitle => 'Gérer les journaux d\'appels';

  @override
  String get openText => 'Ouvrir';

  @override
  String get outgoingText => 'Sortant';

  @override
  String get phoneAccountIdText => 'ID du compte téléphonique';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => 'plateforme';

  @override
  String get randomDTRepr => 'Ven, 12 juil. 2024 14:15:00';

  @override
  String get randomMonthAbbr => 'Juil';

  @override
  String get randomMonthName => 'Juillet';

  @override
  String get randomWeekdayAbbr => 'Ven';

  @override
  String get randomWeekdayName => 'Vendredi';

  @override
  String get refreshText => 'Actualiser';

  @override
  String get rejectedText => 'Rejeté';

  @override
  String get reportIssueButtonText => 'Signaler un problème ou un bug';

  @override
  String get resetText => 'Réinitialiser';

  @override
  String get resetToDefaultText => 'Réinitialiser par défaut';

  @override
  String get saveText => 'Enregistrer';

  @override
  String get settingsScreenLabelText => 'Paramètres';

  @override
  String get shareText => 'Partager';

  @override
  String get simText => 'Nom d\'affichage de la carte SIM';

  @override
  String get skipText => 'Ignorer';

  @override
  String get startImportText => 'Démarrer l\'importation';

  @override
  String get storagePolicyLabelText => 'Politique de stockage';

  @override
  String get storagePolicyText =>
      'Cette application stocke temporairement les fichiers générés, en les supprimant à la sortie. Vous pouvez télécharger les journaux d\'appels à l\'emplacement de votre choix. Journal accède uniquement aux journaux d\'appels, garantissant ainsi votre confidentialité.';

  @override
  String get supportedFormatInformation =>
      'Veuillez noter que seul le format CSV est actuellement pris en charge pour l\'importation de journaux d\'appels.';

  @override
  String get timeText => 'Heure';

  @override
  String get tokenAccordianText =>
      'jetons de formatage de la date et de l\'heure';

  @override
  String get tokensInfoText =>
      'Vous pouvez utiliser les jetons fournis pour personnaliser le format de votre nom de fichier en fonction de vos préférences spécifiques de date et d\'heure.';

  @override
  String get unknownText => 'Inconnu';

  @override
  String get versionText => 'version';

  @override
  String get viewText => 'Afficher';

  @override
  String get wifiIncomingText => 'Wifi Entrant';

  @override
  String get wifiOutgoingText => 'Wifi Sortant';

  @override
  String get callStatsText => 'Statistiques d\'appel';

  @override
  String get callDurationText => 'Durée de l\'appel';

  @override
  String get mostCalledNumberText => 'Numéro le plus appelé';

  @override
  String get callDirectionAnalysisText => 'Analyse de la direction des appels';

  @override
  String get longestCallText => 'Appel le plus long';

  @override
  String topNLongestCalls(int n) {
    return 'Top $n des appels les plus longs';
  }

  @override
  String get callText => 'Appel';

  @override
  String get smsText => 'SMS';

  @override
  String get nothingToDisplayText => 'Rien à afficher';

  @override
  String get callsMadeText => 'Appels passés';

  @override
  String get callsReceivedText => 'Appels reçus';

  @override
  String get callsMissedText => 'Appels manqués';

  @override
  String get callsRejectedText => 'Appels rejetés';

  @override
  String get callsBlockedText => 'Appels bloqués';

  @override
  String get averageText => 'Moyenne';

  @override
  String get longestText => 'Le plus long';

  @override
  String get totalText => 'Total';

  @override
  String get todayText => 'Aujourd\'hui';

  @override
  String get yesterdayText => 'Hier';

  @override
  String get thisMonthText => 'Ce mois-ci';

  @override
  String get pastMonthText => 'Mois dernier';

  @override
  String get thisYearText => 'Cette année';

  @override
  String get pastYearText => 'L\'année dernière';

  @override
  String get allTimeText => 'Tout le temps';

  @override
  String get customText => 'Personnalisé';

  @override
  String get startDateText => 'Date de début';

  @override
  String get endDateText => 'Date de fin';

  @override
  String get dateRangeText => 'Plage de dates';

  @override
  String get searchByNumberText => 'Numéro de téléphone spécifique';

  @override
  String get phoneAccountIdFilterText => 'ID du compte téléphonique';

  @override
  String get filterByDurationText => 'Filtrer par durée d\'appel';

  @override
  String get showUnknownContactsOnlyText => 'Unknown Contacts Only';

  @override
  String get filterByCallTypeText => 'Type d\'appel';

  @override
  String get answeredExternallyText => 'Répondu en externe';

  @override
  String get voiceMailText => 'Messagerie vocale';

  @override
  String get exportOpenHintText => 'Ouvrir l\'exportation';

  @override
  String get anyText => 'N\'importe quel';

  @override
  String get processingFileText => 'Traitement du fichier';

  @override
  String get insertingLogsText => 'Insertion des journaux';

  @override
  String get takingMoreTimeText => 'Cela peut prendre plus de temps';

  @override
  String get pleaseWaitText => 'Veuillez patienter';

  @override
  String get importSuccessMessageText =>
      'Journaux d\'appels importés avec succès';

  @override
  String get failedToUpdateSettingsText =>
      'Échec de la mise à jour des paramètres. Veuillez réessayer plus tard';

  @override
  String get shareSettingUpdateSuccessMsgText =>
      'Paramètres de partage mis à jour avec succès.';

  @override
  String get downloadSettingUpdatedSuccessMsgText =>
      'Paramètres de téléchargement mis à jour avec succès.';

  @override
  String get settingUpdateSuccessMsgText =>
      'Paramètres mis à jour avec succès.';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText =>
      'Paramètres du filtre de durée mis à jour avec succès.';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      'Paramètres du filtre par ID de compte téléphonique mis à jour avec succès.';

  @override
  String get generalSettingUpdatedSuccessMsgText =>
      'Paramètres mis à jour avec succès.';

  @override
  String get importSettingUpdatedSuccessMsgText =>
      'Paramètres d\'importation mis à jour avec succès.';

  @override
  String get exportFieldInfoText =>
      'Informations sur les champs d\'exportation';

  @override
  String get csvJsonExportNameField =>
      'Nom associé à l\'entrée du journal d\'appels';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      'L\'ID du compte téléphonique associé à l\'appel identifie le compte spécifique ou la carte SIM utilisée pour passer ou recevoir l\'appel';

  @override
  String get csvJsonExportCallTypeField =>
      'Type d\'appel (par exemple, entrant, sortant, manqué)';

  @override
  String get csvJsonExportNumberField =>
      'Numéro de téléphone associé à l\'entrée du journal d\'appels';

  @override
  String get csvJsonExportFormattedNumberField =>
      'Numéro de téléphone mis en forme, avec des règles de mise en forme basées sur le pays dans lequel l\'utilisateur se trouvait lorsque l\'appel a été passé ou reçu.';

  @override
  String get csvJsonExportSimDisplayField =>
      'Nom d\'affichage de la carte SIM associée à l\'appel';

  @override
  String get csvJsonExportTimestampField =>
      'Horodatage (temps Unix) de l\'appel';

  @override
  String get csvJsonExportDurationField => 'Durée de l\'appel en secondes';

  @override
  String get csvJsonExportCachedNumberLabelField =>
      'Libellé associé au numéro de téléphone mis en cache';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      'Le type de numéro mis en cache (domicile, travail, etc.) associé au numéro de téléphone, s\'il existe.';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      'Numéro de téléphone stocké ou mis en cache associé à une entrée du journal d\'appels pour une référence rapide.';

  @override
  String get exportFieldInfoHintText => 'Infos sur les champs d\'exportation';

  @override
  String get naText => 'n.d.';

  @override
  String get confirmDownloadText => 'Confirmer le téléchargement';

  @override
  String get mostReceivedNumberText => 'Numéro le plus reçu';

  @override
  String get confirmContactsSyncLabelText =>
      'Confirmer la synchronisation des contacts';

  @override
  String get confirmContactsSyncConfirmationText =>
      'Ce processus analysera vos journaux d\'appels et mettra à jour les noms de contact manquants en les faisant correspondre avec vos contacts enregistrés. Il ne modifiera aucun autre détail de votre historique d\'appels.';

  @override
  String get contactsSyncSuccessMessageText =>
      'Contacts synchronisés avec succès avec les journaux d\'appels';

  @override
  String get contactsSyncErrorMessageText =>
      'Erreur lors de la synchronisation des contacts !';

  @override
  String get contactsPermissionDenied =>
      'Permission d\'accès aux contacts refusée !';

  @override
  String get syncContactsLabelText =>
      'Synchroniser les contacts du journal d\'appels';

  @override
  String get syncContactsCTAText => 'Synchroniser maintenant';

  @override
  String get softwareInformationText => 'Informations sur le logiciel';

  @override
  String get addToContactsText => 'Ajouter aux contacts';

  @override
  String get addToContactsErrorText =>
      'Impossible d\'ajouter un nouveau contact';

  @override
  String get appPermissionsDeniedError =>
      'Oups ! Il semble que l\'accès aux journaux d\'appels ait été refusé. Pour que Logger fonctionne correctement, veuillez accorder la permission.';

  @override
  String get appFatalError =>
      'Oh mince ! Quelque chose d\'inattendu s\'est produit !';

  @override
  String get appPreferencesError =>
      'Oh mince ! Erreur lors du chargement des préférences.';

  @override
  String get uriPermissionError => 'Impossible d\'obtenir les permissions';

  @override
  String get fileGenerationError =>
      'Une erreur est survenue lors de la génération du fichier. Veuillez réessayer plus tard';

  @override
  String get fileShareMessage =>
      'Partager le fichier des journaux d\'appels via Gmail, WhatsApp, etc...';

  @override
  String get fileShareSubject => 'Journaux d\'appels';

  @override
  String get fileOpenError =>
      'Impossible d\'ouvrir le fichier, veuillez réessayer plus tard';

  @override
  String get openingFileLabel => 'Ouverture du fichier';

  @override
  String get viewContactLabel => 'Voir le contact';

  @override
  String get errorOpeningContact => 'Erreur lors de l\'ouverture du contact';

  @override
  String get waLaunchError => 'Impossible de lancer WhatsApp';

  @override
  String get closeText => 'Fermer';

  @override
  String get defaultPresetName => 'Préréglage par défaut';

  @override
  String get onLabel => 'Activé';

  @override
  String get offLabel => 'Désactivé';

  @override
  String get filterPresetTitle => 'Préréglages de filtre';

  @override
  String get addMorePresetsLabel => 'Ajouter un préréglage';

  @override
  String get deleteAllPresetsLabel => 'tout supprimer';

  @override
  String get enablePresetsPlaceholderText =>
      'Activez les préréglages pour créer et basculer facilement entre plusieurs filtres pour une personnalisation rapide du journal d\'appels.';

  @override
  String get noPresetsPlaceholderText =>
      'Commencez à créer vos propres préréglages personnalisés pour un filtrage rapide';

  @override
  String get presetNameInputLabelText => 'Nom du préréglage';

  @override
  String get presetNameInputHintText => 'Entrez un nom pour le préréglage';

  @override
  String get defaultLabelText => 'Par défaut';

  @override
  String get lastCallText => 'Dernier appel';

  @override
  String get groupByContactAndTypeTitle => 'Regrouper par contact et type';

  @override
  String get groupByContactAndTypeDescription =>
      'Les appels sont regroupés par contact et type d\'appel';

  @override
  String get groupByContactOnlyConsecutiveTitle =>
      'Regrouper par contacts consécutifs';

  @override
  String get groupByContactOnlyConsecutiveDescription =>
      'Regroupe les appels consécutifs du même contact en un seul groupe';

  @override
  String get groupByContactOnlyTitle => 'Regrouper par contact';

  @override
  String get groupByContactOnlyDescription =>
      'Regroupe tous les appels du même contact';

  @override
  String get groupByNoneDescription =>
      'Aucun regroupement — chaque appel est affiché séparément';

  @override
  String get callGroupingText => 'Puhelujen ryhmittely';

  @override
  String get useGroupingSwitchText => 'Käytä ryhmittelyä suodattimien kanssa';

  @override
  String get clearFiltersTooltip => 'Effacer les filtres';

  @override
  String get scrollToTopTooltip => 'Remonter en haut';

  @override
  String get watchListText => 'Liste de suivi';

  @override
  String get roundDurationText => 'Arrondir les appels aux minutes';

  @override
  String get roundDurationTextSubtitle =>
      'Arrondissez les appels à la minute la plus proche pour la facturation';

  @override
  String get groupedCallSettingSubtitle =>
      'Choisissez comment regrouper les appels pour un suivi et une vue d\'ensemble plus faciles';

  @override
  String get filterPresetsSettingSubtitle =>
      'Créez, enregistrez et réutilisez des filtres pour trouver facilement des appels';

  @override
  String get exportFilenameSettingSubtitle =>
      'Personnalisez la façon dont vos fichiers exportés sont nommés';

  @override
  String get exportFormatSettingSubtitle =>
      'Choisissez le format des journaux d\'appels exportés';

  @override
  String get importCallLogsSettingSubtitle =>
      'Importer l\'historique des appels depuis d\'autres sources ou sauvegardes';

  @override
  String get appDetailsText => 'Infos & détails de l\'application';

  @override
  String get appDetailsSubText => 'Version • Faire un don • Signaler un bug';

  @override
  String get enableDownloadConfirmationText => 'Confirmer le téléchargement';

  @override
  String get enableDownloadConfirmationSubText =>
      'Demander une confirmation avant de télécharger les fichiers';

  @override
  String get enableCallDurationFilteringText => 'Filtrage par durée';

  @override
  String get enableCallDurationFilteringSubText =>
      'Filtrer les appels en fonction de leur durée';

  @override
  String get enableCallLogCountVisibilityText => 'Nombre d\'appels';

  @override
  String get enableCallLogCountVisibilitySubText =>
      'Afficher le nombre d\'appels par jour';

  @override
  String get enableFilterByAccountIdText => 'Filtrer par ID de compte';

  @override
  String get enableFilterByAccountIdSubText =>
      'Afficher les appels d\'une SIM ou d\'un compte spécifique';

  @override
  String get showTotalCallDurationText => 'Durée totale des appels';

  @override
  String get showTotalCallDurationSubText =>
      'Afficher le temps total passé au téléphone';

  @override
  String get disableLogsSharingText => 'Masquer le bouton de partage';

  @override
  String get disableLogsSharingSubText =>
      'Masquer le bouton de partage dans les journaux d\'appels';

  @override
  String get trackListLabelText => 'Liste de suivi';

  @override
  String get tracklistPlaceholderText =>
      'Gérez vos contacts suivis efficacement. Appuyez sur + (en haut à droite) pour ajouter un contact, faites glisser un élément de la liste vers la gauche et appuyez sur Supprimer pour ne plus suivre.';

  @override
  String get removeAllText => 'tout supprimer';

  @override
  String get trackContactLabelText => 'Nom du contact';

  @override
  String get trackContactText => 'Suivre un contact';

  @override
  String get removeText => 'Supprimer';

  @override
  String get iteractionScoreText => 'Score d\'interaction';

  @override
  String get lastCallSinceText => 'Dernier appel depuis';

  @override
  String get avgCallsMonthText => 'Appels moyens / mois';

  @override
  String get avgCallDurationText => 'Durée moyenne des appels';

  @override
  String get peakCallDurationText => 'Durée maximale des appels';

  @override
  String get callsPerWeekText => 'Appels moyens / semaine';

  @override
  String get callDistByWeekDay =>
      'Répartition des appels par jour de la semaine (%)';

  @override
  String addToTrackList(Object maxItems) {
    return 'Ajoutez jusqu\'à $maxItems contacts à votre liste de suivi pour un suivi facile.';
  }

  @override
  String get addText => 'Ajouter';

  @override
  String get numberAlreadyAddedErrorText => 'Contact déjà ajouté';

  @override
  String get invalidNumberErrorText => 'Numéro de téléphone invalide';

  @override
  String get emptyPhoneNumberErrorText => 'Entrez un nom de contact';

  @override
  String get trackNumberErrorText =>
      'Une erreur est survenue lors de l\'ajout d\'un nouveau contact à suivre';

  @override
  String get quickFilterText => 'Filtre rapide';
}
