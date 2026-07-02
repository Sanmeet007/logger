// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get aboutText => 'Sobre';

  @override
  String get advancedSettingsLabelText => 'Configurações Avançadas';

  @override
  String get analyticsPolicyLabelText => 'Política de Análise';

  @override
  String get analyticsPolicyText =>
      'Todos os dados do registo de chamadas são analisados localmente no seu dispositivo e nunca são transmitidos para servidores online, garantindo a sua privacidade e mantendo as suas informações seguras e confidenciais';

  @override
  String get analyticsScreenLabelText => 'Análise';

  @override
  String get appError => 'Ah, ocorreu um erro!';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => 'Aplicar Filtros';

  @override
  String get baseGhostErrorMessage => 'Algo correu mal';

  @override
  String get baseSettingsLabelText => 'Configurações Gerais';

  @override
  String get blockedText => 'Bloqueado';

  @override
  String get callLogsExportFailureText => 'Erro ao baixar o ficheiro!';

  @override
  String get callLogsExportFormatLabelText =>
      'Formato de exportação dos registos de chamadas';

  @override
  String get callLogsExportSuccessText =>
      'Registos de chamadas extraídos e baixados com sucesso';

  @override
  String get callTypeText => 'Tipo de Chamada';

  @override
  String get cancelText => 'Cancelar';

  @override
  String get configureText => 'Configurar';

  @override
  String get confirmImportLabelText => 'Confirmar Início da Importação';

  @override
  String get confirmImportText =>
      'A importação de registos de chamadas é uma tarefa significativa que pode corromper irreversivelmente os seus registos atuais, substituir dados e causar inconsistências no seu histórico. Tenha em atenção que este processo pode levar algum tempo e pode levar aos problemas mencionados acima. Proceda com cautela.';

  @override
  String get continueText => 'Continuar';

  @override
  String get dateText => 'Data';

  @override
  String get donateText => 'Doar';

  @override
  String downloadConfirmationText(String currentImportType) {
    return 'Tem a certeza de que quer baixar os seus registos de chamadas no formato $currentImportType? Esta ação irá guardar o seu histórico de chamadas num ficheiro $currentImportType no seu dispositivo.';
  }

  @override
  String get downloadText => 'Baixar';

  @override
  String get dtAAcronymExapandedText => 'Nome completo do dia da semana';

  @override
  String get dtBAcronymExapandedText => 'Nome completo do mês';

  @override
  String get dtHAcronymExapandedText => 'Hora no formato de 24 horas';

  @override
  String get dtIAcronymExapandedText => 'Hora no formato de 12 horas';

  @override
  String get dtMAcronymExapandedText => 'Minutos';

  @override
  String get dtSAcronymExapandedText => 'Segundos';

  @override
  String get dtUAcronymExapandedText =>
      'Número da semana do ano (Domingo como primeiro dia da semana)';

  @override
  String get dtWAcronymExapandedText =>
      'Número da semana do ano (Segunda-feira como primeiro dia da semana)';

  @override
  String get dtXAcronymExapandedText => 'Representação da hora';

  @override
  String get dtYAcronymExapandedText => 'Ano com século';

  @override
  String get dtZAcronymExapandedText => 'Nome do fuso horário';

  @override
  String get dtaAcronymExapandedText => 'Nome abreviado do dia da semana';

  @override
  String get dtbAcronymExapandedText => 'Nome abreviado do mês';

  @override
  String get dtcAcronymExapandedText => 'Representação da data e hora';

  @override
  String get dtdAcronymExapandedText => 'Dia do mês';

  @override
  String get dtfAcronymExapandedText => 'Milissegundos';

  @override
  String get dtjAcronymExapandedText => 'Dia do ano';

  @override
  String get dtmAcronymExapandedText => 'Mês como um número';

  @override
  String get dtpAcronymExapandedText => 'Marcador AM/PM';

  @override
  String get dtxAcronymExapandedText => 'Representação da data';

  @override
  String get dtyAcronymExapandedText => 'Ano sem século';

  @override
  String get dtzAcronymExapandedText =>
      'Deslocamento do fuso horário em relação a UTC';

  @override
  String get durationText => 'Duração';

  @override
  String get exploreNowText => 'Explorar agora';

  @override
  String get exploreProjectButtonText => 'Explorar Projeto no Github';

  @override
  String get exportFileNameFormatLabelText =>
      'Formato do nome do ficheiro de exportação';

  @override
  String get filenameFormatHintText => 'meus-registos-de-chamadas-[%token]';

  @override
  String get filenameFormatLabelText => 'Formato do nome do ficheiro';

  @override
  String get filterText => 'Filtrar';

  @override
  String get getStartedText => 'Começar';

  @override
  String get ghostErrorMessage => 'Hmm. Algo correu mal';

  @override
  String get hideText => 'Ocultar';

  @override
  String get hintMobileNumberText => '9X XXX XXXX';

  @override
  String get importCallLogsText => 'Importar os seus registos de chamadas';

  @override
  String get incomingText => 'Recebida';

  @override
  String get logsScreenLabelText => 'Registos';

  @override
  String get maximumDurationHintText => 'ex: 60';

  @override
  String get maximumDurationLabelText => 'Máx (em segs)';

  @override
  String get minimumDurationHintText => 'ex: 0';

  @override
  String get minimumDurationLabelText => 'Min (em seg)';

  @override
  String get missedText => 'Perdida';

  @override
  String get mobileNumberText => 'Número de Telemóvel';

  @override
  String get nextText => 'Próximo';

  @override
  String get onboardingScreenFourSubtitle =>
      'Transfira facilmente os registos de chamadas entre dispositivos ou exporte-os para salvaguarda e análise.';

  @override
  String get onboardingScreenFourTitle => 'Importar e Exportar';

  @override
  String get onboardingScreenOneSubtitle =>
      'A sua aplicação de eleição para gerir e analisar os seus registos de chamadas sem esforço.';

  @override
  String get onboardingScreenOneTitle => 'Bem-vindo ao Logger!';

  @override
  String get onboardingScreenThreeSubtitle =>
      'Compreenda os seus padrões de chamadas como nunca antes e obtenha informações detalhadas para otimizar o seu tempo.';

  @override
  String get onboardingScreenThreeTitle => 'Analisar as Suas Chamadas';

  @override
  String get onboardingScreenTwoSubtitle =>
      'Pesquise, filtre e faça a gestão dos seus registos de chamadas com uma interface simples e intuitiva.';

  @override
  String get onboardingScreenTwoTitle => 'Gerir Registos de Chamadas';

  @override
  String get openText => 'Abrir';

  @override
  String get outgoingText => 'Efetuada';

  @override
  String get phoneAccountIdText => 'ID da Conta de Telefone';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => 'plataforma';

  @override
  String get randomDTRepr => 'Sex, 12 Jul 2024 14:15:00';

  @override
  String get randomMonthAbbr => 'Jul';

  @override
  String get randomMonthName => 'Julho';

  @override
  String get randomWeekdayAbbr => 'Sex';

  @override
  String get randomWeekdayName => 'Sexta-feira';

  @override
  String get refreshText => 'Atualizar';

  @override
  String get rejectedText => 'Rejeitada';

  @override
  String get reportIssueButtonText => 'Reportar um Problema ou Erro';

  @override
  String get resetText => 'Redefinir';

  @override
  String get resetToDefaultText => 'Redefinir para o Padrão';

  @override
  String get saveText => 'Guardar';

  @override
  String get settingsScreenLabelText => 'Configurações';

  @override
  String get shareText => 'Partilhar';

  @override
  String get simText => 'Nome de Exibição do SIM';

  @override
  String get skipText => 'Ignorar';

  @override
  String get startImportText => 'Iniciar Importação';

  @override
  String get storagePolicyLabelText => 'Política de Armazenamento';

  @override
  String get storagePolicyText =>
      'Esta aplicação armazena temporariamente os ficheiros gerados, eliminando-os ao sair. Pode descarregar os registos de chamadas para a sua localização escolhida. O Logger apenas acede aos registos de chamadas, garantindo a sua privacidade.';

  @override
  String get supportedFormatInformation =>
      'Atenção: Atualmente, apenas o formato CSV é suportado para importar registos de chamadas.';

  @override
  String get timeText => 'Hora';

  @override
  String get tokenAccordianText => 'tokens de formatação de data e hora';

  @override
  String get tokensInfoText =>
      'Pode utilizar os tokens fornecidos para personalizar o seu formato de nome de ficheiro com base em preferências específicas de data e hora.';

  @override
  String get unknownText => 'Desconhecido';

  @override
  String get versionText => 'versão';

  @override
  String get viewText => 'Ver';

  @override
  String get wifiIncomingText => 'Wifi Recebida';

  @override
  String get wifiOutgoingText => 'Wifi Efetuada';

  @override
  String get callStatsText => 'Estatísticas de Chamadas';

  @override
  String get callDurationText => 'Duração da Chamada';

  @override
  String get mostCalledNumberText => 'Número Mais Chamado';

  @override
  String get callDirectionAnalysisText => 'Análise da Direção das Chamadas';

  @override
  String get longestCallText => 'Chamada Mais Longa';

  @override
  String topNLongestCalls(int n) {
    return 'Top $n Chamadas Mais Longas';
  }

  @override
  String get callText => 'Chamada';

  @override
  String get smsText => 'SMS';

  @override
  String get nothingToDisplayText => 'Nada para exibir';

  @override
  String get callsMadeText => 'Chamadas Efetuadas';

  @override
  String get callsReceivedText => 'Chamadas Recebidas';

  @override
  String get callsMissedText => 'Chamadas Perdidas';

  @override
  String get callsRejectedText => 'Chamadas Rejeitadas';

  @override
  String get callsBlockedText => 'Chamadas Bloqueadas';

  @override
  String get averageText => 'Média';

  @override
  String get longestText => 'Mais Longa';

  @override
  String get totalText => 'Total';

  @override
  String get todayText => 'Hoje';

  @override
  String get yesterdayText => 'Ontem';

  @override
  String get thisMonthText => 'Este Mês';

  @override
  String get pastMonthText => 'Mês Passado';

  @override
  String get thisYearText => 'Este Ano';

  @override
  String get pastYearText => 'Ano Passado';

  @override
  String get allTimeText => 'Sempre';

  @override
  String get customText => 'Personalizado';

  @override
  String get startDateText => 'Data de Início';

  @override
  String get endDateText => 'Data de Fim';

  @override
  String get dateRangeText => 'Intervalo de datas';

  @override
  String get searchByNumberText => 'Número de Telefone Específico';

  @override
  String get phoneAccountIdFilterText => 'ID da Conta de Telefone';

  @override
  String get filterByDurationText => 'Filtrar por Duração da Chamada';

  @override
  String get showUnknownContactsOnlyText => 'Unknown Contacts Only';

  @override
  String get filterByCallTypeText => 'Tipo de Chamada';

  @override
  String get answeredExternallyText => 'Atendida Externamente';

  @override
  String get voiceMailText => 'Correio de Voz';

  @override
  String get exportOpenHintText => 'Exportar Abrir';

  @override
  String get anyText => 'Qualquer';

  @override
  String get processingFileText => 'A processar o ficheiro';

  @override
  String get insertingLogsText => 'A inserir registos';

  @override
  String get takingMoreTimeText => 'Isto pode demorar mais tempo';

  @override
  String get pleaseWaitText => 'Por favor, aguarde';

  @override
  String get importSuccessMessageText =>
      'Registos de chamadas importados com sucesso';

  @override
  String get failedToUpdateSettingsText =>
      'Falha ao atualizar as definições. Tente novamente mais tarde';

  @override
  String get shareSettingUpdateSuccessMsgText =>
      'As definições de partilha foram atualizadas com sucesso.';

  @override
  String get downloadSettingUpdatedSuccessMsgText =>
      'As definições de descarregamento foram atualizadas com sucesso.';

  @override
  String get settingUpdateSuccessMsgText => 'Definição atualizada com sucesso.';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText =>
      'As definições do filtro de duração foram atualizadas com sucesso.';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      'As definições de filtro por id de conta de telefone foram atualizadas com sucesso.';

  @override
  String get generalSettingUpdatedSuccessMsgText =>
      'Definições atualizadas com sucesso.';

  @override
  String get importSettingUpdatedSuccessMsgText =>
      'As definições de importação foram atualizadas com sucesso.';

  @override
  String get exportFieldInfoText => 'Informação dos campos de exportação';

  @override
  String get csvJsonExportNameField =>
      'Nome associado à entrada do registo de chamadas';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      'O ID da conta de telefone associada à chamada identifica a conta ou cartão SIM específico utilizado para efetuar ou receber a chamada';

  @override
  String get csvJsonExportCallTypeField =>
      'Tipo da chamada (por exemplo, recebida, efetuada, perdida)';

  @override
  String get csvJsonExportNumberField =>
      'Número de telefone associado à entrada do registo de chamadas';

  @override
  String get csvJsonExportFormattedNumberField =>
      'Número de telefone formatado, formatado com regras de formatação com base no país em que o utilizador se encontrava quando a chamada foi efetuada ou recebida.';

  @override
  String get csvJsonExportSimDisplayField =>
      'Nome de exibição do cartão SIM associado à chamada';

  @override
  String get csvJsonExportTimestampField =>
      'Timestamp (tempo epoch) da chamada';

  @override
  String get csvJsonExportDurationField => 'Duração da chamada em segundos';

  @override
  String get csvJsonExportCachedNumberLabelField =>
      'Rótulo associado ao número de telefone em cache';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      'O tipo de número em cache (Casa, Trabalho, etc.) associado ao número de telefone, se existir.';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      'Número de telefone armazenado ou em cache associado a uma entrada de registo de chamadas para referência rápida.';

  @override
  String get exportFieldInfoHintText => 'Informações dos Campos de Exportação';

  @override
  String get naText => 'n/d';

  @override
  String get confirmDownloadText => 'Confirmar download';

  @override
  String get mostReceivedNumberText => 'Najczęściej odebrany numer';

  @override
  String get confirmContactsSyncLabelText =>
      'Confirmar sincronização de contatos';

  @override
  String get confirmContactsSyncConfirmationText =>
      'Este processo irá escanear seus registros de chamadas e atualizar os nomes de contatos ausentes, correspondendo-os aos seus contatos salvos. Não modificará nenhum outro detalhe no seu histórico de chamadas.';

  @override
  String get contactsSyncSuccessMessageText =>
      'Contatos sincronizados com sucesso com os registros de chamadas';

  @override
  String get contactsSyncErrorMessageText => 'Erro ao sincronizar contatos!';

  @override
  String get contactsPermissionDenied =>
      'Permissão para acessar os contatos negada!';

  @override
  String get syncContactsLabelText =>
      'Sincronizar contatos do registro de chamadas';

  @override
  String get syncContactsCTAText => 'Sincronizar agora';

  @override
  String get softwareInformationText => 'Informações do software';

  @override
  String get addToContactsText => 'Adicionar aos contatos';

  @override
  String get addToContactsErrorText =>
      'Não foi possível adicionar o novo contato';

  @override
  String get appPermissionsDeniedError =>
      'Ops! Parece que o acesso aos registros de chamadas foi negado. Para garantir que o Logger funcione corretamente, conceda a permissão.';

  @override
  String get appFatalError => 'Ah não! Algo inesperado aconteceu!';

  @override
  String get appPreferencesError => 'Ah não! Erro ao carregar preferências.';

  @override
  String get uriPermissionError => 'Não foi possível obter permissões';

  @override
  String get fileGenerationError =>
      'Ocorreu um erro ao gerar o arquivo. Tente novamente mais tarde';

  @override
  String get fileShareMessage =>
      'Compartilhe o arquivo de registros de chamadas via Gmail, WhatsApp, etc...';

  @override
  String get fileShareSubject => 'Registros de chamadas';

  @override
  String get fileOpenError =>
      'Não foi possível abrir o arquivo, tente novamente mais tarde';

  @override
  String get openingFileLabel => 'Abrindo arquivo';

  @override
  String get viewContactLabel => 'Ver contato';

  @override
  String get errorOpeningContact => 'Erro ao abrir contato';

  @override
  String get waLaunchError => 'Não foi possível abrir o WhatsApp';

  @override
  String get closeText => 'Fechar';

  @override
  String get defaultPresetName => 'Predefinição padrão';

  @override
  String get onLabel => 'Ligado';

  @override
  String get offLabel => 'Desligado';

  @override
  String get filterPresetTitle => 'Predefinições de filtro';

  @override
  String get addMorePresetsLabel => 'Adicionar predefinição';

  @override
  String get deleteAllPresetsLabel => 'excluir tudo';

  @override
  String get enablePresetsPlaceholderText =>
      'Ative as predefinições para criar e alternar facilmente entre vários filtros para personalizar rapidamente o registro de chamadas.';

  @override
  String get noPresetsPlaceholderText =>
      'Comece a criar suas próprias predefinições personalizadas para filtragem rápida';

  @override
  String get presetNameInputLabelText => 'Nome da predefinição';

  @override
  String get presetNameInputHintText => 'Digite um nome para a predefinição';

  @override
  String get defaultLabelText => 'Padrão';

  @override
  String get lastCallText => 'Última chamada';

  @override
  String get groupByContactAndTypeTitle => 'Agrupar por contato e tipo';

  @override
  String get groupByContactAndTypeDescription =>
      'As chamadas são agrupadas por contato e tipo de chamada';

  @override
  String get groupByContactOnlyConsecutiveTitle =>
      'Agrupar por contatos consecutivos';

  @override
  String get groupByContactOnlyConsecutiveDescription =>
      'Combina chamadas consecutivas do mesmo contato em um único grupo';

  @override
  String get groupByContactOnlyTitle => 'Agrupar por contato';

  @override
  String get groupByContactOnlyDescription =>
      'Agrupa todas as chamadas do mesmo contato';

  @override
  String get groupByNoneDescription =>
      'Sem agrupamento — cada chamada é exibida separadamente';

  @override
  String get callGroupingText => 'Agrupamento de chamadas';

  @override
  String get useGroupingSwitchText => 'Usar agrupamento com filtros';

  @override
  String get clearFiltersTooltip => 'Limpar filtros';

  @override
  String get scrollToTopTooltip => 'Rolar para o topo';

  @override
  String get watchListText => 'Lista de acompanhamento';

  @override
  String get roundDurationText => 'Arredondar chamadas para minutos';

  @override
  String get roundDurationTextSubtitle =>
      'Arredonde as chamadas para o minuto mais próximo para faturamento';

  @override
  String get groupedCallSettingSubtitle =>
      'Escolha como agrupar chamadas para facilitar o acompanhamento e a visão geral';

  @override
  String get filterPresetsSettingSubtitle =>
      'Crie, salve e reutilize filtros para encontrar chamadas facilmente';

  @override
  String get exportFilenameSettingSubtitle =>
      'Personalize como os arquivos exportados são nomeados';

  @override
  String get exportFormatSettingSubtitle =>
      'Escolha o formato dos registros de chamadas exportados';

  @override
  String get importCallLogsSettingSubtitle =>
      'Importar histórico de chamadas de outras fontes ou backups';

  @override
  String get appDetailsText => 'Informações e detalhes do app';

  @override
  String get appDetailsSubText => 'Versão • Doar • Relatar bug';

  @override
  String get enableDownloadConfirmationText => 'Confirmar download';

  @override
  String get enableDownloadConfirmationSubText =>
      'Solicitar confirmação antes de baixar arquivos';

  @override
  String get enableCallDurationFilteringText => 'Filtrar por duração';

  @override
  String get enableCallDurationFilteringSubText =>
      'Filtrar chamadas com base na duração';

  @override
  String get enableCallLogCountVisibilityText => 'Contagem de chamadas';

  @override
  String get enableCallLogCountVisibilitySubText =>
      'Exibir o número de chamadas por dia';

  @override
  String get enableFilterByAccountIdText => 'Filtrar por ID de conta';

  @override
  String get enableFilterByAccountIdSubText =>
      'Mostrar chamadas de um SIM ou conta específica';

  @override
  String get showTotalCallDurationText => 'Duração total das chamadas';

  @override
  String get showTotalCallDurationSubText =>
      'Exibir o tempo total gasto em chamadas';

  @override
  String get disableLogsSharingText => 'Ocultar botão de compartilhamento';

  @override
  String get disableLogsSharingSubText =>
      'Ocultar o botão de compartilhamento nos registros de chamadas';

  @override
  String get trackListLabelText => 'Lista de acompanhamento';

  @override
  String get tracklistPlaceholderText =>
      'Gerencie seus contatos rastreados de forma eficiente. Toque em + (canto superior direito) para adicionar um contato, deslize um item da lista para a esquerda e toque em Remover para parar de acompanhar.';

  @override
  String get removeAllText => 'remover tudo';

  @override
  String get trackContactLabelText => 'Nome do contato';

  @override
  String get trackContactText => 'Rastrear um contato';

  @override
  String get removeText => 'Remover';

  @override
  String get iteractionScoreText => 'Pontuação de interação';

  @override
  String get lastCallSinceText => 'Última chamada desde';

  @override
  String get avgCallsMonthText => 'Média de chamadas / mês';

  @override
  String get avgCallDurationText => 'Duração média de chamadas';

  @override
  String get peakCallDurationText => 'Duração máxima de chamadas';

  @override
  String get callsPerWeekText => 'Média de chamadas / semana';

  @override
  String get callDistByWeekDay =>
      'Distribuição de chamadas por dia da semana (%)';

  @override
  String addToTrackList(Object maxItems) {
    return 'Adicione até $maxItems contatos à sua lista de acompanhamento para facilitar o rastreamento.';
  }

  @override
  String get addText => 'Adicionar';

  @override
  String get numberAlreadyAddedErrorText => 'Contato já adicionado';

  @override
  String get invalidNumberErrorText => 'Número de telefone inválido';

  @override
  String get emptyPhoneNumberErrorText => 'Digite um nome de contato';

  @override
  String get trackNumberErrorText =>
      'Ocorreu um erro ao adicionar um novo contato à lista de acompanhamento';

  @override
  String get quickFilterText => 'Filtro rápido';
}
