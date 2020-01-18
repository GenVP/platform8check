// Сохранение настроек в JSON файл

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

Настройки = Новый Структура();
Настройки.Вставить("Wait", 5);
Настройки.Вставить("MaxWait", 600);
Настройки.Вставить("Keys", Новый Массив);
Настройки.Ключи.Добавить(КлючиСинтаксическийКонтроль);
Настройки.Вставить("Project", "UH");
Настройки.Вставить("SonarQubeReport", "C:\Repo\Test\platform-json.json");

ЗаписьJSON = Новый ЗаписьJSON;
ЗаписьJSON.ОткрытьФайл("C:\Repo\Test\platform-config.json");
ЗаписатьJSON(ЗаписьJSON, Настройки);
ЗаписьJSON.Закрыть();



