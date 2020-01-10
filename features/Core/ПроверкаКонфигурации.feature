﻿# language: ru

@IgnoreOnWeb

Функционал: Проверка конфигурации
	Как Разработчик
	Я Хочу чтобы я мог без ошибок проверить конфигурацию базы

	Контекст: Текстовый контекст

	Сценарий: Проверка конфигурации в существующей базе
	
	Допустим Я сохраняю путь к исходным кодам тестовой конфигурации в "КаталогИсходников"
	И Я создаю временную базу и сохраняю в переменную "КаталогБазы"
	И Я загружаю конфигурацию из файлов в каталоге "КаталогИсходников" в базу "КаталогБазы"
	И Я создаю менеджер проверок
	И Я устанавливаю для проверок контекст базы источника "КаталогБазы" 
	И Я устанавливаю для проверок каталог исходных кодов "КаталогИсходников" 
	И Я устанавливаю для проверок время ожидания 5 
	И Я устанавливаю для проверок максимальное время ожидания 900
	И Я начинаю проверку с ключами "IncorrectReferences,ThinClient,WebClient,Server,ExternalConnection,ExternalConnectionServer,ThickClientManagedApplication,ThickClientServerManagedApplication,ThickClientOrdinaryApplication,ThickClientServerOrdinaryApplication,UnreferenceProcedures,HandlersExistence,EmptyHandlers"
	И Я начинаю проверку с ключами "ExtendedModulesCheck,CheckUseModality" 
	Когда Я сохраняю результат завершенных проверок в переменной "ТаблицаОшибок"
	Тогда Количество строк в таблице "ТаблицаОшибок" равно 18 

	Сценарий: Проверка конфигурации в существующей базе для объекта УправлениеКонфигуратором
	
	Допустим Я сохраняю путь к исходным кодам тестовой конфигурации в "КаталогИсходников"
	И Я создаю временную базу и сохраняю в переменную "КаталогБазы"
	И Я загружаю конфигурацию из файлов в каталоге "КаталогИсходников" в базу "КаталогБазы"
	И Я создаю объект УправлениеКонфигуратором для временной базы "КаталогБазы" и сохраняю в переменную "КонфигураторБазы"
	И Я создаю менеджер проверок
	И Я устанавливаю для проверок конфигуратор базы источника "КонфигураторБазы" 
	И Я устанавливаю для проверок каталог исходных кодов "КаталогИсходников" 
	И Я устанавливаю для проверок время ожидания 5 
	И Я устанавливаю для проверок максимальное время ожидания 900
	И Я начинаю проверку с ключами "IncorrectReferences,ThinClient,WebClient,Server,ExternalConnection,ExternalConnectionServer,ThickClientManagedApplication,ThickClientServerManagedApplication,ThickClientOrdinaryApplication,ThickClientServerOrdinaryApplication,UnreferenceProcedures,HandlersExistence,EmptyHandlers"
	И Я начинаю проверку с ключами "ExtendedModulesCheck,CheckUseModality" 
	Когда Я сохраняю результат завершенных проверок в переменной "ТаблицаОшибок"
	Тогда Количество строк в таблице "ТаблицаОшибок" равно 18 

	Сценарий: Проверка конфигурации в существующей базе с созданием из исходников
	
	Допустим Я сохраняю путь к исходным кодам тестовой конфигурации в "КаталогИсходников"
	И Я создаю менеджер проверок
	И Я устанавливаю для проверок каталог исходных кодов "КаталогИсходников" 
	И Я создаю базу для проверок из файлов исходных кодов
	И Я устанавливаю для проверок время ожидания 5 
	И Я устанавливаю для проверок максимальное время ожидания 900
	И Я начинаю проверку с ключами "IncorrectReferences,ThinClient,WebClient,Server,ExternalConnection,ExternalConnectionServer,ThickClientManagedApplication,ThickClientServerManagedApplication,ThickClientOrdinaryApplication,ThickClientServerOrdinaryApplication,UnreferenceProcedures,HandlersExistence,EmptyHandlers"
	И Я начинаю проверку с ключами "ExtendedModulesCheck,CheckUseModality" 
	Когда Я сохраняю результат завершенных проверок в переменной "ТаблицаОшибок"
	Тогда Количество строк в таблице "ТаблицаОшибок" равно 18 
	
	Сценарий: Проверка конфигурации в существующей базе с фильтром
	
	Допустим Я сохраняю путь к исходным кодам тестовой конфигурации в "КаталогИсходников"
	И Я сохраняю фильтр файлов исходных кодов в переменной "ФильтрФайлов"
	И Я создаю временную базу и сохраняю в переменную "КаталогБазы"
	И Я загружаю конфигурацию из файлов в каталоге "КаталогИсходников" в базу "КаталогБазы"
	И Я создаю менеджер проверок
	И Я устанавливаю для проверок контекст базы источника "КаталогБазы" 
	И Я устанавливаю для проверок каталог исходных кодов "КаталогИсходников" 
	И Я устанавливаю для проверок время ожидания 5 
	И Я устанавливаю для проверок максимальное время ожидания 900
	И Я добавляю фильтр файлов из переменной "ФильтрФайлов"
	И Я начинаю проверку с ключами "IncorrectReferences,ThinClient,WebClient,Server,ExternalConnection,ExternalConnectionServer,ThickClientManagedApplication,ThickClientServerManagedApplication,ThickClientOrdinaryApplication,ThickClientServerOrdinaryApplication,UnreferenceProcedures,HandlersExistence,EmptyHandlers"
	И Я начинаю проверку с ключами "ExtendedModulesCheck,CheckUseModality" 
	Когда Я сохраняю результат завершенных проверок в переменной "ТаблицаОшибок"
	Тогда Количество строк в таблице "ТаблицаОшибок" равно 10 
