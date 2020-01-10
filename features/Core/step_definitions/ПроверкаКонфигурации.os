#Использовать v8runner
#Использовать tempfiles
#Использовать fs

// Реализация шагов BDD-фич/сценариев c помощью фреймворка https://github.com/artbear/1bdd

Перем БДД; //контекст фреймворка 1bdd

// Метод выдает список шагов, реализованных в данном файле-шагов
Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	БДД = КонтекстФреймворкаBDD;

	ВсеШаги = Новый Массив;

	ВсеШаги.Добавить("ЯСохраняюПутьКИсходнымКодамТестовойКонфигурацииВ");
	ВсеШаги.Добавить("ЯСохраняюРезультатТестовойПроверкиВПеременную");
	ВсеШаги.Добавить("ЯСохраняюФильтрФайловИсходныхКодовВПеременной");
	ВсеШаги.Добавить("ЯСоздаюВременнуюБазуИСохраняюВПеременную");
	ВсеШаги.Добавить("ЯЗагружаюКонфигурациюИзФайловВКаталогеВБазу");
	ВсеШаги.Добавить("ЯСоздаюОбъектУправлениеКонфигураторомДляВременнойБазыИСохраняюВПеременную");
	ВсеШаги.Добавить("ЯСоздаюМенеджерПроверок");
	ВсеШаги.Добавить("ЯУстанавливаюДляПроверокКонтекстБазыИсточника");
	ВсеШаги.Добавить("ЯУстанавливаюДляПроверокКонфигураторБазыИсточника");
	ВсеШаги.Добавить("ЯУстанавливаюДляПроверокКаталогИсходныхКодов");
	ВсеШаги.Добавить("ЯСоздаюБазуДляПроверокИзФайловИсходныхКодов");
	ВсеШаги.Добавить("ЯУстанавливаюДляПроверокВремяОжидания");
	ВсеШаги.Добавить("ЯУстанавливаюДляПроверокМаксимальноеВремяОжидания");
	ВсеШаги.Добавить("ЯДобавляюФильтрФайловИзПеременной");
	ВсеШаги.Добавить("ЯНачинаюПроверкуСКлючами");
	ВсеШаги.Добавить("ЯДобавляюРезультатПроверкиИзПеременнойСКлючами");
	ВсеШаги.Добавить("ЯсохраняюРезультатЗавершенныхПроверокВПеременной");
	ВсеШаги.Добавить("КоличествоСтрокВТаблицеРавно");

	Возврат ВсеШаги;
КонецФункции

// Реализация шагов

// Процедура выполняется перед запуском каждого сценария
Процедура ПередЗапускомСценария(Знач Узел) Экспорт
	
КонецПроцедуры

// Процедура выполняется после завершения каждого сценария
Процедура ПослеЗапускаСценария(Знач Узел) Экспорт

КонецПроцедуры

//Я сохраняю путь к исходным кодам тестовой конфигурации в "КаталогИсходников"
Процедура ЯСохраняюПутьКИсходнымКодамТестовойКонфигурацииВ(ИмяПеременнойИсходников) Экспорт

	ПутьККаталогу = ВременныеФайлы.СоздатьКаталог();
	ПутьККаталогуЭталону = ОбъединитьПути(БДД.КаталогПроверяемогоПроекта(), "tests\fixtures\testbase\src");
	ФС.КопироватьСодержимоеКаталога(ПутьККаталогуЭталону, ПутьККаталогу);
	БДД.СохранитьВКонтекст(ИмяПеременнойИсходников, ПутьККаталогу);

КонецПроцедуры

//Я сохраняю результат тестовой проверки в переменную "РезультатПроверки"
Процедура ЯСохраняюРезультатТестовойПроверкиВПеременную(ИмяПеременнойРезультатаПроверки) Экспорт

	ПутьКРезультату = ВременныеФайлы.НовоеИмяФайла("log");
	ПутьКРезультатуЭталону = ОбъединитьПути(БДД.КаталогПроверяемогоПроекта(), "tests\fixtures\testbase\result.log");
	КопироватьФайл(ПутьКРезультатуЭталону, ПутьКРезультату);
	БДД.СохранитьВКонтекст(ИмяПеременнойРезультатаПроверки, ПутьКРезультату);

КонецПроцедуры

