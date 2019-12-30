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

ФильтрПроверки = Новый ФильтрФайловПоСписку("C:\Repo\Test\CI\dontpush\src_files.txt");

МенеджерПроверок = Новый МенеджерПлатформенныхПроверок();
МенеджерПроверок
	.КаталогИсходныхКодов("C:\Repo\Test\src\conf")
	.ДобавитьРезультатПроверки(КлючиСинтаксическийКонтроль, "C:\Repo\test\platform-errors.txt")
	.УстановитьФильтр(ФильтрПроверки)
	.ЗавершитьВсеПроверки();

ГенераторОтчета = Новый ГенераторОтчетaSonarQube();
ГенераторОтчета.ВыгрузитьОшибкиВФайл(МенеджерПроверок.ТаблицаОшибок(),
	"UH", "C:\Repo\Test\platform-json.json");
