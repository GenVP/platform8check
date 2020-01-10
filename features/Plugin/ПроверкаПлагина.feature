# language: ru

@IgnoreOnWeb

Функционал: Проверка конфигурации через gitsync
	Как Разработчик
	Я Хочу чтобы я мог без ошибок проверить конфигурацию базы с помощью gitsync

	Контекст: Текстовый контекст

	Сценарий: Платформенная проверка конфигурации с помощью gitsync
	
	Допустим Я сохраняю путь к исходным кодам тестовой конфигурации в "КаталогИсходников"
	И Я создаю тестовое хранилище и сохраняю в переменную "КаталогХранилища"
	И Я создаю тестовый файл настроек проверки
	И Я создаю временный файл результата и сохраняю в переменную "ФайлРезультата"
	И Я добавляю в файл настроек проверки время ожидания 5 
	И Я добавляю в файл настроек проверки максимальное время ожидания 900
	И Я добавляю в файл настроек проверки ключи проверки "IncorrectReferences,ThinClient,WebClient,Server,ExternalConnection,ExternalConnectionServer,ThickClientManagedApplication,ThickClientServerManagedApplication,ThickClientOrdinaryApplication,ThickClientServerOrdinaryApplication,UnreferenceProcedures,HandlersExistence,EmptyHandlers"
	И Я добавляю в файл настроек проверки файл SonarQube "ФайлРезультата"
	И Я добавляю в файл настроек проверки проект "Test"
	И Я выполняю команду gitsync plugins enable platform8check
	Когда Я выполняю команду gitsync sync --v8check "ФайлНастроекПроверки" "КаталогХранилища" "КаталогИсходников" 
	#Тогда Количество строк в файле "ФайлРезультата" равно ...