//Я сохраняю фильтр файлов исходных кодов в переменной "ФильтрФайлов"
Процедура ЯСохраняюФильтрФайловИсходныхКодовВПеременной(ИмяПеременойФильтра) Экспорт

	ПутьКФильтру = ВременныеФайлы.НовоеИмяФайла("txt");
	ПутьКФильтруЭталону = ОбъединитьПути(БДД.КаталогПроверяемогоПроекта(), "tests\fixtures\testbase\src_files.txt");
	КопироватьФайл(ПутьКФильтруЭталону, ПутьКФильтру);
	БДД.СохранитьВКонтекст(ИмяПеременойФильтра, ПутьКФильтру);

КонецПроцедуры

//Я создаю временную базу и сохраняю в переменную "ВременнаяБаза"
Процедура ЯСоздаюВременнуюБазуИСохраняюВПеременную(Знач ИмяПеременнойБазы) Экспорт

	ПутьКВременнойБазе = ВременныеФайлы.СоздатьКаталог();

	УправлениеКонфигуратором = Новый УправлениеКонфигуратором;
	УправлениеКонфигуратором.СоздатьФайловуюБазу(ПутьКВременнойБазе);

	БДД.СохранитьВКонтекст(ИмяПеременнойБазы, ПутьКВременнойБазе);

КонецПроцедуры

//И Я создаю объект УправлениеКонфигуратором для временной базы "КаталогБазы" и сохраняю в переменную "КонтекстБазы"
Процедура ЯСоздаюОбъектУправлениеКонфигураторомДляВременнойБазыИСохраняюВПеременную(ИмяПеременнойБазы, ИмяПеременнойКонфигуратора) Экспорт

	ВременнаяБаза = БДД.ПолучитьИзКонтекста(ИмяПеременнойБазы);

	УправлениеКонфигуратором = Новый УправлениеКонфигуратором();
	УправлениеКонфигуратором.УстановитьКонтекст(СтрШаблон("/F""%1""", ВременнаяБаза), "", "");

	БДД.СохранитьВКонтекст(ИмяПеременнойКонфигуратора, УправлениеКонфигуратором);

КонецПроцедуры

//Я загружаю конфигурацию из файлов в каталоге "КаталогИсходников" в базу "ВременнаяБаза"
Процедура ЯЗагружаюКонфигурациюИзФайловВКаталогеВБазу(ИмяПеременнойИсходников, ИмяПеременнойБазы) Экспорт

	КаталогИсходников = БДД.ПолучитьИзКонтекста(ИмяПеременнойИсходников);
	ВременнаяБаза = БДД.ПолучитьИзКонтекста(ИмяПеременнойБазы);

	УправлениеКонфигуратором = Новый УправлениеКонфигуратором;
	УправлениеКонфигуратором.УстановитьКонтекст(СтрШаблон("/F%1", ВременнаяБаза), "", "");
	УправлениеКонфигуратором.ЗагрузитьКонфигурациюИзФайлов(КаталогИсходников, "", "", Ложь);

КонецПроцедуры

//Я создаю менеджер проверок
Процедура ЯСоздаюМенеджерПроверок() Экспорт

	МенеджерПроверок = Новый МенеджерПлатформенныхПроверок();
	БДД.СохранитьВКонтекст("МенеджерПроверок", МенеджерПроверок);

КонецПроцедуры

//Я устанавливаю для проверок контекст базы источника "КаталогБазы" 
Процедура ЯУстанавливаюДляПроверокКонтекстБазыИсточника(ИмяПеременнойБазы) Экспорт

	КаталогБазы = БДД.ПолучитьИзКонтекста(ИмяПеременнойБазы);
	МенеджерПроверок = БДД.ПолучитьИзКонтекста("МенеджерПроверок");
	МенеджерПроверок.КонтекстБазыИсточника(КаталогБазы, "", "");

КонецПроцедуры

//Я устанавливаю для проверок конфигуратор базы источника "КонфигураторБазы"
Процедура ЯУстанавливаюДляПроверокКонфигураторБазыИсточника(ИмяПеременнойКонфигуратора) Экспорт

	КонфигураторБазыИсточника = БДД.ПолучитьИзКонтекста(ИмяПеременнойКонфигуратора);
	МенеджерПроверок = БДД.ПолучитьИзКонтекста("МенеджерПроверок");
	МенеджерПроверок.КонфигураторБазыИсточника(КонфигураторБазыИсточника);

КонецПроцедуры

