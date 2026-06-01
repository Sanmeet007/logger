// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get aboutText => 'Hakkında';

  @override
  String get advancedSettingsLabelText => 'Gelişmiş Ayarlar';

  @override
  String get analyticsPolicyLabelText => 'Analitik Politikası';

  @override
  String get analyticsPolicyText =>
      'Tüm çağrı kaydı verileri cihazınızda yerel olarak analiz edilir ve çevrimiçi sunuculara asla iletilmez, böylece gizliliğiniz korunur ve bilgileriniz güvende kalır';

  @override
  String get analyticsScreenLabelText => 'Analitik';

  @override
  String get appError => 'Ah, bir şeyler ters gitti!';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => 'Filtreleri Uygula';

  @override
  String get baseGhostErrorMessage => 'Bir şeyler ters gitti';

  @override
  String get baseSettingsLabelText => 'Genel Ayarlar';

  @override
  String get blockedText => 'Engellenmiş';

  @override
  String get callLogsExportFailureText => 'Dosya indirilirken hata oluştu!';

  @override
  String get callLogsExportFormatLabelText =>
      'Çağrı kayıtları dışa aktarma formatı';

  @override
  String get callLogsExportSuccessText =>
      'Çağrı kayıtları başarıyla çıkarıldı ve indirildi';

  @override
  String get callTypeText => 'Çağrı Türü';

  @override
  String get cancelText => 'İptal';

  @override
  String get configureText => 'Yapılandır';

  @override
  String get confirmImportLabelText => 'İçe Aktarmayı Onayla';

  @override
  String get confirmImportText =>
      'Çağrı kayıtlarını içe aktarmak, mevcut kayıtlarınızı geri dönüşü olmayan şekilde bozabilir, verilerin üzerine yazabilir ve geçmişinizde tutarsızlıklara neden olabilir. Bu işlemin biraz zaman alabileceğini ve yukarıda belirtilen sorunlara yol açabileceğini lütfen unutmayın. Dikkatle devam edin.';

  @override
  String get continueText => 'Devam Et';

  @override
  String get dateText => 'Tarih';

  @override
  String get donateText => 'Bağış Yap';

  @override
  String downloadConfirmationText(String currentImportType) {
    return 'Çağrı kayıtlarınızı $currentImportType formatında indirmek istediğinizden emin misiniz? Bu işlem, çağrı geçmişinizi cihazınızda bir $currentImportType dosyası olarak kaydedecektir.';
  }

  @override
  String get downloadText => 'İndir';

  @override
  String get dtAAcronymExapandedText => 'Tam hafta günü adı';

  @override
  String get dtBAcronymExapandedText => 'Tam ay adı';

  @override
  String get dtHAcronymExapandedText => '24 saat formatında saat';

  @override
  String get dtIAcronymExapandedText => '12 saat formatında saat';

  @override
  String get dtMAcronymExapandedText => 'Dakika';

  @override
  String get dtSAcronymExapandedText => 'Saniye';

  @override
  String get dtUAcronymExapandedText =>
      'Yılın hafta numarası (Pazar haftanın ilk günü olarak)';

  @override
  String get dtWAcronymExapandedText =>
      'Yılın hafta numarası (Pazartesi haftanın ilk günü olarak)';

  @override
  String get dtXAcronymExapandedText => 'Zaman gösterimi';

  @override
  String get dtYAcronymExapandedText => 'Yüzyıl ile yıl';

  @override
  String get dtZAcronymExapandedText => 'Zaman dilimi adı';

  @override
  String get dtaAcronymExapandedText => 'Kısaltılmış hafta günü adı';

  @override
  String get dtbAcronymExapandedText => 'Kısaltılmış ay adı';

  @override
  String get dtcAcronymExapandedText => 'Tarih ve zaman gösterimi';

  @override
  String get dtdAcronymExapandedText => 'Ayın günü';

  @override
  String get dtfAcronymExapandedText => 'Milisaniye';

  @override
  String get dtjAcronymExapandedText => 'Yılın günü';

  @override
  String get dtmAcronymExapandedText => 'Ay numarası';

  @override
  String get dtpAcronymExapandedText => 'ÖÖ/ÖS işareti';

  @override
  String get dtxAcronymExapandedText => 'Tarih gösterimi';

  @override
  String get dtyAcronymExapandedText => 'Yüzyıl olmadan yıl';

  @override
  String get dtzAcronymExapandedText => 'UTC\'den zaman dilimi farkı';

  @override
  String get durationText => 'Süre';

  @override
  String get exploreNowText => 'Şimdi keşfet';

  @override
  String get exploreProjectButtonText => 'Projeyi GitHub\'da Keşfet';

  @override
  String get exportFileNameFormatLabelText => 'Dışa aktarma dosya adı formatı';

  @override
  String get filenameFormatHintText => 'çağrı-kayıtlarım-[%token]';

  @override
  String get filenameFormatLabelText => 'Dosya adı formatı';

  @override
  String get filterText => 'Filtrele';

  @override
  String get getStartedText => 'Başla';

  @override
  String get ghostErrorMessage => 'Hmm. Bir şeyler ters gitti';

  @override
  String get hideText => 'Gizle';

  @override
  String get hintMobileNumberText => '9XXXX XXXX';

  @override
  String get importCallLogsText => 'Çağrı kayıtlarını içe aktar';

  @override
  String get incomingText => 'Gelen';

  @override
  String get logsScreenLabelText => 'Kayıtlar';

  @override
  String get maximumDurationHintText => 'ör: 60';

  @override
  String get maximumDurationLabelText => 'Maks (saniye cinsinden)';

  @override
  String get minimumDurationHintText => 'ör: 0';

  @override
  String get minimumDurationLabelText => 'Min (saniye cinsinden)';

  @override
  String get missedText => 'Cevapsız';

  @override
  String get mobileNumberText => 'Mobil Numara';

  @override
  String get nextText => 'İleri';

  @override
  String get onboardingScreenFourSubtitle =>
      'Çağrı kayıtlarını cihazlar arasında sorunsuzca aktarın veya analiz ve saklama için dışa aktarın.';

  @override
  String get onboardingScreenFourTitle => 'İçe Aktar & Dışa Aktar';

  @override
  String get onboardingScreenOneSubtitle =>
      'Çağrı kayıtlarınızı zahmetsizce yönetmek ve analiz etmek için başvuracağınız uygulama.';

  @override
  String get onboardingScreenOneTitle => 'Logger\'a Hoş Geldiniz!';

  @override
  String get onboardingScreenThreeSubtitle =>
      'Çağrı alışkanlıklarınızı daha önce hiç olmadığı gibi anlayın ve zamanınızı optimize etmek için detaylı bilgiler edinin.';

  @override
  String get onboardingScreenThreeTitle => 'Çağrılarınızı Analiz Edin';

  @override
  String get onboardingScreenTwoSubtitle =>
      'Çağrı kayıtlarınızı sezgisel ve akıcı bir arayüzle arayın, filtreleyin ve yönetin.';

  @override
  String get onboardingScreenTwoTitle => 'Çağrı Kayıtlarını Yönet';

  @override
  String get openText => 'Aç';

  @override
  String get outgoingText => 'Giden';

  @override
  String get phoneAccountIdText => 'Telefon Hesap Kimliği';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => 'Platform';

  @override
  String get randomDTRepr => 'Cum, Tem 12 2024 14:15:00';

  @override
  String get randomMonthAbbr => 'Tem';

  @override
  String get randomMonthName => 'Temmuz';

  @override
  String get randomWeekdayAbbr => 'Cum';

  @override
  String get randomWeekdayName => 'Cuma';

  @override
  String get refreshText => 'Yenile';

  @override
  String get rejectedText => 'Reddedilmiş';

  @override
  String get reportIssueButtonText => 'Sorun veya Hata Bildir';

  @override
  String get resetText => 'Sıfırla';

  @override
  String get resetToDefaultText => 'Varsayılana Sıfırla';

  @override
  String get saveText => 'Kaydet';

  @override
  String get settingsScreenLabelText => 'Ayarlar';

  @override
  String get shareText => 'Paylaş';

  @override
  String get simText => 'SIM Görüntüleme Adı';

  @override
  String get skipText => 'Atla';

  @override
  String get startImportText => 'İçe Aktarmayı Başlat';

  @override
  String get storagePolicyLabelText => 'Depolama Politikası';

  @override
  String get storagePolicyText =>
      'Bu uygulama, oluşturulan dosyaları geçici olarak depolar ve çıkışta siler. Çağrı kayıtlarını seçtiğiniz konuma indirebilirsiniz. Logger yalnızca çağrı kayıtlarına erişir ve gizliliğinizi korur.';

  @override
  String get supportedFormatInformation =>
      'Lütfen dikkat: Şu anda yalnızca CSV formatı çağrı kayıtlarını içe aktarmak için desteklenmektedir.';

  @override
  String get timeText => 'Zaman';

  @override
  String get tokenAccordianText => 'Tarih ve zaman biçimlendirme token\'ları';

  @override
  String get tokensInfoText =>
      'Dosya adı formatınızı belirli tarih ve zaman tercihlerine göre özelleştirmek için sağlanan token\'ları kullanabilirsiniz.';

  @override
  String get unknownText => 'Bilinmeyen';

  @override
  String get versionText => 'Sürüm';

  @override
  String get viewText => 'Görüntüle';

  @override
  String get wifiIncomingText => 'WiFi Gelen';

  @override
  String get wifiOutgoingText => 'WiFi Giden';

  @override
  String get callStatsText => 'Çağrı İstatistikleri';

  @override
  String get callDurationText => 'Çağrı Süresi';

  @override
  String get mostCalledNumberText => 'En Çok Aranan Numara';

  @override
  String get callDirectionAnalysisText => 'Çağrı Yönü Analizi';

  @override
  String get longestCallText => 'En Uzun Çağrı';

  @override
  String topNLongestCalls(int n) {
    return 'En Uzun $n Çağrı';
  }

  @override
  String get callText => 'Ara';

  @override
  String get smsText => 'SMS';

  @override
  String get nothingToDisplayText => 'Görüntülenecek bir şey yok';

  @override
  String get callsMadeText => 'Yapılan Çağrılar';

  @override
  String get callsReceivedText => 'Alınan Çağrılar';

  @override
  String get callsMissedText => 'Cevapsız Çağrılar';

  @override
  String get callsRejectedText => 'Reddedilen Çağrılar';

  @override
  String get callsBlockedText => 'Engellenen Çağrılar';

  @override
  String get averageText => 'Ortalama';

  @override
  String get longestText => 'En Uzun';

  @override
  String get totalText => 'Toplam';

  @override
  String get todayText => 'Bugün';

  @override
  String get yesterdayText => 'Dün';

  @override
  String get thisMonthText => 'Bu Ay';

  @override
  String get pastMonthText => 'Geçen Ay';

  @override
  String get thisYearText => 'Bu Yıl';

  @override
  String get pastYearText => 'Geçen Yıl';

  @override
  String get allTimeText => 'Tüm Zamanlar';

  @override
  String get customText => 'Özel';

  @override
  String get startDateText => 'Başlangıç Tarihi';

  @override
  String get endDateText => 'Bitiş Tarihi';

  @override
  String get dateRangeText => 'Tarih Aralığı';

  @override
  String get searchByNumberText => 'Belirli Telefon Numarasına Göre Ara';

  @override
  String get phoneAccountIdFilterText => 'Telefon Hesap Kimliği';

  @override
  String get filterByDurationText => 'Çağrı Süresine Göre Filtrele';

  @override
  String get filterByCallTypeText => 'Çağrı Türüne Göre Filtrele';

  @override
  String get answeredExternallyText => 'Harici Olarak Yanıtlandı';

  @override
  String get voiceMailText => 'Sesli Posta';

  @override
  String get exportOpenHintText => 'Dışa Aktar Açık';

  @override
  String get anyText => 'Herhangi';

  @override
  String get processingFileText => 'Dosya işleniyor';

  @override
  String get insertingLogsText => 'Kayıtlar ekleniyor';

  @override
  String get takingMoreTimeText => 'Bu daha uzun sürebilir';

  @override
  String get pleaseWaitText => 'Lütfen bekleyin';

  @override
  String get importSuccessMessageText =>
      'Çağrı kayıtları başarıyla içe aktarıldı';

  @override
  String get failedToUpdateSettingsText =>
      'Ayarlar güncellenemedi. Lütfen daha sonra tekrar deneyin';

  @override
  String get shareSettingUpdateSuccessMsgText =>
      'Paylaşım ayarları başarıyla güncellendi.';

  @override
  String get downloadSettingUpdatedSuccessMsgText =>
      'İndirme ayarları başarıyla güncellendi.';

  @override
  String get settingUpdateSuccessMsgText => 'Ayar başarıyla güncellendi.';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText =>
      'Süre filtresi ayarları başarıyla güncellendi.';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      'Telefon hesap kimliğine göre filtreleme ayarları başarıyla güncellendi.';

  @override
  String get generalSettingUpdatedSuccessMsgText =>
      'Ayarlar başarıyla güncellendi.';

  @override
  String get importSettingUpdatedSuccessMsgText =>
      'İçe aktarma ayarları başarıyla güncellendi.';

  @override
  String get exportFieldInfoText => 'Dışa aktarma alanları bilgisi';

  @override
  String get csvJsonExportNameField => 'Çağrı kaydı girişiyle ilişkili isim';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      'Çağrıyla ilişkili telefon hesap kimliği, çağrıyı yapmak veya almak için kullanılan belirli hesabı veya SIM kartını tanımlar';

  @override
  String get csvJsonExportCallTypeField =>
      'Çağrı türü (ör. gelen, giden, cevapsız)';

  @override
  String get csvJsonExportNumberField =>
      'Çağrı kaydı girişiyle ilişkili telefon numarası';

  @override
  String get csvJsonExportFormattedNumberField =>
      'Biçimlendirilmiş telefon numarası';

  @override
  String get csvJsonExportSimDisplayField =>
      'Çağrıyla ilişkili SIM kartının görüntüleme adı';

  @override
  String get csvJsonExportTimestampField =>
      'Çağrının zaman damgası (epoch zamanı)';

  @override
  String get csvJsonExportDurationField => 'Çağrının saniye cinsinden süresi';

  @override
  String get csvJsonExportCachedNumberLabelField =>
      'Önbelleğe alınmış telefon numarasıyla ilişkili etiket';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      'Önbelleğe alınmış numara türü (Ev, İş vb.)';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      'Çağrı kaydı girişiyle ilişkili saklanan veya önbelleğe alınmış telefon numarası';

  @override
  String get exportFieldInfoHintText => 'Dışa Aktarma Alanları Bilgisi';

  @override
  String get naText => 'yok';

  @override
  String get confirmDownloadText => 'İndirmeyi Onayla';

  @override
  String get mostReceivedNumberText => 'En Çok Alınan Numara';

  @override
  String get confirmContactsSyncLabelText =>
      'Kişileri Senkronize Etmeyi Onayla';

  @override
  String get confirmContactsSyncConfirmationText =>
      'Bu işlem, çağrı kayıtlarınızı tarayacak ve eksik kişi adlarını kaydedilmiş kişilerinizle eşleştirerek güncelleyecektir. Çağrı geçmişinizdeki diğer detaylar değiştirilmeyecektir.';

  @override
  String get contactsSyncSuccessMessageText =>
      'Kişiler, çağrı kayıtlarıyla başarıyla senkronize edildi';

  @override
  String get contactsSyncErrorMessageText =>
      'Kişiler senkronize edilirken hata oluştu!';

  @override
  String get contactsPermissionDenied => 'Kişilere erişim izni reddedildi!';

  @override
  String get syncContactsLabelText => 'Çağrı Kayıt Kişilerini Senkronize Et';

  @override
  String get syncContactsCTAText => 'Şimdi Senkronize Et';

  @override
  String get softwareInformationText => 'Yazılım Bilgisi';

  @override
  String get addToContactsText => 'Kişilere Ekle';

  @override
  String get addToContactsErrorText => 'Yeni kişi eklenemedi';

  @override
  String get appPermissionsDeniedError =>
      'Ah! Görünüşe göre çağrı kayıtlarına erişim izni reddedildi. Logger\'ın sorunsuz çalışması için lütfen izin verin.';

  @override
  String get appFatalError => 'Ah, beklenmedik bir şey oldu!';

  @override
  String get appPreferencesError => 'Ah! Tercihler yüklenirken hata oluştu';

  @override
  String get uriPermissionError => 'İzinler alınamadı';

  @override
  String get fileGenerationError =>
      'Dosya oluşturulurken bir hata oluştu. Lütfen daha sonra tekrar deneyin';

  @override
  String get fileShareMessage =>
      'Çağrı kayıtları dosyasını Gmail, WhatsApp vb. üzerinden paylaşın...';

  @override
  String get fileShareSubject => 'Çağrı Kayıtları';

  @override
  String get fileOpenError =>
      'Dosya açılamadı, lütfen daha sonra tekrar deneyin';

  @override
  String get openingFileLabel => 'Dosya açılıyor';

  @override
  String get viewContactLabel => 'Kişiyi Görüntüle';

  @override
  String get errorOpeningContact => 'Kişi açılırken hata oluştu';

  @override
  String get waLaunchError => 'WhatsApp başlatılamadı';

  @override
  String get closeText => 'Kapat';

  @override
  String get defaultPresetName => 'VarsayılanÖnAyar';

  @override
  String get onLabel => 'Açık';

  @override
  String get offLabel => 'Kapalı';

  @override
  String get filterPresetTitle => 'Filtre ön ayarları';

  @override
  String get addMorePresetsLabel => 'Ön ayar ekle';

  @override
  String get deleteAllPresetsLabel => 'Tümünü sil';

  @override
  String get enablePresetsPlaceholderText =>
      'Hızlı çağrı kaydı özelleştirmesi için birden fazla filtreyi kolayca oluşturmak ve aralarında geçiş yapmak için ön ayarları etkinleştirin.';

  @override
  String get noPresetsPlaceholderText =>
      'Hızlı filtreleme için kendi özel ön ayarlarınızı oluşturmaya başlayın';

  @override
  String get presetNameInputLabelText => 'Ön Ayar Adı';

  @override
  String get presetNameInputHintText => 'Ön ayar için bir isim girin';

  @override
  String get defaultLabelText => 'varsayılan';

  @override
  String get lastCallText => 'Son arama';

  @override
  String get groupByContactAndTypeTitle => 'Kişi ve Türüne Göre Grupla';

  @override
  String get groupByContactAndTypeDescription =>
      'Aramalar, kişi ve arama türüne göre gruplanır';

  @override
  String get groupByContactOnlyConsecutiveTitle =>
      'Ardışık Kişilere Göre Grupla';

  @override
  String get groupByContactOnlyConsecutiveDescription =>
      'Aynı kişiden gelen ardışık aramaları tek bir grup halinde birleştirir';

  @override
  String get groupByContactOnlyTitle => 'Kişiye Göre Grupla';

  @override
  String get groupByContactOnlyDescription =>
      'Aynı kişiden gelen tüm aramaları grupla';

  @override
  String get groupByNoneDescription =>
      'Gruplama yok — her arama ayrı gösterilir';

  @override
  String get callGroupingText => 'Çağrı Gruplama';

  @override
  String get useGroupingSwitchText => 'Filtrelerle Gruplamayı Kullan';

  @override
  String get clearFiltersTooltip => 'Filtreleri temizle';

  @override
  String get scrollToTopTooltip => 'Başa kaydır';

  @override
  String get watchListText => 'İzleme listesi';

  @override
  String get roundDurationText => 'Aramaları dakikaya yuvarla';

  @override
  String get roundDurationTextSubtitle =>
      'Faturalama için aramaları en yakın dakikaya yuvarlayın';

  @override
  String get groupedCallSettingSubtitle =>
      'Daha kolay takip ve genel bakış için aramaları nasıl gruplayacağınızı seçin';

  @override
  String get filterPresetsSettingSubtitle =>
      'Aramaları kolayca bulmak için filtreler oluşturun, kaydedin ve yeniden kullanın';

  @override
  String get exportFilenameSettingSubtitle =>
      'Dışa aktarılan dosyaların adlandırılma şeklini özelleştirin';

  @override
  String get exportFormatSettingSubtitle =>
      'Dışa aktarılan çağrı kayıtları için format seçin';

  @override
  String get importCallLogsSettingSubtitle =>
      'Diğer kaynaklardan veya yedeklerden çağrı geçmişini içe aktar';

  @override
  String get appDetailsText => 'Uygulama Bilgileri & Detaylar';

  @override
  String get appDetailsSubText => 'Sürüm • Bağış • Hata Bildirimi';

  @override
  String get enableDownloadConfirmationText => 'İndirimi Onayla';

  @override
  String get enableDownloadConfirmationSubText =>
      'Dosya indirmeden önce onay iste';

  @override
  String get enableCallDurationFilteringText => 'Süreye göre filtreleme';

  @override
  String get enableCallDurationFilteringSubText =>
      'Çağrıları süresine göre filtrele';

  @override
  String get enableCallLogCountVisibilityText => 'Çağrı sayısı';

  @override
  String get enableCallLogCountVisibilitySubText =>
      'Her gün yapılan çağrı sayısını göster';

  @override
  String get enableFilterByAccountIdText => 'Hesap ID\'sine göre filtrele';

  @override
  String get enableFilterByAccountIdSubText =>
      'Belirli bir SIM veya hesap için çağrıları göster';

  @override
  String get showTotalCallDurationText => 'Toplam çağrı süresi';

  @override
  String get showTotalCallDurationSubText =>
      'Çağrılarda geçirilen toplam süreyi göster';

  @override
  String get disableLogsSharingText => 'Paylaşım butonunu gizle';

  @override
  String get disableLogsSharingSubText =>
      'Çağrı kayıtlarında paylaşım butonunu gizle';

  @override
  String get trackListLabelText => 'Takip Listesi';

  @override
  String get tracklistPlaceholderText =>
      'Takip listenizi verimli bir şekilde yönetin. Numara eklemek için sağ üstteki + simgesine dokunun, bir liste öğesini sola kaydırın ve Takibi Kaldır\'a dokunarak takipten çıkarın.';

  @override
  String get removeAllText => 'hepsini kaldır';

  @override
  String get trackContactLabelText => 'Telefon Numarası';

  @override
  String get trackContactText => 'Bir Kişiyi Takip Et';

  @override
  String get removeText => 'Kaldır';

  @override
  String get iteractionScoreText => 'Etkileşim Skoru';

  @override
  String get lastCallSinceText => 'Son aramadan bu yana';

  @override
  String get avgCallsMonthText => 'Ortalama Aramalar / Ay';

  @override
  String get avgCallDurationText => 'Ortalama Arama Süresi';

  @override
  String get peakCallDurationText => 'En Uzun Arama Süresi';

  @override
  String get callsPerWeekText => 'Ortalama Aramalar / Hafta';

  @override
  String get callDistByWeekDay => 'Haftanın Günlerine Göre Arama Dağılımı (%)';

  @override
  String addToTrackList(Object maxItems) {
    return 'Kolay takip için takip listenize en fazla $maxItems kişi ekleyin.';
  }

  @override
  String get addText => 'Ekle';

  @override
  String get numberAlreadyAddedErrorText => 'Numara zaten eklendi';

  @override
  String get invalidNumberErrorText => 'Geçersiz telefon numarası';

  @override
  String get emptyPhoneNumberErrorText => 'Lütfen bir telefon numarası girin';

  @override
  String get trackNumberErrorText =>
      'Yeni takip kişisi eklenirken bir hata oluştu';

  @override
  String get quickFilterText => 'Hızlı filtre';
}
