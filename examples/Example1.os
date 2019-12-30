#Использовать "../src/core"

КлючиСинтаксическийКонтроль =
	"IncorrectReferences,
	|ThinClient,
	|WebClient,
	|Server,
	|ExternalConnection,
	|ExternalConnectionServer,
	|UnreferenceProcedures,
	|HandlersExistence,
	|EmptyHandlers";

КлючиРасширеннаяПроверка =
	"ExtendedModulesCheck,
	|CheckUseModality";

МенеджерПроверок = Новый МенеджерПлатформенныхПроверок();
МенеджерПроверок
	.КонтекстБазыИсточника("C:\Repo\Test\CI\dontpush\dev_base", "Admin", "")
	.КаталогИсходныхКодов("C:\Repo\Test\src\conf")
	.ВремяОжидания(60) // 1 мин
	.МаксимальноеВремяОжидания(5400) // 1,5 час
	.НачатьПроверку(КлючиСинтаксическийКонтроль)
	.НачатьПроверку(КлючиРасширеннаяПроверка)
	.ЗавершитьВсеПроверки();

ГенераторОтчета = Новый ГенераторОтчетaSonarQube();
ГенераторОтчета.ВыгрузитьОшибкиВФайл(МенеджерПроверок.ТаблицаОшибок(),
	"UH", "C:\Repo\Test\platform-json.json");