//Я устанавливаю для проверок каталог исходных кодов "КаталогИсходников" 
Процедура ЯУстанавливаюДляПроверокКаталогИсходныхКодов(ИмяПеременнойИсходников) Экспорт

	КаталогИсходников = БДД.ПолучитьИзКонтекста(ИмяПеременнойИсходников);
	МенеджерПроверок = БДД.ПолучитьИзКонтекста("МенеджерПроверок");
	МенеджерПроверок.КаталогИсходныхКодов(КаталогИсходников);

КонецПроцедуры

//Я создаю базу для проверок из файлов исходных кодов
Процедура ЯСоздаюБазуДляПроверокИзФайловИсходныхКодов() Экспорт

	МенеджерПроверок = БДД.ПолучитьИзКонтекста("МенеджерПроверок");
	МенеджерПроверок.СоздатьБазуИсточникаИзИсходныхКодов();

КонецПроцедуры

//Я устанавливаю для проверок время ожидания 60
Процедура ЯУстанавливаюДляПроверокВремяОжидания(ВремяОжидания) Экспорт

	МенеджерПроверок = БДД.ПолучитьИзКонтекста("МенеджерПроверок");
	МенеджерПроверок.ВремяОжидания(ВремяОжидания);

КонецПроцедуры

//Я устанавливаю для проверок максимальное время ожидания 5400
Процедура ЯУстанавливаюДляПроверокМаксимальноеВремяОжидания(МаксимальноеВремяОжидания) Экспорт

	МенеджерПроверок = БДД.ПолучитьИзКонтекста("МенеджерПроверок");
	МенеджерПроверок.МаксимальноеВремяОжидания(МаксимальноеВремяОжидания);

КонецПроцедуры

//Я добавляю фильтр файлов из переменной "ФильтрФайлов"
Процедура ЯДобавляюФильтрФайловИзПеременной(ИмяПеременнойФильтра) Экспорт

	МенеджерПроверок = БДД.ПолучитьИзКонтекста("МенеджерПроверок");
	ПутьКФайлуФильтра = БДД.ПолучитьИзКонтекста(ИмяПеременнойФильтра);
	МенеджерПроверок.ДобавитьФильтр(Новый ФильтрФайловПоСписку(ПутьКФайлуФильтра));

КонецПроцедуры 

//Я начинаю проверку с ключами "КлючиПроверки"
Процедура ЯНачинаюПроверкуСКлючами(КлючиПроверки) Экспорт

	МенеджерПроверок = БДД.ПолучитьИзКонтекста("МенеджерПроверок");
	МенеджерПроверок.НачатьПроверку(КлючиПроверки);

КонецПроцедуры

//Я Добавляю результат проверки из переменной "РезультатПроверки" с ключами "КлючиПроверки" 
Процедура ЯДобавляюРезультатПроверкиИзПеременнойСКлючами(ИмяПеременнойРезультата, КлючиПроверки) Экспорт

	МенеджерПроверок = БДД.ПолучитьИзКонтекста("МенеджерПроверок");
	ФайлРезультатаПроверки = БДД.ПолучитьИзКонтекста(ИмяПеременнойРезультата);
	МенеджерПроверок.ДобавитьРезультатПроверки(КлючиПроверки, ФайлРезультатаПроверки);

КонецПроцедуры

//Я сохраняю результат завершенных проверок в переменной "ТаблицуОшибок"
Процедура ЯсохраняюРезультатЗавершенныхПроверокВПеременной(ИмяПеременнойОшибок) Экспорт

	МенеджерПроверок = БДД.ПолучитьИзКонтекста("МенеджерПроверок");
	МенеджерПроверок.ЗавершитьВсеПроверки();

	ТаблицаОшибок = МенеджерПроверок.ТаблицаОшибок();
	БДД.СохранитьВКонтекст(ИмяПеременнойОшибок, ТаблицаОшибок);

КонецПроцедуры

//Количество строк в таблице "ТаблицаОшибок" равно 17
Процедура КоличествоСтрокВТаблицеРавно(ИмяПеременнойОшибок, ОжидаемоеКоличество) Экспорт

	ТаблицаОшибок = БДД.ПолучитьИзКонтекста(ИмяПеременнойОшибок);

	Ожидаем.Что(ТаблицаОшибок).ИмеетДлину(ОжидаемоеКоличество);

КонецПроцедуры