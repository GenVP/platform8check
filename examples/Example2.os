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

МенеджерПроверок = Новый МенеджерПлатформенныхПроверок();
МенеджерПроверок
	.КаталогИсходныхКодов("C:\Repo\Test\src\conf")
	.ДобавитьРезультатПроверки(КлючиСинтаксическийКонтроль, "C:\Repo\test\platform-errors.txt")
	.ЗавершитьВсеПроверки();

ГенераторОтчета = Новый ГенераторОтчетaSonarQube();
ГенераторОтчета.ВыгрузитьОшибкиВФайл(МенеджерПроверок.ТаблицаОшибок(),
	"UH", "C:\Repo\Test\platform-json.json");
