// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get aboutText => '概要';

  @override
  String get advancedSettingsLabelText => '詳細設定';

  @override
  String get analyticsPolicyLabelText => '分析ポリシー';

  @override
  String get analyticsPolicyText =>
      'すべての通話ログデータはデバイス上でローカルに分析され、オンラインサーバーに送信されることはありません。これにより、プライバシーが保護され、情報が安全かつ機密に保たれます。';

  @override
  String get analyticsScreenLabelText => '分析';

  @override
  String get appError => 'おっと！問題が発生しました';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => 'フィルターを適用';

  @override
  String get baseGhostErrorMessage => '問題が発生しました';

  @override
  String get baseSettingsLabelText => '基本設定';

  @override
  String get blockedText => 'ブロック';

  @override
  String get callLogsExportFailureText => 'ファイルのダウンロード中にエラーが発生しました！';

  @override
  String get callLogsExportFormatLabelText => '通話ログのエクスポート形式';

  @override
  String get callLogsExportSuccessText => '通話ログが抽出され、正常にダウンロードされました';

  @override
  String get callTypeText => '通話タイプ';

  @override
  String get cancelText => 'キャンセル';

  @override
  String get configureText => '設定';

  @override
  String get confirmImportLabelText => 'インポート開始の確認';

  @override
  String get confirmImportText =>
      '通話ログのインポートは、現在のログを不可逆的に破損させ、データを上書きし、履歴に不整合を引き起こす可能性がある重要なタスクです。このプロセスには時間がかかる場合があり、上記の問題が発生する可能性があることにご注意ください。注意して進めてください。';

  @override
  String get continueText => '続行';

  @override
  String get dateText => '日付';

  @override
  String get donateText => '寄付';

  @override
  String downloadConfirmationText(String currentImportType) {
    return '$currentImportType形式で通話ログをダウンロードしてもよろしいですか？この操作により、通話履歴がデバイス上の$currentImportTypeファイルに保存されます。';
  }

  @override
  String get downloadText => 'ダウンロード';

  @override
  String get dtAAcronymExapandedText => '完全な曜日名';

  @override
  String get dtBAcronymExapandedText => '完全な月名';

  @override
  String get dtHAcronymExapandedText => '24時間形式の時間';

  @override
  String get dtIAcronymExapandedText => '12時間形式の時間';

  @override
  String get dtMAcronymExapandedText => '分';

  @override
  String get dtSAcronymExapandedText => '秒';

  @override
  String get dtUAcronymExapandedText => '年の週番号（週の最初の日曜日）';

  @override
  String get dtWAcronymExapandedText => '年の週番号（週の最初の月曜日）';

  @override
  String get dtXAcronymExapandedText => '時間表現';

  @override
  String get dtYAcronymExapandedText => '世紀を含む年';

  @override
  String get dtZAcronymExapandedText => 'タイムゾーン名';

  @override
  String get dtaAcronymExapandedText => '曜日の略称';

  @override
  String get dtbAcronymExapandedText => '月の略称';

  @override
  String get dtcAcronymExapandedText => '日付と時間の表現';

  @override
  String get dtdAcronymExapandedText => '月の日';

  @override
  String get dtfAcronymExapandedText => 'ミリ秒';

  @override
  String get dtjAcronymExapandedText => '年の日';

  @override
  String get dtmAcronymExapandedText => '数値としての月';

  @override
  String get dtpAcronymExapandedText => '午前/午後マーカー';

  @override
  String get dtxAcronymExapandedText => '日付表現';

  @override
  String get dtyAcronymExapandedText => '世紀を含まない年';

  @override
  String get dtzAcronymExapandedText => 'UTCからのタイムゾーンオフセット';

  @override
  String get durationText => '期間';

  @override
  String get exploreNowText => '今すぐ探検';

  @override
  String get exploreProjectButtonText => 'Githubでプロジェクトを探検';

  @override
  String get exportFileNameFormatLabelText => 'エクスポートファイル名形式';

  @override
  String get filenameFormatHintText => 'my-call-logs-[%token]';

  @override
  String get filenameFormatLabelText => 'ファイル名形式';

  @override
  String get filterText => 'フィルター';

  @override
  String get getStartedText => '開始';

  @override
  String get ghostErrorMessage => 'ん？問題が発生しました';

  @override
  String get hideText => '隠す';

  @override
  String get hintMobileNumberText => '1XXX XXXX';

  @override
  String get importCallLogsText => '通話ログをインポート';

  @override
  String get incomingText => '着信';

  @override
  String get logsScreenLabelText => 'ログ';

  @override
  String get maximumDurationHintText => '例: 60';

  @override
  String get maximumDurationLabelText => '最大（秒）';

  @override
  String get minimumDurationHintText => '例: 0';

  @override
  String get minimumDurationLabelText => '最小（秒）';

  @override
  String get missedText => '不在着信';

  @override
  String get mobileNumberText => '携帯電話番号';

  @override
  String get nextText => '次へ';

  @override
  String get onboardingScreenFourSubtitle =>
      'デバイス間で通話ログをシームレスに転送したり、安全な保管と分析のためにエクスポートしたりできます。';

  @override
  String get onboardingScreenFourTitle => 'インポートとエクスポート';

  @override
  String get onboardingScreenOneSubtitle => '通話ログを簡単に管理および分析するための頼りになるアプリ。';

  @override
  String get onboardingScreenOneTitle => 'Loggerへようこそ!';

  @override
  String get onboardingScreenThreeSubtitle =>
      'これまでにない通話パターンを理解し、詳細な洞察を得て時間を最適化します。';

  @override
  String get onboardingScreenThreeTitle => '通話を分析する';

  @override
  String get onboardingScreenTwoSubtitle =>
      'シームレスで直感的なインターフェースで、通話ログを検索、フィルター、管理します。';

  @override
  String get onboardingScreenTwoTitle => '通話ログを管理';

  @override
  String get openText => '開く';

  @override
  String get outgoingText => '発信';

  @override
  String get phoneAccountIdText => '電話アカウントID';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => 'プラットフォーム';

  @override
  String get randomDTRepr => '2024年7月12日 (金) 14:15:00';

  @override
  String get randomMonthAbbr => '7月';

  @override
  String get randomMonthName => '7月';

  @override
  String get randomWeekdayAbbr => '金';

  @override
  String get randomWeekdayName => '金曜日';

  @override
  String get refreshText => '更新';

  @override
  String get rejectedText => '拒否';

  @override
  String get reportIssueButtonText => '問題またはバグを報告';

  @override
  String get resetText => 'リセット';

  @override
  String get resetToDefaultText => 'デフォルトにリセット';

  @override
  String get saveText => '保存';

  @override
  String get settingsScreenLabelText => '設定';

  @override
  String get shareText => '共有';

  @override
  String get simText => 'SIM表示名';

  @override
  String get skipText => 'スキップ';

  @override
  String get startImportText => 'インポートを開始';

  @override
  String get storagePolicyLabelText => 'ストレージポリシー';

  @override
  String get storagePolicyText =>
      'このアプリは、生成されたファイルを一時的に保存し、終了時に削除します。選択した場所に通話ログをダウンロードできます。Loggerは通話ログにのみアクセスし、プライバシーを保護します。';

  @override
  String get supportedFormatInformation =>
      '注意: 通話ログのインポートには現在CSV形式のみがサポートされています。';

  @override
  String get timeText => '時間';

  @override
  String get tokenAccordianText => '日付と時刻の書式設定トークン';

  @override
  String get tokensInfoText =>
      '特定の時間と日付の設定に基づいてファイル名をカスタマイズするために、提供されたトークンを使用できます。';

  @override
  String get unknownText => '不明';

  @override
  String get versionText => 'バージョン';

  @override
  String get viewText => '表示';

  @override
  String get wifiIncomingText => 'Wifi着信';

  @override
  String get wifiOutgoingText => 'Wifi発信';

  @override
  String get callStatsText => '通話統計';

  @override
  String get callDurationText => '通話時間';

  @override
  String get mostCalledNumberText => '最も通話した番号';

  @override
  String get callDirectionAnalysisText => '通話方向分析';

  @override
  String get longestCallText => '最長通話';

  @override
  String topNLongestCalls(int n) {
    return '上位$n最長通話';
  }

  @override
  String get callText => '通話';

  @override
  String get smsText => 'SMS';

  @override
  String get nothingToDisplayText => '表示するものがありません';

  @override
  String get callsMadeText => '発信通話';

  @override
  String get callsReceivedText => '着信通話';

  @override
  String get callsMissedText => '不在着信';

  @override
  String get callsRejectedText => '拒否された通話';

  @override
  String get callsBlockedText => 'ブロックされた通話';

  @override
  String get averageText => '平均';

  @override
  String get longestText => '最長';

  @override
  String get totalText => '合計';

  @override
  String get todayText => '今日';

  @override
  String get yesterdayText => '昨日';

  @override
  String get thisMonthText => '今月';

  @override
  String get pastMonthText => '先月';

  @override
  String get thisYearText => '今年';

  @override
  String get pastYearText => '昨年';

  @override
  String get allTimeText => '全期間';

  @override
  String get customText => 'カスタム';

  @override
  String get startDateText => '開始日';

  @override
  String get endDateText => '終了日';

  @override
  String get dateRangeText => '日付範囲';

  @override
  String get searchByNumberText => '特定の電話番号';

  @override
  String get phoneAccountIdFilterText => '電話アカウントID';

  @override
  String get filterByDurationText => '通話時間でフィルタリング';

  @override
  String get showUnknownContactsOnlyText => 'Unknown Contacts Only';

  @override
  String get filterByCallTypeText => '通話タイプ';

  @override
  String get answeredExternallyText => '外部で応答';

  @override
  String get voiceMailText => 'ボイスメール';

  @override
  String get exportOpenHintText => 'エクスポートを開く';

  @override
  String get anyText => '任意';

  @override
  String get processingFileText => 'ファイルを処理中';

  @override
  String get insertingLogsText => 'ログを挿入中';

  @override
  String get takingMoreTimeText => 'これには時間がかかる場合があります';

  @override
  String get pleaseWaitText => 'お待ちください';

  @override
  String get importSuccessMessageText => '通話ログが正常にインポートされました';

  @override
  String get failedToUpdateSettingsText => '設定の更新に失敗しました。後でもう一度お試しください';

  @override
  String get shareSettingUpdateSuccessMsgText => '共有設定が正常に更新されました。';

  @override
  String get downloadSettingUpdatedSuccessMsgText => 'ダウンロード設定が正常に更新されました。';

  @override
  String get settingUpdateSuccessMsgText => '設定が正常に更新されました。';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText =>
      '期間フィルター設定が正常に更新されました。';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      '電話アカウントIDによるフィルター設定が正常に更新されました。';

  @override
  String get generalSettingUpdatedSuccessMsgText => '設定が正常に更新されました。';

  @override
  String get importSettingUpdatedSuccessMsgText => 'インポート設定が正常に更新されました。';

  @override
  String get exportFieldInfoText => 'エクスポートフィールド情報';

  @override
  String get csvJsonExportNameField => '通話ログエントリに関連付けられた名前';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      '通話に関連付けられた電話アカウントのID。通話の発信または受信に使用された特定のアカウントまたはSIMカードを識別します。';

  @override
  String get csvJsonExportCallTypeField => '通話のタイプ（例：着信、発信、不在着信）';

  @override
  String get csvJsonExportNumberField => '通話ログエントリに関連付けられた電話番号';

  @override
  String get csvJsonExportFormattedNumberField =>
      'フォーマットされた電話番号。通話が発信または受信されたときにユーザーがいた国に基づいてフォーマットルールでフォーマットされています。';

  @override
  String get csvJsonExportSimDisplayField => '通話に関連付けられたSIMカードの表示名';

  @override
  String get csvJsonExportTimestampField => '通話のタイムスタンプ（エポック時間）';

  @override
  String get csvJsonExportDurationField => '秒単位の通話時間';

  @override
  String get csvJsonExportCachedNumberLabelField => 'キャッシュされた電話番号に関連付けられたラベル';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      '電話番号に関連付けられたキャッシュされた番号の種類（自宅、職場など）。存在する場合。';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      '迅速な参照のために通話ログエントリに関連付けられた保存またはキャッシュされた電話番号。';

  @override
  String get exportFieldInfoHintText => 'エクスポートフィールド情報';

  @override
  String get naText => '未対応';

  @override
  String get confirmDownloadText => 'ダウンロードを確認';

  @override
  String get mostReceivedNumberText => '最も受信された番号';

  @override
  String get confirmContactsSyncLabelText => '連絡先の同期を確認';

  @override
  String get confirmContactsSyncConfirmationText =>
      'このプロセスは、通話履歴をスキャンし、欠落している連絡先名を保存した連絡先と照合して更新します。他の通話履歴の詳細は変更しません。';

  @override
  String get contactsSyncSuccessMessageText => '連絡先が通話履歴と正常に同期されました';

  @override
  String get contactsSyncErrorMessageText => '連絡先の同期中にエラーが発生しました！';

  @override
  String get contactsPermissionDenied => '連絡先の権限が拒否されました！';

  @override
  String get syncContactsLabelText => '通話履歴の連絡先を同期';

  @override
  String get syncContactsCTAText => '今すぐ同期';

  @override
  String get softwareInformationText => 'ソフトウェア情報';

  @override
  String get addToContactsText => '連絡先に追加';

  @override
  String get addToContactsErrorText => '新しい連絡先の追加に失敗しました';

  @override
  String get appPermissionsDeniedError =>
      'おっと! 通話ログへのアクセスが拒否されたようです。Logger をスムーズに動作させるには、権限を許可してください。';

  @override
  String get appFatalError => 'あらら！予期しないことが起こりました！';

  @override
  String get appPreferencesError => 'あらら！設定の読み込み中にエラーが発生しました。';

  @override
  String get uriPermissionError => '権限を取得できません';

  @override
  String get fileGenerationError => 'ファイルの生成中にエラーが発生しました。後でもう一度お試しください';

  @override
  String get fileShareMessage => '通話履歴ファイルをGmail、WhatsAppなどで共有...';

  @override
  String get fileShareSubject => '通話履歴';

  @override
  String get fileOpenError => 'ファイルを開けません。後でもう一度お試しください';

  @override
  String get openingFileLabel => 'ファイルを開いています';

  @override
  String get viewContactLabel => '連絡先を表示';

  @override
  String get errorOpeningContact => '連絡先を開く際にエラーが発生しました';

  @override
  String get waLaunchError => 'WhatsApp を起動できませんでした';

  @override
  String get closeText => '閉じる';

  @override
  String get defaultPresetName => 'デフォルトプリセット';

  @override
  String get onLabel => 'オン';

  @override
  String get offLabel => 'オフ';

  @override
  String get filterPresetTitle => 'フィルタープリセット';

  @override
  String get addMorePresetsLabel => 'プリセットを追加';

  @override
  String get deleteAllPresetsLabel => 'すべて削除';

  @override
  String get enablePresetsPlaceholderText =>
      'プリセットを有効にすると、複数のフィルターを簡単に作成・切り替えでき、通話履歴のカスタマイズが素早くできます。';

  @override
  String get noPresetsPlaceholderText => 'クイックフィルタリング用に独自のカスタムプリセットを作成し始めましょう';

  @override
  String get presetNameInputLabelText => 'プリセット名';

  @override
  String get presetNameInputHintText => 'プリセットの名前を入力してください';

  @override
  String get defaultLabelText => 'デフォルト';

  @override
  String get lastCallText => '最終通話';

  @override
  String get groupByContactAndTypeTitle => '連絡先と種類でグループ化';

  @override
  String get groupByContactAndTypeDescription => '通話を連絡先と通話の種類でグループ化します';

  @override
  String get groupByContactOnlyConsecutiveTitle => '連続する連絡先でグループ化';

  @override
  String get groupByContactOnlyConsecutiveDescription =>
      '同じ連絡先からの連続する通話を1つのグループにまとめます';

  @override
  String get groupByContactOnlyTitle => '連絡先でグループ化';

  @override
  String get groupByContactOnlyDescription => '同じ連絡先からのすべての通話をグループ化します';

  @override
  String get groupByNoneDescription => 'グループ化なし — 各通話が個別に表示されます';

  @override
  String get callGroupingText => '通話のグループ化';

  @override
  String get useGroupingSwitchText => 'フィルターでグループ化を使用';

  @override
  String get clearFiltersTooltip => 'フィルターをクリア';

  @override
  String get scrollToTopTooltip => '先頭にスクロール';

  @override
  String get watchListText => 'ウォッチリスト';

  @override
  String get roundDurationText => '通話時間を分単位に丸める';

  @override
  String get roundDurationTextSubtitle => '請求のために通話を最も近い分に丸めます';

  @override
  String get groupedCallSettingSubtitle => '通話を簡単に追跡・確認できるようにグループ化方法を選択';

  @override
  String get filterPresetsSettingSubtitle => '通話を簡単に見つけるためにフィルターを作成、保存、再利用';

  @override
  String get exportFilenameSettingSubtitle => 'エクスポートするファイル名の形式をカスタマイズ';

  @override
  String get exportFormatSettingSubtitle => 'エクスポートする通話ログの形式を選択';

  @override
  String get importCallLogsSettingSubtitle => '他のソースやバックアップから通話履歴をインポート';

  @override
  String get appDetailsText => 'アプリ情報と詳細';

  @override
  String get appDetailsSubText => 'バージョン • 寄付 • バグ報告';

  @override
  String get enableDownloadConfirmationText => 'ダウンロード確認';

  @override
  String get enableDownloadConfirmationSubText => 'ファイルをダウンロードする前に確認を求める';

  @override
  String get enableCallDurationFilteringText => '通話時間フィルター';

  @override
  String get enableCallDurationFilteringSubText => '通話の長さに基づいてフィルター';

  @override
  String get enableCallLogCountVisibilityText => '通話ログ件数';

  @override
  String get enableCallLogCountVisibilitySubText => '日ごとの通話件数を表示';

  @override
  String get enableFilterByAccountIdText => 'アカウントIDでフィルター';

  @override
  String get enableFilterByAccountIdSubText => '特定のSIMまたはアカウントの通話を表示';

  @override
  String get showTotalCallDurationText => '通話合計時間';

  @override
  String get showTotalCallDurationSubText => '通話に費やした合計時間を表示';

  @override
  String get disableLogsSharingText => '共有ボタンを非表示';

  @override
  String get disableLogsSharingSubText => '通話ログで共有ボタンを隠す';

  @override
  String get trackListLabelText => 'トラックリスト';

  @override
  String get tracklistPlaceholderText =>
      '追跡中の連絡先を効率的に管理します。連絡先を追加するには右上の + をタップし、リスト項目を左にスワイプして「削除」をタップして追跡を解除します。';

  @override
  String get removeAllText => 'すべて削除';

  @override
  String get trackContactLabelText => '連絡先名';

  @override
  String get trackContactText => '連絡先を追跡';

  @override
  String get removeText => '削除';

  @override
  String get iteractionScoreText => 'インタラクションスコア';

  @override
  String get lastCallSinceText => '最終通話から';

  @override
  String get avgCallsMonthText => '月平均通話数';

  @override
  String get avgCallDurationText => '平均通話時間';

  @override
  String get peakCallDurationText => '最大通話時間';

  @override
  String get callsPerWeekText => '週平均通話数';

  @override
  String get callDistByWeekDay => '曜日別通話分布 (%)';

  @override
  String addToTrackList(Object maxItems) {
    return '簡単に追跡できるように、トラックリストに最大 $maxItems 件の連絡先を追加できます。';
  }

  @override
  String get addText => '追加';

  @override
  String get numberAlreadyAddedErrorText => '連絡先は既に追加されています';

  @override
  String get invalidNumberErrorText => '無効な電話番号';

  @override
  String get emptyPhoneNumberErrorText => '連絡先名を入力してください';

  @override
  String get trackNumberErrorText => '新しいトラック連絡先の追加中にエラーが発生しました';

  @override
  String get quickFilterText => 'クイックフィルター';
}
