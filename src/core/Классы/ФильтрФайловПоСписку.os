
Перем ИндексФайлов;

// Загружает из переданного файла список файлов исходных кодов
//
Процедура ЗагрузитьИзФайла(Знач ПутьКФайлуФильтра, Знач КодировкаФайла = Неопределено) Экспорт

	ИндексФайлов = Новый Соответствие;

	ТекстДок = Новый ЧтениеТекста;
	Если КодировкаФайла = Неопределено Тогда
		ТекстДок.Открыть(ПутьКфайлуФильтра);
	Иначе
		ТекстДок.Открыть(ПутьКфайлуФильтра, КодировкаФайла);
	КонецЕсли;

	СтрокаФайла = ТекстДок.ПрочитатьСтроку();
	Пока СтрокаФайла <> Неопределено Цикл
		ИндексФайлов.Вставить(СтрокаФайла, Истина);
		СтрокаФайла = ТекстДок.ПрочитатьСтроку();
	КонецЦикла; 

	ТекстДок.Закрыть();

КонецПроцедуры

Функция ПроверитьФайл(ПутьКфайлу) Экспорт

	ФильтрПройден = Истина;
	Если ИндексФайлов <> Неопределено Тогда
		ФильтрПройден = ИндексФайлов[ПутьКФайлу] =  Истина;
	КонецЕсли;

	Возврат ФильтрПройден;

КонецФункции

// BSLLS:UnusedLocalMethod-off
Процедура ПриСозданииОбъекта(Знач ПутьКФайлуФильтра, Знач КодировкаФайла = Неопределено)

	Если НЕ ПустаяСтрока(ПутьКФайлуФильтра) Тогда
		ЗагрузитьИзФайла(ПутьКФайлуФильтра, КодировкаФайла);
	КонецЕсли;

КонецПроцедуры
// BSLLS:UnusedLocalMethod-on