// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get aboutText => '정보';

  @override
  String get advancedSettingsLabelText => '고급 설정';

  @override
  String get analyticsPolicyLabelText => '분석 정책';

  @override
  String get analyticsPolicyText =>
      '모든 통화 기록 데이터는 장치에서 로컬로 분석되며 온라인 서버로 전송되지 않아 개인 정보가 보호되고 정보가 안전하고 기밀로 유지됩니다.';

  @override
  String get analyticsScreenLabelText => '분석';

  @override
  String get appError => '이런! 문제가 발생했습니다';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => '필터 적용';

  @override
  String get baseGhostErrorMessage => '문제가 발생했습니다';

  @override
  String get baseSettingsLabelText => '일반 설정';

  @override
  String get blockedText => '차단됨';

  @override
  String get callLogsExportFailureText => '파일 다운로드 중 오류 발생!';

  @override
  String get callLogsExportFormatLabelText => '통화 기록 내보내기 형식';

  @override
  String get callLogsExportSuccessText => '통화 기록이 성공적으로 추출 및 다운로드되었습니다';

  @override
  String get callTypeText => '통화 유형';

  @override
  String get cancelText => '취소';

  @override
  String get configureText => '구성';

  @override
  String get confirmImportLabelText => '가져오기 시작 확인';

  @override
  String get confirmImportText =>
      '통화 기록을 가져오는 것은 현재 로그를 되돌릴 수 없게 손상시키고, 데이터를 덮어쓰고, 기록에 불일치를 일으킬 수 있는 중요한 작업입니다. 이 프로세스는 시간이 걸릴 수 있으며 위에서 언급한 문제가 발생할 수 있음을 인지하십시오. 주의하여 진행하십시오.';

  @override
  String get continueText => '계속';

  @override
  String get dateText => '날짜';

  @override
  String get donateText => '기부';

  @override
  String downloadConfirmationText(String currentImportType) {
    return '$currentImportType 형식으로 통화 기록을 다운로드하시겠습니까? 이 작업은 통화 기록을 장치의 $currentImportType 파일에 저장합니다.';
  }

  @override
  String get downloadText => '다운로드';

  @override
  String get dtAAcronymExapandedText => '전체 요일 이름';

  @override
  String get dtBAcronymExapandedText => '전체 월 이름';

  @override
  String get dtHAcronymExapandedText => '24시간 형식의 시간';

  @override
  String get dtIAcronymExapandedText => '12시간 형식의 시간';

  @override
  String get dtMAcronymExapandedText => '분';

  @override
  String get dtSAcronymExapandedText => '초';

  @override
  String get dtUAcronymExapandedText => '연도의 주 번호 (일요일이 주의 첫 번째 날)';

  @override
  String get dtWAcronymExapandedText => '연도의 주 번호 (월요일이 주의 첫 번째 날)';

  @override
  String get dtXAcronymExapandedText => '시간 표현';

  @override
  String get dtYAcronymExapandedText => '세기 포함 연도';

  @override
  String get dtZAcronymExapandedText => '시간대 이름';

  @override
  String get dtaAcronymExapandedText => '약식 요일 이름';

  @override
  String get dtbAcronymExapandedText => '약식 월 이름';

  @override
  String get dtcAcronymExapandedText => '날짜 및 시간 표현';

  @override
  String get dtdAcronymExapandedText => '월의 날짜';

  @override
  String get dtfAcronymExapandedText => '밀리초';

  @override
  String get dtjAcronymExapandedText => '연도의 날짜';

  @override
  String get dtmAcronymExapandedText => '숫자로서의 월';

  @override
  String get dtpAcronymExapandedText => 'AM/PM 표시기';

  @override
  String get dtxAcronymExapandedText => '날짜 표현';

  @override
  String get dtyAcronymExapandedText => '세기 없는 연도';

  @override
  String get dtzAcronymExapandedText => 'UTC에서의 시간대 오프셋';

  @override
  String get durationText => '통화 시간';

  @override
  String get exploreNowText => '지금 탐색';

  @override
  String get exploreProjectButtonText => 'Github에서 프로젝트 탐색';

  @override
  String get exportFileNameFormatLabelText => '내보내기 파일 이름 형식';

  @override
  String get filenameFormatHintText => 'my-call-logs-[%token]';

  @override
  String get filenameFormatLabelText => '파일 이름 형식';

  @override
  String get filterText => '필터';

  @override
  String get getStartedText => '시작하기';

  @override
  String get ghostErrorMessage => '흠. 문제가 발생했습니다';

  @override
  String get hideText => '숨기기';

  @override
  String get hintMobileNumberText => '0XXX XXXX';

  @override
  String get importCallLogsText => '통화 기록 가져오기';

  @override
  String get incomingText => '수신';

  @override
  String get logsScreenLabelText => '로그';

  @override
  String get maximumDurationHintText => '예: 60';

  @override
  String get maximumDurationLabelText => '최대 (초)';

  @override
  String get minimumDurationHintText => '예: 0';

  @override
  String get minimumDurationLabelText => '최소 (초)';

  @override
  String get missedText => '부재중';

  @override
  String get mobileNumberText => '휴대폰 번호';

  @override
  String get nextText => '다음';

  @override
  String get onboardingScreenFourSubtitle =>
      '장치 간에 통화 기록을 원활하게 전송하거나 안전하게 보관 및 분석할 수 있도록 내보냅니다.';

  @override
  String get onboardingScreenFourTitle => '가져오기 및 내보내기';

  @override
  String get onboardingScreenOneSubtitle => '통화 기록을 간편하게 관리하고 분석할 수 있는 앱입니다.';

  @override
  String get onboardingScreenOneTitle => 'Logger에 오신 것을 환영합니다!';

  @override
  String get onboardingScreenThreeSubtitle =>
      '이전과는 전혀 다른 통화 패턴을 이해하고 시간을 최적화하기 위한 자세한 통찰력을 얻으십시오.';

  @override
  String get onboardingScreenThreeTitle => '통화 분석';

  @override
  String get onboardingScreenTwoSubtitle =>
      '원활하고 직관적인 인터페이스를 사용하여 통화 기록을 검색, 필터링 및 관리하십시오.';

  @override
  String get onboardingScreenTwoTitle => '통화 기록 관리';

  @override
  String get openText => '열기';

  @override
  String get outgoingText => '발신';

  @override
  String get phoneAccountIdText => '전화 계정 ID';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => '플랫폼';

  @override
  String get randomDTRepr => '2024년 7월 12일 금요일 14:15:00';

  @override
  String get randomMonthAbbr => '7월';

  @override
  String get randomMonthName => '7월';

  @override
  String get randomWeekdayAbbr => '금';

  @override
  String get randomWeekdayName => '금요일';

  @override
  String get refreshText => '새로고침';

  @override
  String get rejectedText => '거절됨';

  @override
  String get reportIssueButtonText => '문제 또는 버그 신고';

  @override
  String get resetText => '재설정';

  @override
  String get resetToDefaultText => '기본값으로 재설정';

  @override
  String get saveText => '저장';

  @override
  String get settingsScreenLabelText => '설정';

  @override
  String get shareText => '공유';

  @override
  String get simText => 'SIM 표시 이름';

  @override
  String get skipText => '건너뛰기';

  @override
  String get startImportText => '가져오기 시작';

  @override
  String get storagePolicyLabelText => '저장소 정책';

  @override
  String get storagePolicyText =>
      '이 앱은 생성된 파일을 일시적으로 저장하며 종료 시 삭제합니다. 선택한 위치로 통화 기록을 다운로드할 수 있습니다. Logger는 통화 기록에만 액세스하여 개인 정보를 보호합니다.';

  @override
  String get supportedFormatInformation => '참고: 현재 통화 기록 가져오기에는 CSV 형식만 지원됩니다.';

  @override
  String get timeText => '시간';

  @override
  String get tokenAccordianText => '날짜 및 시간 형식 토큰';

  @override
  String get tokensInfoText =>
      '제공된 토큰을 사용하여 특정 날짜 및 시간 환경 설정에 따라 파일 이름 형식을 사용자 지정할 수 있습니다.';

  @override
  String get unknownText => '알 수 없음';

  @override
  String get versionText => '버전';

  @override
  String get viewText => '보기';

  @override
  String get wifiIncomingText => '와이파이 수신';

  @override
  String get wifiOutgoingText => '와이파이 발신';

  @override
  String get callStatsText => '통계';

  @override
  String get callDurationText => '통화 시간';

  @override
  String get mostCalledNumberText => '가장 많이 통화한 번호';

  @override
  String get callDirectionAnalysisText => '통화 방향 분석';

  @override
  String get longestCallText => '가장 긴 통화';

  @override
  String topNLongestCalls(int n) {
    return '상위 $n 가장 긴 통화';
  }

  @override
  String get callText => '통화';

  @override
  String get smsText => 'SMS';

  @override
  String get nothingToDisplayText => '표시할 내용이 없습니다';

  @override
  String get callsMadeText => '발신 통화';

  @override
  String get callsReceivedText => '수신 통화';

  @override
  String get callsMissedText => '부재중 통화';

  @override
  String get callsRejectedText => '거절된 통화';

  @override
  String get callsBlockedText => '차단된 통화';

  @override
  String get averageText => '평균';

  @override
  String get longestText => '가장 긴';

  @override
  String get totalText => '총';

  @override
  String get todayText => '오늘';

  @override
  String get yesterdayText => '어제';

  @override
  String get thisMonthText => '이번 달';

  @override
  String get pastMonthText => '지난달';

  @override
  String get thisYearText => '올해';

  @override
  String get pastYearText => '작년';

  @override
  String get allTimeText => '모든 시간';

  @override
  String get customText => '사용자 정의';

  @override
  String get startDateText => '시작일';

  @override
  String get endDateText => '종료일';

  @override
  String get dateRangeText => '날짜 범위';

  @override
  String get searchByNumberText => '특정 전화 번호';

  @override
  String get phoneAccountIdFilterText => '전화 계정 ID';

  @override
  String get filterByDurationText => '통화 시간으로 필터링';

  @override
  String get filterByCallTypeText => '통화 유형';

  @override
  String get answeredExternallyText => '외부에서 응답됨';

  @override
  String get voiceMailText => '음성 메일';

  @override
  String get exportOpenHintText => '내보내기 열기';

  @override
  String get anyText => '모두';

  @override
  String get processingFileText => '파일 처리 중';

  @override
  String get insertingLogsText => '로그 삽입 중';

  @override
  String get takingMoreTimeText => '시간이 더 걸릴 수 있습니다';

  @override
  String get pleaseWaitText => '기다려 주십시오';

  @override
  String get importSuccessMessageText => '통화 기록을 성공적으로 가져왔습니다';

  @override
  String get failedToUpdateSettingsText => '설정 업데이트에 실패했습니다. 나중에 다시 시도해 주십시오';

  @override
  String get shareSettingUpdateSuccessMsgText => '공유 설정이 성공적으로 업데이트되었습니다.';

  @override
  String get downloadSettingUpdatedSuccessMsgText =>
      '다운로드 설정이 성공적으로 업데이트되었습니다.';

  @override
  String get settingUpdateSuccessMsgText => '설정이 성공적으로 업데이트되었습니다.';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText =>
      '통화 시간 필터 설정이 성공적으로 업데이트되었습니다.';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      '전화 계정 ID별 필터 설정이 성공적으로 업데이트되었습니다.';

  @override
  String get generalSettingUpdatedSuccessMsgText => '설정이 성공적으로 업데이트되었습니다.';

  @override
  String get importSettingUpdatedSuccessMsgText => '가져오기 설정이 성공적으로 업데이트되었습니다.';

  @override
  String get exportFieldInfoText => '내보내기 필드 정보';

  @override
  String get csvJsonExportNameField => '통화 기록 항목과 연결된 이름';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      '통화와 연결된 전화 계정의 ID입니다. 통화를 걸거나 받는 데 사용된 특정 계정 또는 SIM 카드를 식별합니다.';

  @override
  String get csvJsonExportCallTypeField => '통화 유형(예: 수신, 발신, 부재중)';

  @override
  String get csvJsonExportNumberField => '통화 기록 항목과 연결된 전화 번호';

  @override
  String get csvJsonExportFormattedNumberField =>
      '형식이 지정된 전화 번호입니다. 사용자가 통화를 걸거나 받을 때 있던 국가를 기반으로 서식 규칙이 적용됩니다.';

  @override
  String get csvJsonExportSimDisplayField => '통화와 연결된 SIM 카드의 표시 이름';

  @override
  String get csvJsonExportTimestampField => '통화의 타임스탬프(epoch 시간)';

  @override
  String get csvJsonExportDurationField => '초 단위의 통화 시간';

  @override
  String get csvJsonExportCachedNumberLabelField => '캐시된 전화 번호와 연결된 레이블';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      '캐시된 전화 번호와 연결된 캐시된 번호 유형 (집, 직장 등)';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      '빠른 참조를 위해 통화 기록 항목과 연결된 저장되거나 캐시된 전화 번호입니다.';

  @override
  String get exportFieldInfoHintText => '내보내기 필드 정보';

  @override
  String get naText => '시도 안 함';

  @override
  String get confirmDownloadText => '다운로드 확인';

  @override
  String get mostReceivedNumberText => '가장 많이 받은 번호';

  @override
  String get confirmContactsSyncLabelText => '연락처 동기화 확인';

  @override
  String get confirmContactsSyncConfirmationText =>
      '이 프로세스는 호출 로그를 스캔하고 누락된 연락처 이름을 저장된 연락처와 일치시켜 업데이트합니다. 호출 기록의 다른 세부 사항은 변경하지 않습니다.';

  @override
  String get contactsSyncSuccessMessageText => '연락처가 성공적으로 호출 로그와 동기화되었습니다';

  @override
  String get contactsSyncErrorMessageText => '연락처 동기화 중 오류가 발생했습니다!';

  @override
  String get contactsPermissionDenied => '연락처 권한이 거부되었습니다!';

  @override
  String get syncContactsLabelText => '통화 기록 연락처 동기화';

  @override
  String get syncContactsCTAText => '지금 동기화';

  @override
  String get softwareInformationText => '소프트웨어 정보';

  @override
  String get addToContactsText => '연락처에 추가';

  @override
  String get addToContactsErrorText => '새 연락처를 추가할 수 없습니다';

  @override
  String get appPermissionsDeniedError =>
      '앗! 통화 기록에 대한 액세스가 거부된 것 같습니다. Logger가 원활하게 작동하려면 권한을 허용해 주세요.';

  @override
  String get appFatalError => '앗! 예상치 못한 일이 발생했습니다!';

  @override
  String get appPreferencesError => '앗! 환경설정을 로드하는 중 오류가 발생했습니다.';

  @override
  String get uriPermissionError => '권한을 가져올 수 없음';

  @override
  String get fileGenerationError => '파일 생성 중 오류가 발생했습니다. 나중에 다시 시도하세요';

  @override
  String get fileShareMessage => '통화 로그 파일을 Gmail, WhatsApp 등을 통해 공유하세요...';

  @override
  String get fileShareSubject => '통화 기록';

  @override
  String get fileOpenError => '파일을 열 수 없습니다. 나중에 다시 시도하세요';

  @override
  String get openingFileLabel => '파일 여는 중';

  @override
  String get viewContactLabel => '연락처 보기';

  @override
  String get errorOpeningContact => '연락처를 여는 중 오류 발생';

  @override
  String get waLaunchError => 'WhatsApp을 실행할 수 없습니다';

  @override
  String get closeText => '닫기';

  @override
  String get defaultPresetName => '기본 프리셋';

  @override
  String get onLabel => '켜짐';

  @override
  String get offLabel => '꺼짐';

  @override
  String get filterPresetTitle => '필터 프리셋';

  @override
  String get addMorePresetsLabel => '프리셋 추가';

  @override
  String get deleteAllPresetsLabel => '모두 삭제';

  @override
  String get enablePresetsPlaceholderText =>
      '프리셋을 활성화하여 여러 필터를 손쉽게 생성하고 전환하여 통화 기록을 빠르게 맞춤 설정하세요.';

  @override
  String get noPresetsPlaceholderText => '빠른 필터링을 위해 사용자 지정 프리셋을 만들어보세요';

  @override
  String get presetNameInputLabelText => '프리셋 이름';

  @override
  String get presetNameInputHintText => '프리셋 이름을 입력하세요';

  @override
  String get defaultLabelText => '기본값';

  @override
  String get lastCallText => '마지막 통화';

  @override
  String get groupByContactAndTypeTitle => '연락처 및 유형별 그룹화';

  @override
  String get groupByContactAndTypeDescription => '통화를 연락처와 통화 유형별로 그룹화합니다';

  @override
  String get groupByContactOnlyConsecutiveTitle => '연속된 연락처별 그룹화';

  @override
  String get groupByContactOnlyConsecutiveDescription =>
      '같은 연락처에서의 연속된 통화를 하나의 그룹으로 합칩니다';

  @override
  String get groupByContactOnlyTitle => '연락처별 그룹화';

  @override
  String get groupByContactOnlyDescription => '같은 연락처에서의 모든 통화를 그룹화합니다';

  @override
  String get groupByNoneDescription => '그룹화 없음 — 각 통화가 개별적으로 표시됩니다';

  @override
  String get callGroupingText => '통화 그룹화';

  @override
  String get useGroupingSwitchText => '필터와 함께 그룹화 사용';

  @override
  String get clearFiltersTooltip => '필터 지우기';

  @override
  String get scrollToTopTooltip => '맨 위로 스크롤';

  @override
  String get watchListText => '관찰 목록';

  @override
  String get roundDurationText => '통화 시간을 분 단위로 반올림';

  @override
  String get roundDurationTextSubtitle => '청구를 위해 통화를 가장 가까운 분으로 반올림';

  @override
  String get groupedCallSettingSubtitle => '통화를 더 쉽게 추적하고 확인할 수 있도록 그룹화 방법 선택';

  @override
  String get filterPresetsSettingSubtitle => '통화를 쉽게 찾기 위해 필터를 생성, 저장 및 재사용';

  @override
  String get exportFilenameSettingSubtitle => '내보낸 파일 이름 형식 사용자 지정';

  @override
  String get exportFormatSettingSubtitle => '내보낼 통화 기록의 형식 선택';

  @override
  String get importCallLogsSettingSubtitle => '다른 소스 또는 백업에서 통화 기록 가져오기';

  @override
  String get appDetailsText => '앱 정보 및 세부사항';

  @override
  String get appDetailsSubText => '버전 • 기부 • 버그 보고';

  @override
  String get enableDownloadConfirmationText => '다운로드 확인';

  @override
  String get enableDownloadConfirmationSubText => '파일을 다운로드하기 전에 확인 요청';

  @override
  String get enableCallDurationFilteringText => '통화 시간 필터링';

  @override
  String get enableCallDurationFilteringSubText => '통화 길이에 따라 필터링';

  @override
  String get enableCallLogCountVisibilityText => '통화 기록 수';

  @override
  String get enableCallLogCountVisibilitySubText => '하루별 통화 수 표시';

  @override
  String get enableFilterByAccountIdText => '계정 ID로 필터링';

  @override
  String get enableFilterByAccountIdSubText => '특정 SIM 또는 계정의 통화 표시';

  @override
  String get showTotalCallDurationText => '총 통화 시간';

  @override
  String get showTotalCallDurationSubText => '통화에 사용된 총 시간 표시';

  @override
  String get disableLogsSharingText => '공유 버튼 숨기기';

  @override
  String get disableLogsSharingSubText => '통화 기록에서 공유 버튼 숨기기';

  @override
  String get trackListLabelText => '트랙리스트';

  @override
  String get tracklistPlaceholderText =>
      '트랙리스트를 효율적으로 관리하세요. 번호를 추가하려면 오른쪽 상단의 +를 누르고, 리스트 항목을 왼쪽으로 스와이프한 후 제거를 눌러 추적을 해제하세요.';

  @override
  String get removeAllText => '모두 제거';

  @override
  String get trackContactLabelText => '전화번호';

  @override
  String get trackContactText => '연락처 추적';

  @override
  String get removeText => '제거';

  @override
  String get iteractionScoreText => '상호작용 점수';

  @override
  String get lastCallSinceText => '마지막 통화 이후';

  @override
  String get avgCallsMonthText => '월 평균 통화';

  @override
  String get avgCallDurationText => '평균 통화 시간';

  @override
  String get peakCallDurationText => '최장 통화 시간';

  @override
  String get callsPerWeekText => '주 평균 통화';

  @override
  String get callDistByWeekDay => '요일별 통화 분포 (%)';

  @override
  String addToTrackList(Object maxItems) {
    return '간편한 추적을 위해 트랙리스트에 최대 $maxItems명의 연락처를 추가하세요.';
  }

  @override
  String get addText => '추가';

  @override
  String get numberAlreadyAddedErrorText => '번호가 이미 추가됨';

  @override
  String get invalidNumberErrorText => '잘못된 전화번호';

  @override
  String get emptyPhoneNumberErrorText => '전화번호를 입력하세요';

  @override
  String get trackNumberErrorText => '새 트랙 연락처를 추가하는 중 오류가 발생했습니다';

  @override
  String get quickFilterText => '빠른 필터';
}
