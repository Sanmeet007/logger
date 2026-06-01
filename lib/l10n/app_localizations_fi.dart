// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get aboutText => 'Tietoja';

  @override
  String get advancedSettingsLabelText => 'Lisäasetukset';

  @override
  String get analyticsPolicyLabelText => 'Analytiikkakäytäntö';

  @override
  String get analyticsPolicyText =>
      'Kaikki puhelulokitiedot analysoidaan paikallisesti laitteessasi, eikä niitä koskaan lähetetä online-palvelimille, mikä varmistaa yksityisyytesi ja pitää tietosi turvassa ja luottamuksellisina';

  @override
  String get analyticsScreenLabelText => 'Analytiikka';

  @override
  String get appError => 'Oho! Jokin meni vikaan';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => 'Käytä suodattimia';

  @override
  String get baseGhostErrorMessage => 'Jokin meni vikaan';

  @override
  String get baseSettingsLabelText => 'Yleiset asetukset';

  @override
  String get blockedText => 'Estetty';

  @override
  String get callLogsExportFailureText => 'Virhe ladatessa tiedostoa!';

  @override
  String get callLogsExportFormatLabelText => 'Puhelulokien vientimuoto';

  @override
  String get callLogsExportSuccessText =>
      'Puhelulokit purettu ja ladattu onnistuneesti';

  @override
  String get callTypeText => 'Puhelun tyyppi';

  @override
  String get cancelText => 'Peruuta';

  @override
  String get configureText => 'Määritä';

  @override
  String get confirmImportLabelText => 'Vahvista tuonnin aloitus';

  @override
  String get confirmImportText =>
      'Puhelulokien tuonti on merkittävä tehtävä, joka voi peruuttamattomasti vioittaa nykyisiä lokiasi, korvata tietoja ja aiheuttaa epäjohdonmukaisuuksia historiassasi. Huomioithan, että tämä prosessi voi kestää jonkin aikaa ja saattaa johtaa yllä mainittuihin ongelmiin. Toimi varoen.';

  @override
  String get continueText => 'Jatka';

  @override
  String get dateText => 'Päivämäärä';

  @override
  String get donateText => 'Lahjoita';

  @override
  String downloadConfirmationText(String currentImportType) {
    return 'Haluatko varmasti ladata puhelulokisi $currentImportType-muodossa? Tämä toiminto tallentaa puheluhistoriasi $currentImportType-tiedostoon laitteellasi.';
  }

  @override
  String get downloadText => 'Lataa';

  @override
  String get dtAAcronymExapandedText => 'Koko viikonpäivän nimi';

  @override
  String get dtBAcronymExapandedText => 'Koko kuukauden nimi';

  @override
  String get dtHAcronymExapandedText => 'Tunti 24 tunnin muodossa';

  @override
  String get dtIAcronymExapandedText => 'Tunti 12 tunnin muodossa';

  @override
  String get dtMAcronymExapandedText => 'Minuutit';

  @override
  String get dtSAcronymExapandedText => 'Sekunnit';

  @override
  String get dtUAcronymExapandedText =>
      'Viikon numero vuodessa (sunnuntai viikon ensimmäisenä päivänä)';

  @override
  String get dtWAcronymExapandedText =>
      'Viikon numero vuodessa (maanantai viikon ensimmäisenä päivänä)';

  @override
  String get dtXAcronymExapandedText => 'Ajan esitys';

  @override
  String get dtYAcronymExapandedText => 'Vuosi vuosisadan kanssa';

  @override
  String get dtZAcronymExapandedText => 'Aikavyöhykkeen nimi';

  @override
  String get dtaAcronymExapandedText => 'Lyhennetty viikonpäivän nimi';

  @override
  String get dtbAcronymExapandedText => 'Lyhennetty kuukauden nimi';

  @override
  String get dtcAcronymExapandedText => 'Päivämäärän ja ajan esitys';

  @override
  String get dtdAcronymExapandedText => 'Kuukauden päivä';

  @override
  String get dtfAcronymExapandedText => 'Millisekunnit';

  @override
  String get dtjAcronymExapandedText => 'Vuoden päivä';

  @override
  String get dtmAcronymExapandedText => 'Kuukausi numerona';

  @override
  String get dtpAcronymExapandedText => 'AM/PM-merkki';

  @override
  String get dtxAcronymExapandedText => 'Päivämäärän esitys';

  @override
  String get dtyAcronymExapandedText => 'Vuosi ilman vuosisataa';

  @override
  String get dtzAcronymExapandedText => 'Aikavyöhykkeen siirtymä UTC:stä';

  @override
  String get durationText => 'Kesto';

  @override
  String get exploreNowText => 'Tutki nyt';

  @override
  String get exploreProjectButtonText => 'Tutki projektia Githubissa';

  @override
  String get exportFileNameFormatLabelText => 'Vientitiedostonimen muoto';

  @override
  String get filenameFormatHintText => 'puhelulokini-[%merkki]';

  @override
  String get filenameFormatLabelText => 'Tiedostonimen muoto';

  @override
  String get filterText => 'Suodata';

  @override
  String get getStartedText => 'Aloita';

  @override
  String get ghostErrorMessage => 'Hups. Jokin meni vikaan';

  @override
  String get hideText => 'Piilota';

  @override
  String get hintMobileNumberText => '040XXXXXXX';

  @override
  String get importCallLogsText => 'Tuo puhelulokisi';

  @override
  String get incomingText => 'Saapuva';

  @override
  String get logsScreenLabelText => 'Lokit';

  @override
  String get maximumDurationHintText => 'esim: 60';

  @override
  String get maximumDurationLabelText => 'Maks (sek.)';

  @override
  String get minimumDurationHintText => 'esim: 0';

  @override
  String get minimumDurationLabelText => 'Min (sek.)';

  @override
  String get missedText => 'Vastaamaton';

  @override
  String get mobileNumberText => 'Matkapuhelinnumero';

  @override
  String get nextText => 'Seuraava';

  @override
  String get onboardingScreenFourSubtitle =>
      'Siirrä puhelulokeja saumattomasti laitteiden välillä tai vie niitä turvaan ja analysointia varten.';

  @override
  String get onboardingScreenFourTitle => 'Tuo & Vie';

  @override
  String get onboardingScreenOneSubtitle =>
      'Sovelluksesi puhelulokiesi vaivattomaan hallintaan ja analysointiin.';

  @override
  String get onboardingScreenOneTitle => 'Tervetuloa Lokit-sovellukseen!';

  @override
  String get onboardingScreenThreeSubtitle =>
      'Ymmärrä puhelumallejasi paremmin kuin koskaan ja hanki yksityiskohtaisia tietoja ajan optimoimiseksi.';

  @override
  String get onboardingScreenThreeTitle => 'Analysoi Puhelusi';

  @override
  String get onboardingScreenTwoSubtitle =>
      'Hae, suodata ja hallitse puhelulokejasi saumattomalla ja intuitiivisella käyttöliittymällä.';

  @override
  String get onboardingScreenTwoTitle => 'Hallitse Puhelulokeja';

  @override
  String get openText => 'Avaa';

  @override
  String get outgoingText => 'Lähtevä';

  @override
  String get phoneAccountIdText => 'Puhelintilin tunnus';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => 'alusta';

  @override
  String get randomDTRepr => 'Pe, 12 Heinä 2024 14:15:00';

  @override
  String get randomMonthAbbr => 'Heinä';

  @override
  String get randomMonthName => 'Heinäkuu';

  @override
  String get randomWeekdayAbbr => 'Pe';

  @override
  String get randomWeekdayName => 'Perjantai';

  @override
  String get refreshText => 'Päivitä';

  @override
  String get rejectedText => 'Hylätty';

  @override
  String get reportIssueButtonText => 'Ilmoita ongelmasta tai virheestä';

  @override
  String get resetText => 'Palauta';

  @override
  String get resetToDefaultText => 'Palauta oletusasetukset';

  @override
  String get saveText => 'Tallenna';

  @override
  String get settingsScreenLabelText => 'Asetukset';

  @override
  String get shareText => 'Jaa';

  @override
  String get simText => 'SIM-kortin nimi';

  @override
  String get skipText => 'Ohita';

  @override
  String get startImportText => 'Aloita tuonti';

  @override
  String get storagePolicyLabelText => 'Tallennuskäytäntö';

  @override
  String get storagePolicyText =>
      'Tämä sovellus tallentaa luodut tiedostot väliaikaisesti ja poistaa ne poistuessa. Voit ladata puhelulokit valitsemaasi sijaintiin. Lokit käyttää vain puhelulokeja yksityisyytesi varmistamiseksi.';

  @override
  String get supportedFormatInformation =>
      'Huomaa: Vain CSV-muoto on tällä hetkellä tuettu puhelulokien tuonnissa.';

  @override
  String get timeText => 'Aika';

  @override
  String get tokenAccordianText => 'päivämäärän ja ajan muotoilumerkit';

  @override
  String get tokensInfoText =>
      'Voit mukauttaa tiedostonimen muotoa tarjottujen merkkien avulla tiettyjen päivämäärä- ja aika-asetusten perusteella.';

  @override
  String get unknownText => 'Tuntematon';

  @override
  String get versionText => 'versio';

  @override
  String get viewText => 'Näytä';

  @override
  String get wifiIncomingText => 'Wifi saapuva';

  @override
  String get wifiOutgoingText => 'Wifi lähtevä';

  @override
  String get callStatsText => 'Puhelutilastot';

  @override
  String get callDurationText => 'Puhelun kesto';

  @override
  String get mostCalledNumberText => 'Useimmin soitettu numero';

  @override
  String get callDirectionAnalysisText => 'Puhelusuunnan analyysi';

  @override
  String get longestCallText => 'Pisin puhelu';

  @override
  String topNLongestCalls(int n) {
    return 'Top $n pisintä puhelua';
  }

  @override
  String get callText => 'Puhelu';

  @override
  String get smsText => 'SMS';

  @override
  String get nothingToDisplayText => 'Ei mitään näytettävää';

  @override
  String get callsMadeText => 'Soitettuja puheluita';

  @override
  String get callsReceivedText => 'Vastaanotettuja puheluita';

  @override
  String get callsMissedText => 'Vastaamattomia puheluita';

  @override
  String get callsRejectedText => 'Hylättyjä puheluita';

  @override
  String get callsBlockedText => 'Estettyjä puheluita';

  @override
  String get averageText => 'Keskiarvo';

  @override
  String get longestText => 'Pisin';

  @override
  String get totalText => 'Yhteensä';

  @override
  String get todayText => 'Tänään';

  @override
  String get yesterdayText => 'Eilen';

  @override
  String get thisMonthText => 'Tämä kuukausi';

  @override
  String get pastMonthText => 'Edellinen kuukausi';

  @override
  String get thisYearText => 'Tämä vuosi';

  @override
  String get pastYearText => 'Edellinen vuosi';

  @override
  String get allTimeText => 'Kaikki ajat';

  @override
  String get customText => 'Mukautettu';

  @override
  String get startDateText => 'Aloituspäivämäärä';

  @override
  String get endDateText => 'Päättymispäivämäärä';

  @override
  String get dateRangeText => 'Aikaväli';

  @override
  String get searchByNumberText => 'Tietty puhelinnumero';

  @override
  String get phoneAccountIdFilterText => 'Puhelintilin tunnus';

  @override
  String get filterByDurationText => 'Suodata puhelun keston mukaan';

  @override
  String get filterByCallTypeText => 'Puhelun tyyppi';

  @override
  String get answeredExternallyText => 'Vastattu ulkoisesti';

  @override
  String get voiceMailText => 'Vastaaja';

  @override
  String get exportOpenHintText => 'Vie Avaa';

  @override
  String get anyText => 'Mikä tahansa';

  @override
  String get processingFileText => 'Käsitellään tiedostoa';

  @override
  String get insertingLogsText => 'Lisätään lokit';

  @override
  String get takingMoreTimeText => 'Tämä voi kestää kauemmin';

  @override
  String get pleaseWaitText => 'Odota hetki';

  @override
  String get importSuccessMessageText => 'Puhelulokit tuotu onnistuneesti';

  @override
  String get failedToUpdateSettingsText =>
      'Asetusten päivitys epäonnistui. Yritä myöhemmin uudelleen';

  @override
  String get shareSettingUpdateSuccessMsgText =>
      'Jakamisasetukset päivitetty onnistuneesti.';

  @override
  String get downloadSettingUpdatedSuccessMsgText =>
      'Latausasetukset päivitetty onnistuneesti.';

  @override
  String get settingUpdateSuccessMsgText => 'Asetus päivitetty onnistuneesti.';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText =>
      'Keston suodatusasetukset päivitetty onnistuneesti.';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      'Puhelintilin tunnus suodatusasetukset päivitetty onnistuneesti.';

  @override
  String get generalSettingUpdatedSuccessMsgText =>
      'Asetukset päivitetty onnistuneesti.';

  @override
  String get importSettingUpdatedSuccessMsgText =>
      'Tuonti asetukset päivitetty onnistuneesti.';

  @override
  String get exportFieldInfoText => 'Vie kenttätiedot';

  @override
  String get csvJsonExportNameField => 'Puhelulokimerkintään liittyvä nimi';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      'Puheluun liittyvän puhelintilin tunnus, joka tunnistaa puhelun soittamiseen tai vastaanottamiseen käytetyn tilin tai SIM-kortin';

  @override
  String get csvJsonExportCallTypeField =>
      'Puhelun tyyppi (esim. saapuva, lähtevä, vastaamaton)';

  @override
  String get csvJsonExportNumberField =>
      'Puhelulokimerkintään liittyvä puhelinnumero';

  @override
  String get csvJsonExportFormattedNumberField =>
      'Muotoiltu puhelinnumero, muotoiltu niiden muotoilusääntöjen mukaisesti, jotka olivat voimassa, kun puhelu soitettiin tai vastaanotettiin.';

  @override
  String get csvJsonExportSimDisplayField =>
      'Puheluun liittyvän SIM-kortin näyttönimi';

  @override
  String get csvJsonExportTimestampField => 'Puhelun aikaleima (epookkiaika)';

  @override
  String get csvJsonExportDurationField => 'Puhelun kesto sekunteina';

  @override
  String get csvJsonExportCachedNumberLabelField =>
      'Välimuistissa olevan puhelinnumeron tunnus';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      'Välimuistissa olevan puhelinnumeron tyyppi (koti, työ jne.), jos se on olemassa.';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      'Tallennettu tai välimuistissa oleva puhelinnumero, joka liittyy puhelulokimerkintään nopeaa viittausta varten.';

  @override
  String get exportFieldInfoHintText => 'Vie kenttätiedot';

  @override
  String get naText => 'Ei yritetty';

  @override
  String get confirmDownloadText => 'Vahvista lataus';

  @override
  String get mostReceivedNumberText => 'Eniten vastaanotettu numero';

  @override
  String get confirmContactsSyncLabelText =>
      'Vahvista yhteystietojen synkronointi';

  @override
  String get confirmContactsSyncConfirmationText =>
      'Tämä prosessi tarkistaa puhelulokit ja päivittää puuttuvat yhteystiedot vastaamaan tallennettuja yhteystietoja. Se ei muuta muita yksityiskohtia puheluhistoriassasi.';

  @override
  String get contactsSyncSuccessMessageText =>
      'Yhteystiedot synkronoitiin onnistuneesti puhelulokeihin';

  @override
  String get contactsSyncErrorMessageText =>
      'Virhe yhteystietojen synkronoinnissa!';

  @override
  String get contactsPermissionDenied =>
      'Yhteystietojen käyttöoikeus evättiin!';

  @override
  String get syncContactsLabelText => 'Synkronoi puhelulokin yhteystiedot';

  @override
  String get syncContactsCTAText => 'Synkronoi nyt';

  @override
  String get softwareInformationText => 'Ohjelmistotiedot';

  @override
  String get addToContactsText => 'Lisää yhteystietoihin';

  @override
  String get addToContactsErrorText =>
      'Uuden yhteystiedon lisääminen epäonnistui';

  @override
  String get appPermissionsDeniedError =>
      'Hups! Näyttää siltä, että pääsy puhelulokeihin on evätty. Jotta Logger toimii sujuvasti, anna lupa.';

  @override
  String get appFatalError => 'Voi ei! Jotain odottamatonta tapahtui!';

  @override
  String get appPreferencesError =>
      'Voi ei! Asetusten lataamisessa tapahtui virhe.';

  @override
  String get uriPermissionError => 'Ei voida saada lupia';

  @override
  String get fileGenerationError =>
      'Tiedoston luomisen aikana tapahtui virhe. Yritä myöhemmin uudelleen';

  @override
  String get fileShareMessage =>
      'Jaa puhelulokien tiedosto Gmailin, WhatsAppin jne. kautta...';

  @override
  String get fileShareSubject => 'Puhelulokit';

  @override
  String get fileOpenError =>
      'Tiedostoa ei voi avata, yritä myöhemmin uudelleen';

  @override
  String get openingFileLabel => 'Avataan tiedostoa';

  @override
  String get viewContactLabel => 'Näytä yhteystieto';

  @override
  String get errorOpeningContact => 'Virhe avattaessa yhteystietoa';

  @override
  String get waLaunchError => 'WhatsAppia ei voitu käynnistää';

  @override
  String get closeText => 'Sulje';

  @override
  String get defaultPresetName => 'Oletusasetukset';

  @override
  String get onLabel => 'Päällä';

  @override
  String get offLabel => 'Pois';

  @override
  String get filterPresetTitle => 'Suodatinasetukset';

  @override
  String get addMorePresetsLabel => 'Lisää esiasetus';

  @override
  String get deleteAllPresetsLabel => 'poista kaikki';

  @override
  String get enablePresetsPlaceholderText =>
      'Ota esiasetukset käyttöön, jotta voit helposti luoda ja vaihtaa useiden suodattimien välillä nopeaa puhelulokien mukauttamista varten.';

  @override
  String get noPresetsPlaceholderText =>
      'Aloita omien mukautettujen esiasetusten luominen nopeaan suodattamiseen';

  @override
  String get presetNameInputLabelText => 'Esiasetuksen nimi';

  @override
  String get presetNameInputHintText => 'Syötä esiasetuksen nimi';

  @override
  String get defaultLabelText => 'Oletus';

  @override
  String get lastCallText => 'Viimeinen puhelu';

  @override
  String get groupByContactAndTypeTitle =>
      'Ryhmittele yhteystiedon ja tyypin mukaan';

  @override
  String get groupByContactAndTypeDescription =>
      'Puhelut ryhmitellään yhteystiedon ja puhelutyypin mukaan';

  @override
  String get groupByContactOnlyConsecutiveTitle =>
      'Ryhmittele peräkkäisten yhteystietojen mukaan';

  @override
  String get groupByContactOnlyConsecutiveDescription =>
      'Yhdistää saman yhteystiedon peräkkäiset puhelut yhdeksi ryhmäksi';

  @override
  String get groupByContactOnlyTitle => 'Ryhmittele yhteystiedon mukaan';

  @override
  String get groupByContactOnlyDescription =>
      'Ryhmittelee kaikki saman yhteystiedon puhelut';

  @override
  String get groupByNoneDescription =>
      'Ei ryhmittelyä – jokainen puhelu näytetään erikseen';

  @override
  String get callGroupingText => 'Puhelujen ryhmittely';

  @override
  String get useGroupingSwitchText => 'Käytä ryhmittelyä suodattimien kanssa';

  @override
  String get clearFiltersTooltip => 'Tyhjennä suodattimet';

  @override
  String get scrollToTopTooltip => 'Vieritä ylös';

  @override
  String get watchListText => 'Seurantalista';

  @override
  String get roundDurationText => 'Pyöristä puheluiden kesto minuuteiksi';

  @override
  String get roundDurationTextSubtitle =>
      'Pyöristä puhelut lähimpään minuuttiin laskutusta varten';

  @override
  String get groupedCallSettingSubtitle =>
      'Valitse, miten puhelut ryhmitellään helpompaa seurantaa ja yleiskatsausta varten';

  @override
  String get filterPresetsSettingSubtitle =>
      'Luo, tallenna ja käytä suodattimia uudelleen, jotta löydät puhelut helposti';

  @override
  String get exportFilenameSettingSubtitle =>
      'Mukauta, miten viedyt tiedostot nimetään';

  @override
  String get exportFormatSettingSubtitle =>
      'Valitse vientipuhelulokien tiedostomuoto';

  @override
  String get importCallLogsSettingSubtitle =>
      'Tuo puheluhistoriaa muista lähteistä tai varmuuskopioista';

  @override
  String get appDetailsText => 'Sovellustiedot & Yksityiskohdat';

  @override
  String get appDetailsSubText => 'Versio • Lahjoita • Virheraportti';

  @override
  String get enableDownloadConfirmationText => 'Vahvista lataus';

  @override
  String get enableDownloadConfirmationSubText =>
      'Pyydä vahvistus ennen tiedostojen lataamista';

  @override
  String get enableCallDurationFilteringText => 'Keston suodatus';

  @override
  String get enableCallDurationFilteringSubText =>
      'Suodata puhelut kestonsa perusteella';

  @override
  String get enableCallLogCountVisibilityText => 'Puhelulokien määrä';

  @override
  String get enableCallLogCountVisibilitySubText =>
      'Näytä puheluiden määrä päivittäin';

  @override
  String get enableFilterByAccountIdText => 'Suodata tilin ID:n mukaan';

  @override
  String get enableFilterByAccountIdSubText =>
      'Näytä puhelut tietylle SIM-kortille tai tilille';

  @override
  String get showTotalCallDurationText => 'Puheluiden kokonaiskesto';

  @override
  String get showTotalCallDurationSubText =>
      'Näytä puheluihin käytetty kokonaisaika';

  @override
  String get disableLogsSharingText => 'Piilota jakopainike';

  @override
  String get disableLogsSharingSubText => 'Piilota jakopainike puhelulokeissa';

  @override
  String get trackListLabelText => 'Seurantalista';

  @override
  String get tracklistPlaceholderText =>
      'Hallitse seurantalistaasi tehokkaasti. Napauta + (oikeassa yläkulmassa) lisätäksesi numeron, pyyhkäise vasemmalle listan kohteessa ja napauta Poista poistaaksesi seurannan.';

  @override
  String get removeAllText => 'poista kaikki';

  @override
  String get trackContactLabelText => 'Puhelinnumero';

  @override
  String get trackContactText => 'Seuraa kontaktia';

  @override
  String get removeText => 'Poista';

  @override
  String get iteractionScoreText => 'Vuorovaikutuspisteet';

  @override
  String get lastCallSinceText => 'Viimeisestä puhelusta';

  @override
  String get avgCallsMonthText => 'Keskimääräiset puhelut / kuukausi';

  @override
  String get avgCallDurationText => 'Keskimääräinen puhelun kesto';

  @override
  String get peakCallDurationText => 'Suurin puhelun kesto';

  @override
  String get callsPerWeekText => 'Keskimääräiset puhelut / viikko';

  @override
  String get callDistByWeekDay => 'Puhelujen jakautuminen viikonpäivittäin (%)';

  @override
  String addToTrackList(Object maxItems) {
    return 'Lisää jopa $maxItems kontaktia seurantalistaasi helppoa seurantaa varten.';
  }

  @override
  String get addText => 'Lisää';

  @override
  String get numberAlreadyAddedErrorText => 'Numero on jo lisätty';

  @override
  String get invalidNumberErrorText => 'Virheellinen puhelinnumero';

  @override
  String get emptyPhoneNumberErrorText => 'Anna puhelinnumero';

  @override
  String get trackNumberErrorText =>
      'Uuden seurattavan kontaktin lisäämisessä tapahtui virhe';

  @override
  String get quickFilterText => 'Pikasuodatin';
}
