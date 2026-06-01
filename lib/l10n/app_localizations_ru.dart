// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get aboutText => 'O программе';

  @override
  String get advancedSettingsLabelText => 'Расширенные настройки';

  @override
  String get analyticsPolicyLabelText => 'Политика аналитики';

  @override
  String get analyticsPolicyText =>
      'Bce данные журнала вызовов анализируются локально на вашем устройстве и никогда не передаются на онлайн-серверы, что обеспечивает вашу конфиденциальность и безопасность вашей информации';

  @override
  String get analyticsScreenLabelText => 'Аналитика';

  @override
  String get appError => 'Ой! Что-то пошло не так';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => 'Применить фильтры';

  @override
  String get baseGhostErrorMessage => 'Что-то пошло не так';

  @override
  String get baseSettingsLabelText => 'Общие настройки';

  @override
  String get blockedText => 'Заблокированные';

  @override
  String get callLogsExportFailureText => 'Ошибка при загрузке файла!';

  @override
  String get callLogsExportFormatLabelText => 'Формат экспорта журнала вызовов';

  @override
  String get callLogsExportSuccessText =>
      'Журнал вызовов успешно извлечен и загружен';

  @override
  String get callTypeText => 'Тип вызова';

  @override
  String get cancelText => 'Отмена';

  @override
  String get configureText => 'Настроить';

  @override
  String get confirmImportLabelText => 'Подтвердить начало импорта';

  @override
  String get confirmImportText =>
      'Импорт журналов вызовов — это важная задача, которая может необратимо повредить ваши текущие журналы, перезаписать данные и вызвать несоответствия в вашей истории. Пожалуйста, имейте в виду, что этот процесс может занять некоторое время и привести к вышеупомянутым проблемам. Продолжайте c осторожностью.';

  @override
  String get continueText => 'Продолжить';

  @override
  String get dateText => 'Дата';

  @override
  String get donateText => 'Пожертвовать';

  @override
  String downloadConfirmationText(String currentImportType) {
    return 'Вы уверены, что хотите загрузить свой журнал вызовов в формате $currentImportType? Это действие сохранит вашу историю вызовов в файл $currentImportType на вашем устройстве.';
  }

  @override
  String get downloadText => 'Загрузить';

  @override
  String get dtAAcronymExapandedText => 'Полное название дня недели';

  @override
  String get dtBAcronymExapandedText => 'Полное название месяца';

  @override
  String get dtHAcronymExapandedText => 'Час в 24-часовом формате';

  @override
  String get dtIAcronymExapandedText => 'Час в 12-часовом формате';

  @override
  String get dtMAcronymExapandedText => 'Минуты';

  @override
  String get dtSAcronymExapandedText => 'Секунды';

  @override
  String get dtUAcronymExapandedText =>
      'Номер недели в году (воскресенье как первый день недели)';

  @override
  String get dtWAcronymExapandedText =>
      'Номер недели в году (понедельник как первый день недели)';

  @override
  String get dtXAcronymExapandedText => 'Представление времени';

  @override
  String get dtYAcronymExapandedText => 'Год c веком';

  @override
  String get dtZAcronymExapandedText => 'Название часового пояса';

  @override
  String get dtaAcronymExapandedText => 'Сокращенное название дня недели';

  @override
  String get dtbAcronymExapandedText => 'Сокращенное название месяца';

  @override
  String get dtcAcronymExapandedText => 'Представление даты и времени';

  @override
  String get dtdAcronymExapandedText => 'День месяца';

  @override
  String get dtfAcronymExapandedText => 'Миллисекунды';

  @override
  String get dtjAcronymExapandedText => 'День года';

  @override
  String get dtmAcronymExapandedText => 'Месяц в виде числа';

  @override
  String get dtpAcronymExapandedText => 'AM/PM маркер';

  @override
  String get dtxAcronymExapandedText => 'Представление даты';

  @override
  String get dtyAcronymExapandedText => 'Год без века';

  @override
  String get dtzAcronymExapandedText => 'Смещение часового пояса от UTC';

  @override
  String get durationText => 'Длительность';

  @override
  String get exploreNowText => 'Изучить сейчас';

  @override
  String get exploreProjectButtonText => 'Изучить проект на Github';

  @override
  String get exportFileNameFormatLabelText => 'Формат имени файла экспорта';

  @override
  String get filenameFormatHintText => 'мои-журналы-вызовов-[%token]';

  @override
  String get filenameFormatLabelText => 'Формат имени файла';

  @override
  String get filterText => 'Фильтр';

  @override
  String get getStartedText => 'Начать';

  @override
  String get ghostErrorMessage => 'Хм. Что-то пошло не так';

  @override
  String get hideText => 'Скрыть';

  @override
  String get hintMobileNumberText => '9XX XXXX XXX';

  @override
  String get importCallLogsText => 'Импортировать журналы вызовов';

  @override
  String get incomingText => 'Входящий';

  @override
  String get logsScreenLabelText => 'Журналы';

  @override
  String get maximumDurationHintText => 'например: 60';

  @override
  String get maximumDurationLabelText => 'Макс (в сек)';

  @override
  String get minimumDurationHintText => 'например: 0';

  @override
  String get minimumDurationLabelText => 'Мин (в сек)';

  @override
  String get missedText => 'Пропущенные';

  @override
  String get mobileNumberText => 'Номер телефона';

  @override
  String get nextText => 'Далее';

  @override
  String get onboardingScreenFourSubtitle =>
      'Легко переносите журналы вызовов между устройствами или экспортируйте их для сохранности и анализа.';

  @override
  String get onboardingScreenFourTitle => 'Импорт и экспорт';

  @override
  String get onboardingScreenOneSubtitle =>
      'Ваше приложение для управления и анализа журналов вызовов без усилий.';

  @override
  String get onboardingScreenOneTitle => 'Добро пожаловать в Logger!';

  @override
  String get onboardingScreenThreeSubtitle =>
      'Поймите свои шаблоны вызовов как никогда раньше и получите подробную аналитику для оптимизации своего времени.';

  @override
  String get onboardingScreenThreeTitle => 'Анализируйте свои вызовы';

  @override
  String get onboardingScreenTwoSubtitle =>
      'Поиск, фильтрация и управление журналами вызовов c помощью удобного и интуитивно понятного интерфейса.';

  @override
  String get onboardingScreenTwoTitle => 'Управление журналами вызовов';

  @override
  String get openText => 'Открыть';

  @override
  String get outgoingText => 'Исходящий';

  @override
  String get phoneAccountIdText => 'Идентификатор учетной записи телефона';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => 'платформа';

  @override
  String get randomDTRepr => 'Пт, 12 июл 2024 14:15:00';

  @override
  String get randomMonthAbbr => 'Июл';

  @override
  String get randomMonthName => 'Июль';

  @override
  String get randomWeekdayAbbr => 'Пт';

  @override
  String get randomWeekdayName => 'Пятница';

  @override
  String get refreshText => 'Обновить';

  @override
  String get rejectedText => 'Отклоненные';

  @override
  String get reportIssueButtonText => 'Сообщить o проблеме или ошибке';

  @override
  String get resetText => 'Сбросить';

  @override
  String get resetToDefaultText => 'Сбросить до значений по умолчанию';

  @override
  String get saveText => 'Сохранить';

  @override
  String get settingsScreenLabelText => 'Настройки';

  @override
  String get shareText => 'Поделиться';

  @override
  String get simText => 'Имя SIM-карты';

  @override
  String get skipText => 'Пропустить';

  @override
  String get startImportText => 'Начать импорт';

  @override
  String get storagePolicyLabelText => 'Политика хранения';

  @override
  String get storagePolicyText =>
      'Это приложение временно хранит созданные файлы, удаляя их при выходе. Вы можете загрузить журналы вызовов в выбранное вами место. Logger имеет доступ только к журналам вызовов, обеспечивая вашу конфиденциальность.';

  @override
  String get supportedFormatInformation =>
      'Обратите внимание: для импорта журналов вызовов в настоящее время поддерживается только формат CSV.';

  @override
  String get timeText => 'Время';

  @override
  String get tokenAccordianText => 'токены форматирования даты и времени';

  @override
  String get tokensInfoText =>
      'Вы можете использовать предоставленные токены для настройки формата имени файла на основе конкретных предпочтений даты и времени.';

  @override
  String get unknownText => 'Неизвестно';

  @override
  String get versionText => 'версия';

  @override
  String get viewText => 'Просмотреть';

  @override
  String get wifiIncomingText => 'Wifi Входящий';

  @override
  String get wifiOutgoingText => 'Wifi Исходящий';

  @override
  String get callStatsText => 'Статистика звонков';

  @override
  String get callDurationText => 'Продолжительность звонка';

  @override
  String get mostCalledNumberText => 'Самый вызываемый номер';

  @override
  String get callDirectionAnalysisText => 'Анализ направления вызовов';

  @override
  String get longestCallText => 'Самый длинный звонок';

  @override
  String topNLongestCalls(int n) {
    return 'Топ $n самых длинных вызовов';
  }

  @override
  String get callText => 'Звонок';

  @override
  String get smsText => 'SMS';

  @override
  String get nothingToDisplayText => 'Нет данных для отображения';

  @override
  String get callsMadeText => 'Совершено звонков';

  @override
  String get callsReceivedText => 'Получено звонков';

  @override
  String get callsMissedText => 'Пропущено звонков';

  @override
  String get callsRejectedText => 'Отклонено звонков';

  @override
  String get callsBlockedText => 'Заблокировано звонков';

  @override
  String get averageText => 'Среднее';

  @override
  String get longestText => 'Самый длинный';

  @override
  String get totalText => 'Bcero';

  @override
  String get todayText => 'Сегодня';

  @override
  String get yesterdayText => 'Вчера';

  @override
  String get thisMonthText => 'Этот месяц';

  @override
  String get pastMonthText => 'Прошлый месяц';

  @override
  String get thisYearText => 'Этот год';

  @override
  String get pastYearText => 'Прошлый год';

  @override
  String get allTimeText => 'Bce время';

  @override
  String get customText => 'Пользовательский';

  @override
  String get startDateText => 'Дата начала';

  @override
  String get endDateText => 'Дата окончания';

  @override
  String get dateRangeText => 'Диапазон дат';

  @override
  String get searchByNumberText => 'Конкретный номер телефона';

  @override
  String get phoneAccountIdFilterText =>
      'Идентификатор учетной записи телефона';

  @override
  String get filterByDurationText => 'Фильтр по продолжительности звонка';

  @override
  String get filterByCallTypeText => 'Тип вызова';

  @override
  String get answeredExternallyText => 'Отвечено извне';

  @override
  String get voiceMailText => 'Голосовая почта';

  @override
  String get exportOpenHintText => 'Экспорт Открыть';

  @override
  String get anyText => 'Любой';

  @override
  String get processingFileText => 'Обработка файла';

  @override
  String get insertingLogsText => 'Вставка журналов';

  @override
  String get takingMoreTimeText => 'Это может занять больше времени';

  @override
  String get pleaseWaitText => 'Пожалуйста, подождите';

  @override
  String get importSuccessMessageText =>
      'Журналы вызовов успешно импортированы';

  @override
  String get failedToUpdateSettingsText =>
      'He удалось обновить настройки. Пожалуйста, повторите попытку позже';

  @override
  String get shareSettingUpdateSuccessMsgText =>
      'Настройки общего доступа успешно обновлены.';

  @override
  String get downloadSettingUpdatedSuccessMsgText =>
      'Настройки загрузки успешно обновлены.';

  @override
  String get settingUpdateSuccessMsgText => 'Настройки успешно обновлены.';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText =>
      'Настройки фильтрации по длительности успешно обновлены.';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      'Настройки фильтрации по идентификатору учетной записи телефона успешно обновлены.';

  @override
  String get generalSettingUpdatedSuccessMsgText =>
      'Настройки успешно обновлены.';

  @override
  String get importSettingUpdatedSuccessMsgText =>
      'Настройки импорта успешно обновлены.';

  @override
  String get exportFieldInfoText => 'Информация o полях экспорта';

  @override
  String get csvJsonExportNameField =>
      'Имя, связанное c записью журнала вызовов';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      'Идентификатор учетной записи телефона, связанный c вызовом, идентифицирует конкретную учетную запись или SIM-карту, использованную для совершения или приема вызова';

  @override
  String get csvJsonExportCallTypeField =>
      'Тип вызова (например, входящий, исходящий, пропущенный)';

  @override
  String get csvJsonExportNumberField =>
      'Номер телефона, связанный c записью журнала вызовов';

  @override
  String get csvJsonExportFormattedNumberField =>
      'Форматированный номер телефона, отформатированный c правилами форматирования, основанными на стране, в которой пользователь находился во время совершения или приема вызова.';

  @override
  String get csvJsonExportSimDisplayField =>
      'Отображаемое имя SIM-карты, связанной c вызовом';

  @override
  String get csvJsonExportTimestampField =>
      'Метка времени (время эпохи) вызова';

  @override
  String get csvJsonExportDurationField =>
      'Продолжительность вызова в секундах';

  @override
  String get csvJsonExportCachedNumberLabelField =>
      'Метка, связанная c кэшированным номером телефона';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      'Тип кэшированного номера (дом, работа и т. д.), связанный c номером телефона, если он существует.';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      'Сохраненный или кэшированный номер телефона, связанный c записью журнала вызовов для быстрого доступа.';

  @override
  String get exportFieldInfoHintText => 'Информация o полях экспорта';

  @override
  String get naText => 'не предпринято';

  @override
  String get confirmDownloadText => 'Подтвердить загрузку';

  @override
  String get mostReceivedNumberText => 'Самый часто принятый номер';

  @override
  String get confirmContactsSyncLabelText =>
      'Подтвердите синхронизацию контактов';

  @override
  String get confirmContactsSyncConfirmationText =>
      'Этот процесс сканирует ваши журналы вызовов и обновляет отсутствующие имена контактов, сопоставляя их c вашими сохраненными контактами. Он не изменит другие детали в вашей истории вызовов.';

  @override
  String get contactsSyncSuccessMessageText =>
      'Контакты успешно синхронизированы c журналами вызовов';

  @override
  String get contactsSyncErrorMessageText =>
      'Ошибка при синхронизации контактов!';

  @override
  String get contactsPermissionDenied => 'Доступ к контактам отклонен!';

  @override
  String get syncContactsLabelText =>
      'Синхронизировать контакты журнала вызовов';

  @override
  String get syncContactsCTAText => 'Синхронизировать сейчас';

  @override
  String get softwareInformationText => 'Информация o программном обеспечении';

  @override
  String get addToContactsText => 'Добавить в контакты';

  @override
  String get addToContactsErrorText => 'He удалось добавить новый контакт';

  @override
  String get appPermissionsDeniedError =>
      'Ой! Похоже, доступ к журналам вызовов был запрещен. Чтобы Logger работал бесперебойно, пожалуйста, предоставьте разрешение.';

  @override
  String get appFatalError => 'Ой, нет! Произошло что-то неожиданное!';

  @override
  String get appPreferencesError => 'Ой, нет! Ошибка загрузки настроек.';

  @override
  String get uriPermissionError => 'He удалось получить разрешения';

  @override
  String get fileGenerationError =>
      'Ошибка при создании файла. Попробуйте позже';

  @override
  String get fileShareMessage =>
      'Поделитесь файлом журнала вызовов через Gmail, WhatsApp и др...';

  @override
  String get fileShareSubject => 'Журнал вызовов';

  @override
  String get fileOpenError => 'He удалось открыть файл, попробуйте позже';

  @override
  String get openingFileLabel => 'Открытие файла';

  @override
  String get viewContactLabel => 'Просмотреть контакт';

  @override
  String get errorOpeningContact => 'Ошибка открытия контакта';

  @override
  String get waLaunchError => 'He удалось запустить WhatsApp';

  @override
  String get closeText => 'Закрыть';

  @override
  String get defaultPresetName => 'Предустановка по умолчанию';

  @override
  String get onLabel => 'Включено';

  @override
  String get offLabel => 'Выключено';

  @override
  String get filterPresetTitle => 'Предустановки фильтров';

  @override
  String get addMorePresetsLabel => 'Добавить пресет';

  @override
  String get deleteAllPresetsLabel => 'удалить всё';

  @override
  String get enablePresetsPlaceholderText =>
      'Включите предустановки, чтобы легко создавать и переключаться между несколькими фильтрами для быстрой настройки журнала вызовов.';

  @override
  String get noPresetsPlaceholderText =>
      'Начните создавать свои собственные предустановки для быстрого фильтрования';

  @override
  String get presetNameInputLabelText => 'Название предустановки';

  @override
  String get presetNameInputHintText => 'Введите название предустановки';

  @override
  String get defaultLabelText => 'По умолчанию';

  @override
  String get lastCallText => 'Последний звонок';

  @override
  String get groupByContactAndTypeTitle => 'Группировать по контакту и типу';

  @override
  String get groupByContactAndTypeDescription =>
      'Звонки группируются по контакту и типу звонка';

  @override
  String get groupByContactOnlyConsecutiveTitle =>
      'Группировать по последовательным контактам';

  @override
  String get groupByContactOnlyConsecutiveDescription =>
      'Объединяет последовательные звонки от одного контакта в одну группу';

  @override
  String get groupByContactOnlyTitle => 'Группировать по контакту';

  @override
  String get groupByContactOnlyDescription =>
      'Группирует все звонки от одного контакта';

  @override
  String get groupByNoneDescription =>
      'Без группировки — каждый звонок отображается отдельно';

  @override
  String get callGroupingText => 'Группировка звонков';

  @override
  String get useGroupingSwitchText => 'Использовать группировку с фильтрами';

  @override
  String get clearFiltersTooltip => 'Очистить фильтры';

  @override
  String get scrollToTopTooltip => 'Прокрутить вверх';

  @override
  String get watchListText => 'Список наблюдения';

  @override
  String get roundDurationText =>
      'Округлять продолжительность звонков до минут';

  @override
  String get roundDurationTextSubtitle =>
      'Округляйте звонки до ближайшей минуты для расчета оплаты';

  @override
  String get groupedCallSettingSubtitle =>
      'Выберите, как группировать звонки для удобного отслеживания и обзора';

  @override
  String get filterPresetsSettingSubtitle =>
      'Создавайте, сохраняйте и повторно используйте фильтры для быстрого поиска звонков';

  @override
  String get exportFilenameSettingSubtitle =>
      'Настройте, как будут называться экспортируемые файлы';

  @override
  String get exportFormatSettingSubtitle =>
      'Выберите формат экспортируемых журналов звонков';

  @override
  String get importCallLogsSettingSubtitle =>
      'Импортировать историю звонков из других источников или резервных копий';

  @override
  String get appDetailsText => 'Информация о приложении и детали';

  @override
  String get appDetailsSubText => 'Версия • Пожертвовать • Сообщить о баге';

  @override
  String get enableDownloadConfirmationText => 'Подтвердить загрузку';

  @override
  String get enableDownloadConfirmationSubText =>
      'Запрос подтверждения перед загрузкой файлов';

  @override
  String get enableCallDurationFilteringText => 'Фильтр по длительности';

  @override
  String get enableCallDurationFilteringSubText =>
      'Фильтровать звонки по их длительности';

  @override
  String get enableCallLogCountVisibilityText => 'Количество звонков';

  @override
  String get enableCallLogCountVisibilitySubText =>
      'Показать количество звонков за каждый день';

  @override
  String get enableFilterByAccountIdText => 'Фильтр по ID аккаунта';

  @override
  String get enableFilterByAccountIdSubText =>
      'Показать звонки для конкретной SIM или аккаунта';

  @override
  String get showTotalCallDurationText => 'Общая длительность звонков';

  @override
  String get showTotalCallDurationSubText =>
      'Показать общее время, проведённое в звонках';

  @override
  String get disableLogsSharingText => 'Скрыть кнопку «Поделиться»';

  @override
  String get disableLogsSharingSubText =>
      'Скрыть кнопку «Поделиться» в журнале звонков';

  @override
  String get trackListLabelText => 'Список отслеживания';

  @override
  String get tracklistPlaceholderText =>
      'Эффективно управляйте своим списком отслеживания. Нажмите + (в правом верхнем углу), чтобы добавить номер, проведите влево по элементу списка и нажмите Удалить, чтобы перестать отслеживать.';

  @override
  String get removeAllText => 'удалить всё';

  @override
  String get trackContactLabelText => 'Номер телефона';

  @override
  String get trackContactText => 'Отслеживать контакт';

  @override
  String get removeText => 'Удалить';

  @override
  String get iteractionScoreText => 'Оценка взаимодействия';

  @override
  String get lastCallSinceText => 'Последний звонок с';

  @override
  String get avgCallsMonthText => 'Среднее количество звонков / месяц';

  @override
  String get avgCallDurationText => 'Средняя длительность звонка';

  @override
  String get peakCallDurationText => 'Максимальная длительность звонка';

  @override
  String get callsPerWeekText => 'Среднее количество звонков / неделя';

  @override
  String get callDistByWeekDay => 'Распределение звонков по дням недели (%)';

  @override
  String addToTrackList(Object maxItems) {
    return 'Добавьте до $maxItems контактов в ваш список отслеживания для удобного контроля.';
  }

  @override
  String get addText => 'Добавить';

  @override
  String get numberAlreadyAddedErrorText => 'Номер уже добавлен';

  @override
  String get invalidNumberErrorText => 'Неверный номер телефона';

  @override
  String get emptyPhoneNumberErrorText => 'Введите номер телефона';

  @override
  String get trackNumberErrorText =>
      'Произошла ошибка при добавлении нового контакта для отслеживания';

  @override
  String get quickFilterText => 'Быстрый фильтр';
}
