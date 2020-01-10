﻿# language: ru

@IgnoreOnWeb

Функционал: Проверка конфигурации
	Как Разработчик
	Я Хочу чтобы я мог без ошибок проверить конфигурацию базы

	Контекст: Тестовый контекст с результатом

	Сценарий: Проверка конфигурации в существующей базе

	Допустим Я сохраняю путь к исходным кодам тестовой конфигурации в "КаталогИсходников"
	И Я сохраняю результат тестовой проверки в переменную "РезультатПроверки"
	И Я создаю менеджер проверок
	И Я устанавливаю для проверок каталог исходных кодов "КаталогИсходников" 
	И Я устанавливаю для проверок время ожидания 5 
	И Я устанавливаю для проверок максимальное время ожидания 900
	И Я Добавляю результат проверки из переменной "РезультатПроверки" с ключами "IncorrectReferences,ThinClient,WebClient,Server,ExternalConnection,ExternalConnectionServer,ThickClientManagedApplication,ThickClientServerManagedApplication,ThickClientOrdinaryApplication,ThickClientServerOrdinaryApplication,UnreferenceProcedures,HandlersExistence,EmptyHandlers"
	Когда Я сохраняю результат завершенных проверок в переменной "ТаблицаОшибок"
	Тогда Количество строк в таблице "ТаблицаОшибок" равно 18 
