// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get aboutText => 'Acerca de';

  @override
  String get advancedSettingsLabelText => 'Configuración Avanzada';

  @override
  String get analyticsPolicyLabelText => 'Política de Análisis';

  @override
  String get analyticsPolicyText =>
      'Todos los datos del registro de llamadas se analizan localmente en tu dispositivo y nunca se transmiten a servidores en línea, lo que garantiza tu privacidad y mantiene tu información segura y confidencial';

  @override
  String get analyticsScreenLabelText => 'Análisis';

  @override
  String get appError => '¡Ah, vaya! Algo salió mal';

  @override
  String get appTitle => 'Logger';

  @override
  String get applyFiltersText => 'Aplicar Filtros';

  @override
  String get baseGhostErrorMessage => 'Algo salió mal';

  @override
  String get baseSettingsLabelText => 'Configuración General';

  @override
  String get blockedText => 'Bloqueado';

  @override
  String get callLogsExportFailureText => '¡Error al descargar el archivo!';

  @override
  String get callLogsExportFormatLabelText =>
      'Formato de exportación de registros de llamadas';

  @override
  String get callLogsExportSuccessText =>
      'Registros de llamadas extraídos y descargados correctamente';

  @override
  String get callTypeText => 'Tipo de Llamada';

  @override
  String get cancelText => 'Cancelar';

  @override
  String get configureText => 'Configurar';

  @override
  String get confirmImportLabelText => 'Confirmar Inicio de Importación';

  @override
  String get confirmImportText =>
      'Importar registros de llamadas es una tarea importante que puede dañar irreversiblemente tus registros actuales, sobrescribir datos y causar inconsistencias en tu historial. Ten en cuenta que este proceso puede llevar algún tiempo y podría provocar los problemas mencionados anteriormente. Procede con precaución.';

  @override
  String get continueText => 'Continuar';

  @override
  String get dateText => 'Fecha';

  @override
  String get donateText => 'Donar';

  @override
  String downloadConfirmationText(String currentImportType) {
    return '¿Estás seguro de que quieres descargar tus registros de llamadas en formato $currentImportType? Esta acción guardará tu historial de llamadas en un archivo $currentImportType en tu dispositivo.';
  }

  @override
  String get downloadText => 'Descargar';

  @override
  String get dtAAcronymExapandedText => 'Nombre completo del día de la semana';

  @override
  String get dtBAcronymExapandedText => 'Nombre completo del mes';

  @override
  String get dtHAcronymExapandedText => 'Hora en formato de 24 horas';

  @override
  String get dtIAcronymExapandedText => 'Hora en formato de 12 horas';

  @override
  String get dtMAcronymExapandedText => 'Minutos';

  @override
  String get dtSAcronymExapandedText => 'Segundos';

  @override
  String get dtUAcronymExapandedText =>
      'Número de semana del año (domingo como primer día de la semana)';

  @override
  String get dtWAcronymExapandedText =>
      'Número de semana del año (lunes como primer día de la semana)';

  @override
  String get dtXAcronymExapandedText => 'Representación de la hora';

  @override
  String get dtYAcronymExapandedText => 'Año con siglo';

  @override
  String get dtZAcronymExapandedText => 'Nombre de la zona horaria';

  @override
  String get dtaAcronymExapandedText => 'Nombre abreviado del día de la semana';

  @override
  String get dtbAcronymExapandedText => 'Nombre abreviado del mes';

  @override
  String get dtcAcronymExapandedText => 'Representación de fecha y hora';

  @override
  String get dtdAcronymExapandedText => 'Día del mes';

  @override
  String get dtfAcronymExapandedText => 'Milisegundos';

  @override
  String get dtjAcronymExapandedText => 'Día del año';

  @override
  String get dtmAcronymExapandedText => 'Mes como número';

  @override
  String get dtpAcronymExapandedText => 'Marcador AM/PM';

  @override
  String get dtxAcronymExapandedText => 'Representación de la fecha';

  @override
  String get dtyAcronymExapandedText => 'Año sin siglo';

  @override
  String get dtzAcronymExapandedText =>
      'Desplazamiento de la zona horaria desde UTC';

  @override
  String get durationText => 'Duración';

  @override
  String get exploreNowText => 'Explorar ahora';

  @override
  String get exploreProjectButtonText => 'Explorar proyecto en Github';

  @override
  String get exportFileNameFormatLabelText =>
      'Formato de nombre de archivo de exportación';

  @override
  String get filenameFormatHintText => 'mis-registros-de-llamadas-[%token]';

  @override
  String get filenameFormatLabelText => 'Formato de nombre de archivo';

  @override
  String get filterText => 'Filtro';

  @override
  String get getStartedText => 'Comenzar';

  @override
  String get ghostErrorMessage => 'Hmm. Algo salió mal';

  @override
  String get hideText => 'Ocultar';

  @override
  String get hintMobileNumberText => '1XX XXX';

  @override
  String get importCallLogsText => 'Importar tus registros de llamadas';

  @override
  String get incomingText => 'Entrante';

  @override
  String get logsScreenLabelText => 'Registros';

  @override
  String get maximumDurationHintText => 'ej: 60';

  @override
  String get maximumDurationLabelText => 'Máx (en seg)';

  @override
  String get minimumDurationHintText => 'ej: 0';

  @override
  String get minimumDurationLabelText => 'Min (en seg)';

  @override
  String get missedText => 'Perdida';

  @override
  String get mobileNumberText => 'Número de Móvil';

  @override
  String get nextText => 'Siguiente';

  @override
  String get onboardingScreenFourSubtitle =>
      'Transfiere sin problemas los registros de llamadas entre dispositivos o expórtalos para guardarlos y analizarlos.';

  @override
  String get onboardingScreenFourTitle => 'Importar y Exportar';

  @override
  String get onboardingScreenOneSubtitle =>
      'Tu aplicación ideal para administrar y analizar tus registros de llamadas sin esfuerzo.';

  @override
  String get onboardingScreenOneTitle => '¡Bienvenido a Logger!';

  @override
  String get onboardingScreenThreeSubtitle =>
      'Comprende tus patrones de llamadas como nunca antes y obtén información detallada para optimizar tu tiempo.';

  @override
  String get onboardingScreenThreeTitle => 'Analiza tus llamadas';

  @override
  String get onboardingScreenTwoSubtitle =>
      'Busca, filtra y administra tus registros de llamadas con una interfaz fluida e intuitiva.';

  @override
  String get onboardingScreenTwoTitle => 'Gestionar Registros de Llamadas';

  @override
  String get openText => 'Abrir';

  @override
  String get outgoingText => 'Saliente';

  @override
  String get phoneAccountIdText => 'ID de Cuenta Telefónica';

  @override
  String get platformNameText => 'Android';

  @override
  String get platformText => 'plataforma';

  @override
  String get randomDTRepr => 'vie, 12 jul 2024 14:15:00';

  @override
  String get randomMonthAbbr => 'jul';

  @override
  String get randomMonthName => 'julio';

  @override
  String get randomWeekdayAbbr => 'vie';

  @override
  String get randomWeekdayName => 'viernes';

  @override
  String get refreshText => 'Actualizar';

  @override
  String get rejectedText => 'Rechazada';

  @override
  String get reportIssueButtonText => 'Informar de un problema o error';

  @override
  String get resetText => 'Restablecer';

  @override
  String get resetToDefaultText => 'Restablecer a valores predeterminados';

  @override
  String get saveText => 'Guardar';

  @override
  String get settingsScreenLabelText => 'Configuración';

  @override
  String get shareText => 'Compartir';

  @override
  String get simText => 'Nombre de visualización de SIM';

  @override
  String get skipText => 'Omitir';

  @override
  String get startImportText => 'Iniciar Importación';

  @override
  String get storagePolicyLabelText => 'Política de Almacenamiento';

  @override
  String get storagePolicyText =>
      'Esta aplicación almacena temporalmente los archivos generados y los elimina al salir. Puedes descargar los registros de llamadas en la ubicación que elijas. Logger solo accede a los registros de llamadas, lo que garantiza tu privacidad.';

  @override
  String get supportedFormatInformation =>
      'Ten en cuenta: Solo el formato CSV es compatible actualmente para importar registros de llamadas.';

  @override
  String get timeText => 'Hora';

  @override
  String get tokenAccordianText => 'tokens de formato de fecha y hora';

  @override
  String get tokensInfoText =>
      'Puedes utilizar los tokens proporcionados para personalizar el formato de nombre de archivo según tus preferencias específicas de fecha y hora.';

  @override
  String get unknownText => 'Desconocido';

  @override
  String get versionText => 'versión';

  @override
  String get viewText => 'Ver';

  @override
  String get wifiIncomingText => 'Wifi Entrante';

  @override
  String get wifiOutgoingText => 'Wifi Saliente';

  @override
  String get callStatsText => 'Estadísticas de Llamadas';

  @override
  String get callDurationText => 'Duración de la llamada';

  @override
  String get mostCalledNumberText => 'Número más Llamado';

  @override
  String get callDirectionAnalysisText =>
      'Análisis de la Dirección de Llamadas';

  @override
  String get longestCallText => 'Llamada más Larga';

  @override
  String topNLongestCalls(int n) {
    return 'Top $n Llamadas más Largas';
  }

  @override
  String get callText => 'Llamar';

  @override
  String get smsText => 'SMS';

  @override
  String get nothingToDisplayText => 'Nada que mostrar';

  @override
  String get callsMadeText => 'Llamadas Realizadas';

  @override
  String get callsReceivedText => 'Llamadas Recibidas';

  @override
  String get callsMissedText => 'Llamadas Perdidas';

  @override
  String get callsRejectedText => 'Llamadas Rechazadas';

  @override
  String get callsBlockedText => 'Llamadas Bloqueadas';

  @override
  String get averageText => 'Promedio';

  @override
  String get longestText => 'Más Larga';

  @override
  String get totalText => 'Total';

  @override
  String get todayText => 'Hoy';

  @override
  String get yesterdayText => 'Ayer';

  @override
  String get thisMonthText => 'Este Mes';

  @override
  String get pastMonthText => 'Mes Pasado';

  @override
  String get thisYearText => 'Este Año';

  @override
  String get pastYearText => 'Año Pasado';

  @override
  String get allTimeText => 'Todo el Tiempo';

  @override
  String get customText => 'Personalizado';

  @override
  String get startDateText => 'Fecha de inicio';

  @override
  String get endDateText => 'Fecha de finalización';

  @override
  String get dateRangeText => 'Rango de fechas';

  @override
  String get searchByNumberText => 'Número de Teléfono Específico';

  @override
  String get phoneAccountIdFilterText => 'ID de cuenta telefónica';

  @override
  String get filterByDurationText => 'Filtrar por Duración de la Llamada';

  @override
  String get filterByCallTypeText => 'Tipo de llamada';

  @override
  String get answeredExternallyText => 'Contestada Externamente';

  @override
  String get voiceMailText => 'Correo de Voz';

  @override
  String get exportOpenHintText => 'Exportar Abierto';

  @override
  String get anyText => 'Cualquiera';

  @override
  String get processingFileText => 'Procesando archivo';

  @override
  String get insertingLogsText => 'Insertando registros';

  @override
  String get takingMoreTimeText => 'Esto puede tardar más';

  @override
  String get pleaseWaitText => 'Por favor, espere';

  @override
  String get importSuccessMessageText =>
      'Registros de llamadas importados correctamente';

  @override
  String get failedToUpdateSettingsText =>
      'No se pudo actualizar la configuración. Por favor, inténtelo de nuevo más tarde';

  @override
  String get shareSettingUpdateSuccessMsgText =>
      'Configuración de uso compartido actualizada correctamente.';

  @override
  String get downloadSettingUpdatedSuccessMsgText =>
      'Configuración de descarga actualizada correctamente.';

  @override
  String get settingUpdateSuccessMsgText =>
      'Configuración actualizada correctamente.';

  @override
  String get durationFilterSettingUpdatedSuccessMsgText =>
      'Configuración de filtro de duración actualizada correctamente.';

  @override
  String get filterByPhoneAccountIdSettingUpdatedSuccessMsgText =>
      'Configuración de filtro por ID de cuenta telefónica actualizada correctamente.';

  @override
  String get generalSettingUpdatedSuccessMsgText =>
      'Configuración actualizada correctamente.';

  @override
  String get importSettingUpdatedSuccessMsgText =>
      'Configuración de importación actualizada correctamente.';

  @override
  String get exportFieldInfoText => 'Información de los campos de exportación';

  @override
  String get csvJsonExportNameField =>
      'Nombre asociado a la entrada del registro de llamadas';

  @override
  String get csvJsonExportPhoneAccountIdField =>
      'El ID de la cuenta telefónica asociada a la llamada identifica la cuenta o tarjeta SIM específica utilizada para realizar o recibir la llamada';

  @override
  String get csvJsonExportCallTypeField =>
      'Tipo de llamada (p. ej., entrante, saliente, perdida)';

  @override
  String get csvJsonExportNumberField =>
      'Número de teléfono asociado a la entrada del registro de llamadas';

  @override
  String get csvJsonExportFormattedNumberField =>
      'Número de teléfono formateado, con reglas de formato basadas en el país en el que se encontraba el usuario cuando realizó o recibió la llamada.';

  @override
  String get csvJsonExportSimDisplayField =>
      'Nombre de visualización de la tarjeta SIM asociada a la llamada';

  @override
  String get csvJsonExportTimestampField =>
      'Marca de tiempo (tiempo de época) de la llamada';

  @override
  String get csvJsonExportDurationField => 'Duración de la llamada en segundos';

  @override
  String get csvJsonExportCachedNumberLabelField =>
      'Etiqueta asociada al número de teléfono almacenado en caché';

  @override
  String get csvJsonExportCachedNumberTypeField =>
      'El tipo de número almacenado en caché (casa, trabajo, etc.) asociado al número de teléfono, si existe.';

  @override
  String get csvJsonExportCachedMatchedNumberField =>
      'Número de teléfono almacenado o en caché asociado a una entrada del registro de llamadas para una referencia rápida.';

  @override
  String get exportFieldInfoHintText =>
      'Información de los campos de exportación';

  @override
  String get naText => 'n/A';

  @override
  String get confirmDownloadText => 'Confirmar descarga';

  @override
  String get mostReceivedNumberText => 'Número más recibido';

  @override
  String get confirmContactsSyncLabelText =>
      'Confirmar sincronización de contactos';

  @override
  String get confirmContactsSyncConfirmationText =>
      'Este proceso escaneará tus registros de llamadas y actualizará los nombres de contacto faltantes coincidiéndolos con tus contactos guardados. No modificará ningún otro detalle en tu historial de llamadas.';

  @override
  String get contactsSyncSuccessMessageText =>
      'Contactos sincronizados con éxito con los registros de llamadas';

  @override
  String get contactsSyncErrorMessageText =>
      '¡Error al sincronizar los contactos!';

  @override
  String get contactsPermissionDenied =>
      '¡Permiso para acceder a los contactos denegado!';

  @override
  String get syncContactsLabelText =>
      'Sincronizar contactos del registro de llamadas';

  @override
  String get syncContactsCTAText => 'Sincronizar ahora';

  @override
  String get softwareInformationText => 'Información del software';

  @override
  String get addToContactsText => 'Agregar a contactos';

  @override
  String get addToContactsErrorText => 'No se pudo agregar un nuevo contacto';

  @override
  String get appPermissionsDeniedError =>
      '¡Vaya! Parece que se ha denegado el acceso a los registros de llamadas. Para que Logger funcione correctamente, concede permiso.';

  @override
  String get appFatalError => '¡Vaya! Algo inesperado sucedió.';

  @override
  String get appPreferencesError => '¡Vaya! Error al cargar las preferencias.';

  @override
  String get uriPermissionError => 'No se pudieron obtener permisos';

  @override
  String get fileGenerationError =>
      'Ocurrió un error al generar el archivo. Inténtelo de nuevo más tarde';

  @override
  String get fileShareMessage =>
      'Comparta el archivo de registros de llamadas a través de Gmail, WhatsApp, etc...';

  @override
  String get fileShareSubject => 'Registros de llamadas';

  @override
  String get fileOpenError =>
      'No se pudo abrir el archivo, inténtelo de nuevo más tarde';

  @override
  String get openingFileLabel => 'Abriendo archivo';

  @override
  String get viewContactLabel => 'Ver contacto';

  @override
  String get errorOpeningContact => 'Error al abrir el contacto';

  @override
  String get waLaunchError => 'No se pudo abrir WhatsApp';

  @override
  String get closeText => 'Cerrar';

  @override
  String get defaultPresetName => 'Ajuste preestablecido predeterminado';

  @override
  String get onLabel => 'Encendido';

  @override
  String get offLabel => 'Apagado';

  @override
  String get filterPresetTitle => 'Preajustes de filtro';

  @override
  String get addMorePresetsLabel => 'Agregar preajuste';

  @override
  String get deleteAllPresetsLabel => 'eliminar todo';

  @override
  String get enablePresetsPlaceholderText =>
      'Habilite los preajustes para crear y cambiar fácilmente entre múltiples filtros para una personalización rápida del registro de llamadas.';

  @override
  String get noPresetsPlaceholderText =>
      'Empieza a crear tus propios preajustes personalizados para filtrado rápido';

  @override
  String get presetNameInputLabelText => 'Nombre del preajuste';

  @override
  String get presetNameInputHintText => 'Ingrese un nombre para el preajuste';

  @override
  String get defaultLabelText => 'Predeterminado';

  @override
  String get lastCallText => 'Última llamada';

  @override
  String get groupByContactAndTypeTitle => 'Agrupar por contacto y tipo';

  @override
  String get groupByContactAndTypeDescription =>
      'Las llamadas se agrupan por contacto y tipo de llamada';

  @override
  String get groupByContactOnlyConsecutiveTitle =>
      'Agrupar por contactos consecutivos';

  @override
  String get groupByContactOnlyConsecutiveDescription =>
      'Combina llamadas consecutivas del mismo contacto en un solo grupo';

  @override
  String get groupByContactOnlyTitle => 'Agrupar por contacto';

  @override
  String get groupByContactOnlyDescription =>
      'Agrupa todas las llamadas del mismo contacto';

  @override
  String get groupByNoneDescription =>
      'Sin agrupación: cada llamada se muestra por separado';

  @override
  String get callGroupingText => 'Agrupación de llamadas';

  @override
  String get useGroupingSwitchText => 'Usar agrupación con filtros';

  @override
  String get clearFiltersTooltip => 'Borrar filtros';

  @override
  String get scrollToTopTooltip => 'Desplazarse arriba';

  @override
  String get watchListText => 'Lista de seguimiento';

  @override
  String get roundDurationText => 'Redondear llamadas a minutos';

  @override
  String get roundDurationTextSubtitle =>
      'Redondea las llamadas al minuto más cercano para facturación';

  @override
  String get groupedCallSettingSubtitle =>
      'Elija cómo agrupar las llamadas para un seguimiento y vista general más fácil';

  @override
  String get filterPresetsSettingSubtitle =>
      'Cree, guarde y reutilice filtros para encontrar llamadas fácilmente';

  @override
  String get exportFilenameSettingSubtitle =>
      'Personalice cómo se nombran los archivos exportados';

  @override
  String get exportFormatSettingSubtitle =>
      'Elija el formato para los registros de llamadas exportados';

  @override
  String get importCallLogsSettingSubtitle =>
      'Importar historial de llamadas desde otras fuentes o copias de seguridad';

  @override
  String get appDetailsText => 'Información y detalles de la app';

  @override
  String get appDetailsSubText => 'Versión • Donar • Informe de errores';

  @override
  String get enableDownloadConfirmationText => 'Confirmar descarga';

  @override
  String get enableDownloadConfirmationSubText =>
      'Solicitar confirmación antes de descargar archivos';

  @override
  String get enableCallDurationFilteringText => 'Filtrado por duración';

  @override
  String get enableCallDurationFilteringSubText =>
      'Filtrar llamadas según su duración';

  @override
  String get enableCallLogCountVisibilityText => 'Número de llamadas';

  @override
  String get enableCallLogCountVisibilitySubText =>
      'Mostrar la cantidad de llamadas por día';

  @override
  String get enableFilterByAccountIdText => 'Filtrar por ID de cuenta';

  @override
  String get enableFilterByAccountIdSubText =>
      'Mostrar llamadas de una SIM o cuenta específica';

  @override
  String get showTotalCallDurationText => 'Duración total de llamadas';

  @override
  String get showTotalCallDurationSubText =>
      'Mostrar el tiempo total de las llamadas';

  @override
  String get disableLogsSharingText => 'Ocultar botón de compartir';

  @override
  String get disableLogsSharingSubText =>
      'Ocultar el botón de compartir en el historial de llamadas';

  @override
  String get trackListLabelText => 'Lista de seguimiento';

  @override
  String get tracklistPlaceholderText =>
      'Administra tu lista de seguimiento de manera eficiente. Toca + (arriba a la derecha) para agregar un número, desliza a la izquierda sobre un elemento de la lista y toca Eliminar para dejar de seguir.';

  @override
  String get removeAllText => 'eliminar todo';

  @override
  String get trackContactLabelText => 'Número de teléfono';

  @override
  String get trackContactText => 'Rastrear un contacto';

  @override
  String get removeText => 'Eliminar';

  @override
  String get iteractionScoreText => 'Puntaje de interacción';

  @override
  String get lastCallSinceText => 'Última llamada desde';

  @override
  String get avgCallsMonthText => 'Promedio de llamadas / mes';

  @override
  String get avgCallDurationText => 'Duración promedio de llamadas';

  @override
  String get peakCallDurationText => 'Duración máxima de llamadas';

  @override
  String get callsPerWeekText => 'Promedio de llamadas / semana';

  @override
  String get callDistByWeekDay =>
      'Distribución de llamadas por día de la semana (%)';

  @override
  String addToTrackList(Object maxItems) {
    return 'Agrega hasta $maxItems contactos a tu lista de seguimiento para un seguimiento fácil.';
  }

  @override
  String get addText => 'Agregar';

  @override
  String get numberAlreadyAddedErrorText => 'Número ya agregado';

  @override
  String get invalidNumberErrorText => 'Número de teléfono inválido';

  @override
  String get emptyPhoneNumberErrorText => 'Ingrese un número de teléfono';

  @override
  String get trackNumberErrorText =>
      'Ocurrió un error al agregar el nuevo contacto de seguimiento';

  @override
  String get quickFilterText => 'Filtro rápido';
}
