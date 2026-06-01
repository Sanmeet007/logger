// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get aboutText => '关于';

  @override
  String get advancedSettingsLabelText => '高级设置';

  @override
  String get analyticsPolicyLabelText => '分析政策';

  @override
  String get analyticsPolicyText =>
      '所有通话记录数据均在您的设备本地进行分析，绝不会传输到在线服务器，从而确保您的隐私并保障您的信息安全和机密';

  @override
  String get analyticsScreenLabelText => '分析';

  @override
  String get appError => '糟糕！出错了';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => '应用过滤器';

  @override
  String get baseGhostErrorMessage => '出错了';

  @override
  String get baseSettingsLabelText => '通用设置';

  @override
  String get blockedText => '已阻止';

  @override
  String get callLogsExportFailureText => '下载文件时出错！';

  @override
  String get callLogsExportFormatLabelText => '通话记录导出格式';

  @override
  String get callLogsExportSuccessText => '通话记录已成功提取并下载';

  @override
  String get callTypeText => '通话类型';

  @override
  String get cancelText => '取消';

  @override
  String get configureText => '配置';

  @override
  String get confirmImportLabelText => '确认开始导入';

  @override
  String get confirmImportText =>
      '导入通话记录是一项重要任务，可能会不可逆地损坏您当前的记录、覆盖数据并导致历史记录不一致。请注意，此过程可能需要一些时间，并可能导致上述问题。请谨慎操作。';

  @override
  String get continueText => '继续';

  @override
  String get dateText => '日期';

  @override
  String get donateText => '捐赠';

  @override
  String downloadConfirmationText(String currentImportType) {
    return '您确定要以 $currentImportType 格式下载您的通话记录吗？此操作会将您的通话历史记录保存到您设备上的 $currentImportType 文件中。';
  }

  @override
  String get downloadText => '下载';

  @override
  String get dtAAcronymExapandedText => '完整星期名称';

  @override
  String get dtBAcronymExapandedText => '完整月份名称';

  @override
  String get dtHAcronymExapandedText => '24 小时格式的小时';

  @override
  String get dtIAcronymExapandedText => '12 小时格式的小时';

  @override
  String get dtMAcronymExapandedText => '分钟';

  @override
  String get dtSAcronymExapandedText => '秒';

  @override
  String get dtUAcronymExapandedText => '一年中的星期数（星期日为一周的第一天）';

  @override
  String get dtWAcronymExapandedText => '一年中的星期数（星期一为一周的第一天）';

  @override
  String get dtXAcronymExapandedText => '时间表示';

  @override
  String get dtYAcronymExapandedText => '带世纪的年份';

  @override
  String get dtZAcronymExapandedText => '时区名称';

  @override
  String get dtaAcronymExapandedText => '缩写星期名称';

  @override
  String get dtbAcronymExapandedText => '缩写月份名称';

  @override
  String get dtcAcronymExapandedText => '日期和时间表示';

  @override
  String get dtdAcronymExapandedText => '月份中的日';

  @override
  String get dtfAcronymExapandedText => '毫秒';

  @override
  String get dtjAcronymExapandedText => '一年中的日';

  @override
  String get dtmAcronymExapandedText => '月份（数字）';

  @override
  String get dtpAcronymExapandedText => 'AM/PM 标记';

  @override
  String get dtxAcronymExapandedText => '日期表示';

  @override
  String get dtyAcronymExapandedText => '不带世纪的年份';

  @override
  String get dtzAcronymExapandedText => 'UTC 时区偏移';

  @override
  String get durationText => '持续时间';

  @override
  String get exploreNowText => '立即探索';

  @override
  String get exploreProjectButtonText => '在 Github 上探索项目';

  @override
  String get exportFileNameFormatLabelText => '导出文件名格式';

  @override
  String get filenameFormatHintText => '我的通话记录-[%token]';

  @override
  String get filenameFormatLabelText => '文件名格式';

  @override
  String get filterText => '筛选';

  @override
  String get getStartedText => '开始使用';

  @override
  String get ghostErrorMessage => '嗯。出错了';

  @override
  String get hideText => '隐藏';

  @override
  String get hintMobileNumberText => 'XXX XXXX XXXX';

  @override
  String get importCallLogsText => '导入您的通话记录';

  @override
  String get incomingText => '来电';

  @override
  String get logsScreenLabelText => '记录';

  @override
  String get maximumDurationHintText => '例如: 60';

  @override
  String get maximumDurationLabelText => '最大（秒）';

  @override
  String get minimumDurationHintText => '例如: 0';

  @override
  String get minimumDurationLabelText => '分钟（秒）';

  @override
  String get missedText => '未接';

  @override
  String get mobileNumberText => '手机号码';

  @override
  String get nextText => '下一步';

  @override
  String get onboardingScreenFourSubtitle => '在设备之间无缝传输通话记录，或将其导出以进行安全保管和分析。';

  @override
  String get onboardingScreenFourTitle => '导入和导出';

  @override
  String get onboardingScreenOneSubtitle => '您轻松管理和分析通话记录的首选应用。';

  @override
  String get onboardingScreenOneTitle => '欢迎使用 Logger !';

  @override
  String get onboardingScreenThreeSubtitle =>
      '以前所未有的方式了解您的通话模式，并获得详细的见解以优化您的时间。';

  @override
  String get onboardingScreenThreeTitle => '分析您的通话';

  @override
  String get onboardingScreenTwoSubtitle => '通过无缝且直观的界面搜索、筛选和管理您的通话记录。';

  @override
  String get onboardingScreenTwoTitle => '管理通话记录';

  @override
  String get openText => '打开';

  @override
  String get outgoingText => '去电';

  @override
  String get phoneAccountIdText => '电话帐户 ID';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => '平台';

  @override
  String get randomDTRepr => '2024年7月12日星期五 14:15:00';

  @override
  String get randomMonthAbbr => '七月';

  @override
  String get randomMonthName => '七月';

  @override
  String get randomWeekdayAbbr => '周五';

  @override
  String get randomWeekdayName => '星期五';

  @override
  String get refreshText => '刷新';

  @override
  String get rejectedText => '已拒绝';

  @override
  String get reportIssueButtonText => '报告问题或错误';

  @override
  String get resetText => '重置';

  @override
  String get resetToDefaultText => '重置为默认值';

  @override
  String get saveText => '保存';

  @override
  String get settingsScreenLabelText => '设置';

  @override
  String get shareText => '分享';

  @override
  String get simText => 'SIM 卡显示名称';

  @override
  String get skipText => '跳过';

  @override
  String get startImportText => '开始导入';

  @override
  String get storagePolicyLabelText => '存储策略';

  @override
  String get storagePolicyText =>
      '此应用会临时存储生成的文件, 并在退出时将其删除。您可以将通话记录下载到您选择的位置。Logger 仅访问通话记录，确保您的隐私。';

  @override
  String get supportedFormatInformation => '请注意：目前仅支持 CSV 格式导入通话记录。';

  @override
  String get timeText => '时间';

  @override
  String get tokenAccordianText => '日期和时间格式化令牌';

  @override
  String get tokensInfoText => '您可以使用提供的令牌根据特定的日期和时间偏好自定义文件名格式。';

  @override
  String get unknownText => '未知';

  @override
  String get versionText => '版本';

  @override
  String get viewText => '查看';

  @override
  String get wifiIncomingText => '无线网络来电';

  @override
  String get wifiOutgoingText => '无线网络去电';

  @override
  String get callStatsText => '通话统计';

  @override
  String get callDurationText => '通话时长';

  @override
  String get mostCalledNumberText => '最常呼叫的号码';

  @override
  String get callDirectionAnalysisText => '通话方向分析';

  @override
  String get longestCallText => '最长通话';

  @override
  String topNLongestCalls(int n) {
    return '前 $n 个最长通话';
  }

  @override
  String get callText => '通话';

  @override
  String get smsText => '短信';

  @override
  String get nothingToDisplayText => '没有内容可显示';

  @override
  String get callsMadeText => '已拨打的通话';

  @override
  String get callsReceivedText => '已接听的通话';

  @override
  String get callsMissedText => '未接来电';

  @override
  String get callsRejectedText => '已拒绝的通话';

  @override
  String get callsBlockedText => '已阻止的通话';

  @override
  String get averageText => '平均';

  @override
  String get longestText => '最长';

  @override
  String get totalText => '总计';

  @override
  String get todayText => '今天';

  @override
  String get yesterdayText => '昨天';

  @override
  String get thisMonthText => '本月';

  @override
  String get pastMonthText => '上个月';

  @override
  String get thisYearText => '今年';

  @override
  String get pastYearText => '去年';

  @override
  String get allTimeText => '全部';

  @override
  String get customText => '自定义';

  @override
  String get startDateText => '开始日期';

  @override
  String get endDateText => '结束日期';

  @override
  String get dateRangeText => '日期范围';

  @override
  String get searchByNumberText => '特定电话号码';

  @override
  String get phoneAccountIdFilterText => '电话帐户 ID';

  @override
  String get filterByDurationText => '按通话时长筛选';

  @override
  String get filterByCallTypeText => '通话类型';

  @override
  String get answeredExternallyText => '外部接听';

  @override
  String get voiceMailText => '语音信箱';

  @override
  String get exportOpenHintText => '导出打开';

  @override
  String get anyText => '任何';

  @override
  String get processingFileText => '正在处理文件';

  @override
  String get insertingLogsText => '正在插入记录';

  @override
  String get takingMoreTimeText => '这可能需要更长的时间';

  @override
  String get pleaseWaitText => '请稍候';

  @override
  String get importSuccessMessageText => '通话记录已成功导入';

  @override
  String get failedToUpdateSettingsText => '更新设置失败。请稍后再试';

  @override
  String get shareSettingUpdateSuccessMsgText => '共享设置已成功更新。';

  @override
  String get downloadSettingUpdatedSuccessMsgText => '下载设置已成功更新。';

  @override
  String get settingUpdateSuccessMsgText => '设置已成功更新。';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText => '时长筛选设置已成功更新。';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      '按电话帐户 ID 筛选设置已成功更新。';

  @override
  String get generalSettingUpdatedSuccessMsgText => '设置已成功更新。';

  @override
  String get importSettingUpdatedSuccessMsgText => '导入设置已成功更新。';

  @override
  String get exportFieldInfoText => '导出字段信息';

  @override
  String get csvJsonExportNameField => '与通话记录条目关联的名称';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      '与通话关联的电话帐户的 ID，标识用于拨打或接听电话的特定帐户或 SIM 卡';

  @override
  String get csvJsonExportCallTypeField => '通话类型（例如，来电、去电、未接）';

  @override
  String get csvJsonExportNumberField => '与通话记录条目关联的电话号码';

  @override
  String get csvJsonExportFormattedNumberField =>
      '格式化的电话号码，使用用户拨打或接听电话时所在国家/地区的格式规则进行格式化。';

  @override
  String get csvJsonExportSimDisplayField => '与通话关联的 SIM 卡的显示名称';

  @override
  String get csvJsonExportTimestampField => '通话的时间戳（纪元时间）';

  @override
  String get csvJsonExportDurationField => '通话时长（秒）';

  @override
  String get csvJsonExportCachedNumberLabelField => '与缓存的电话号码关联的标签';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      '与电话号码关联的缓存号码类型（家庭、工作等），如果存在。';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      '为快速参考而与通话记录条目关联的存储或缓存的电话号码。';

  @override
  String get exportFieldInfoHintText => '导出字段信息';

  @override
  String get naText => '未尝试';

  @override
  String get confirmDownloadText => '确认下载';

  @override
  String get mostReceivedNumberText => '接听最多的号码';

  @override
  String get confirmContactsSyncLabelText => '确认同步联系人';

  @override
  String get confirmContactsSyncConfirmationText =>
      '此过程将扫描您的通话记录，并更新缺失的联系人姓名，通过与您的已保存联系人匹配。它不会修改您通话历史中的任何其他细节。';

  @override
  String get contactsSyncSuccessMessageText => '联系人已成功与通话记录同步';

  @override
  String get contactsSyncErrorMessageText => '同步联系人时出错！';

  @override
  String get contactsPermissionDenied => '未获得访问联系人权限！';

  @override
  String get syncContactsLabelText => '同步通话记录联系人';

  @override
  String get syncContactsCTAText => '立即同步';

  @override
  String get softwareInformationText => '软件信息';

  @override
  String get addToContactsText => '添加到联系人';

  @override
  String get addToContactsErrorText => '无法添加新联系人';

  @override
  String get appPermissionsDeniedError =>
      '哎呀！似乎访问通话记录被拒绝了。为了确保 Logger 正常工作，请授予权限。';

  @override
  String get appFatalError => '哎呀！发生了意想不到的事情！';

  @override
  String get appPreferencesError => '哎呀！加载偏好设置时出错。';

  @override
  String get uriPermissionError => '无法获取权限';

  @override
  String get fileGenerationError => '生成文件时发生错误，请稍后重试';

  @override
  String get fileShareMessage => '通过 Gmail、WhatsApp 等分享通话记录文件...';

  @override
  String get fileShareSubject => '通话记录';

  @override
  String get fileOpenError => '无法打开文件，请稍后重试';

  @override
  String get openingFileLabel => '正在打开文件';

  @override
  String get viewContactLabel => '查看联系人';

  @override
  String get errorOpeningContact => '打开联系人时出错';

  @override
  String get waLaunchError => '无法启动 WhatsApp';

  @override
  String get closeText => '关闭';

  @override
  String get defaultPresetName => '默认预设';

  @override
  String get onLabel => '开启';

  @override
  String get offLabel => '关闭';

  @override
  String get filterPresetTitle => '过滤器预设';

  @override
  String get addMorePresetsLabel => '添加预设';

  @override
  String get deleteAllPresetsLabel => '删除所有';

  @override
  String get enablePresetsPlaceholderText => '启用预设，以便轻松创建和切换多个过滤器，快速自定义通话记录。';

  @override
  String get noPresetsPlaceholderText => '开始创建您自己的自定义预设，以实现快速过滤';

  @override
  String get presetNameInputLabelText => '预设名称';

  @override
  String get presetNameInputHintText => '输入预设名称';

  @override
  String get defaultLabelText => '默认';

  @override
  String get lastCallText => '最后通话';

  @override
  String get groupByContactAndTypeTitle => '按联系人和类型分组';

  @override
  String get groupByContactAndTypeDescription => '通话按联系人和通话类型分组';

  @override
  String get groupByContactOnlyConsecutiveTitle => '按连续联系人分组';

  @override
  String get groupByContactOnlyConsecutiveDescription => '将同一联系人的连续通话合并为一个组';

  @override
  String get groupByContactOnlyTitle => '按联系人分组';

  @override
  String get groupByContactOnlyDescription => '将同一联系人的所有通话分组';

  @override
  String get groupByNoneDescription => '不分组 — 每个通话单独显示';

  @override
  String get callGroupingText => '通话分组';

  @override
  String get useGroupingSwitchText => '与过滤器一起使用分组';

  @override
  String get clearFiltersTooltip => '清除筛选';

  @override
  String get scrollToTopTooltip => '滚动到顶部';

  @override
  String get watchListText => '关注列表';

  @override
  String get roundDurationText => '将通话时长四舍五入到分钟';

  @override
  String get roundDurationTextSubtitle => '为了计费，将通话时长四舍五入到最接近的分钟';

  @override
  String get groupedCallSettingSubtitle => '选择如何分组通话，以便更轻松地跟踪和查看';

  @override
  String get filterPresetsSettingSubtitle => '创建、保存并重用筛选器，以便轻松查找通话';

  @override
  String get exportFilenameSettingSubtitle => '自定义导出文件的命名方式';

  @override
  String get exportFormatSettingSubtitle => '选择导出通话记录的格式';

  @override
  String get importCallLogsSettingSubtitle => '从其他来源或备份导入通话记录';

  @override
  String get appDetailsText => '应用信息与详情';

  @override
  String get appDetailsSubText => '版本 • 捐赠 • 错误报告';

  @override
  String get enableDownloadConfirmationText => '确认下载';

  @override
  String get enableDownloadConfirmationSubText => '在下载文件前提示确认';

  @override
  String get enableCallDurationFilteringText => '通话时长过滤';

  @override
  String get enableCallDurationFilteringSubText => '根据通话时长筛选通话记录';

  @override
  String get enableCallLogCountVisibilityText => '通话记录数量';

  @override
  String get enableCallLogCountVisibilitySubText => '显示每日通话数量';

  @override
  String get enableFilterByAccountIdText => '按账户ID过滤';

  @override
  String get enableFilterByAccountIdSubText => '显示特定SIM或账户的通话';

  @override
  String get showTotalCallDurationText => '通话总时长';

  @override
  String get showTotalCallDurationSubText => '显示通话总共耗时';

  @override
  String get disableLogsSharingText => '隐藏分享按钮';

  @override
  String get disableLogsSharingSubText => '在通话记录中隐藏分享按钮';

  @override
  String get trackListLabelText => '追踪列表';

  @override
  String get tracklistPlaceholderText =>
      '高效管理您的追踪列表。点击右上角 + 添加号码，左滑列表项并点击移除以取消追踪。';

  @override
  String get removeAllText => '全部移除';

  @override
  String get trackContactLabelText => '电话号码';

  @override
  String get trackContactText => '追踪联系人';

  @override
  String get removeText => '移除';

  @override
  String get iteractionScoreText => '互动分数';

  @override
  String get lastCallSinceText => '自上次通话以来';

  @override
  String get avgCallsMonthText => '每月平均通话次数';

  @override
  String get avgCallDurationText => '平均通话时长';

  @override
  String get peakCallDurationText => '最长通话时长';

  @override
  String get callsPerWeekText => '每周平均通话次数';

  @override
  String get callDistByWeekDay => '按星期几分布的通话比例 (%)';

  @override
  String addToTrackList(Object maxItems) {
    return '最多添加 $maxItems 个联系人到追踪列表，方便追踪。';
  }

  @override
  String get addText => '添加';

  @override
  String get numberAlreadyAddedErrorText => '号码已添加';

  @override
  String get invalidNumberErrorText => '无效的电话号码';

  @override
  String get emptyPhoneNumberErrorText => '请输入电话号码';

  @override
  String get trackNumberErrorText => '添加新追踪联系人时出错';

  @override
  String get quickFilterText => '快速筛选';
}
