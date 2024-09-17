﻿Перем СтатусыРезультатаТестирования;
Перем ФлагОтрицанияДляСообщения;

// { Plugin interface
Функция ОписаниеПлагина(КонтекстЯдра, ВозможныеТипыПлагинов) Экспорт
	Результат = Новый Структура;
	Результат.Вставить("Тип", ВозможныеТипыПлагинов.Утилита);
	Результат.Вставить("Идентификатор", Метаданные().Имя);
	Результат.Вставить("Представление", "УтвержденияBDD");

	Возврат Новый ФиксированнаяСтруктура(Результат);
КонецФункции

Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
КонецПроцедуры
// } Plugin interface

Функция Что(Знач ПроверяемоеЗначение, Знач Сообщение = "") Экспорт
	ЭтотОбъект.ПроверяемоеЗначение = ПроверяемоеЗначение;
	ЭтотОбъект.ДопСообщениеОшибки = Сообщение;
	ЭтотОбъект.ФлагОтрицания = Ложь;

	Возврат ЭтотОбъект;
КонецФункции

Функция Не_() Экспорт
	ЭтотОбъект.ФлагОтрицания = Истина;

	Возврат ЭтотОбъект;
КонецФункции

Функция ЭтоНе() Экспорт
	Возврат Не_();
КонецФункции

Функция Метод(Знач ИмяМетода, Знач ПараметрыМетода = Неопределено) Экспорт
	ЭтотОбъект.ИмяМетода = ИмяМетода;
	ЭтотОбъект.ПараметрыМетода = ПараметрыМетода;

	Возврат ЭтотОбъект;
КонецФункции

Функция ЭтоИстина() Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение = Истина) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Формат(ПроверяемоеЗначение, "БЛ=Ложь; БИ=Истина"), "является ИСТИНОЙ.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

Функция ЕстьИстина() Экспорт
	Возврат ЭтоИстина();
КонецФункции

Функция ЭтоЛожь() Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение = Ложь) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Формат(ПроверяемоеЗначение, "БЛ=Ложь; БИ=Истина"), "является ЛОЖЬЮ.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

Функция ЕстьЛожь() Экспорт
	Возврат ЭтоЛожь();
КонецФункции

Функция Равно(Знач ОжидаемоеЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение = ОжидаемоеЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "РАВНО (" + ОжидаемоеЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

Функция Больше(Знач МеньшееЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение > МеньшееЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "БОЛЬШЕ (" + МеньшееЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

Функция БольшеИлиРавно(Знач МеньшееИлиРавноеЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение >= МеньшееИлиРавноеЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "БОЛЬШЕ ИЛИ РАВНО (" + МеньшееИлиРавноеЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

Функция Минимум(Знач МинимальноеЗначение) Экспорт
	Возврат БольшеИлиРавно(МинимальноеЗначение);
КонецФункции

Функция МеньшеИлиРавно(Знач БольшееИлиРавноеЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение <= БольшееИлиРавноеЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "МЕНЬШЕ ИЛИ РАВНО (" + БольшееИлиРавноеЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

Функция Максимум(Знач МаксимальноеЗначение) Экспорт
	Возврат МеньшеИлиРавно(МаксимальноеЗначение);
КонецФункции

Функция Меньше(Знач БольшееЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение < БольшееЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "МЕНЬШЕ (" + БольшееЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

Функция Заполнено() Экспорт
	Если Не ЛогическоеВыражениеВерно(ЗначениеЗаполнено(ПроверяемоеЗначение)) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "является ЗАПОЛНЕННЫМ.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

Функция Существует() Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение <> Неопределено И ПроверяемоеЗначение <> Null) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "СУЩЕСТВУЕТ.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

Функция ЭтоНеопределено() Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение = Неопределено) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "является НЕОПРЕДЕЛЕНО.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

Функция ЕстьНеопределено() Экспорт
	Возврат ЭтоНеопределено();
КонецФункции

Функция ЭтоNull() Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение = Null) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "является NULL.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

Функция ЕстьNull() Экспорт
	Возврат ЭтоNull();
КонецФункции

Функция ИмеетТип(Знач ТипИлиИмяТипа) Экспорт
	ОжидаемыйТип = ?(ТипЗнч(ТипИлиИмяТипа) = Тип("Строка"), Тип(ТипИлиИмяТипа), ТипИлиИмяТипа);
	ТипПроверяемогоЗначения = ТипЗнч(ПроверяемоеЗначение);
	Если Не ЛогическоеВыражениеВерно(ТипПроверяемогоЗначения = ОжидаемыйТип) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке("тип - " + ТипПроверяемогоЗначения, "имеет тип (" + ОжидаемыйТип + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

Функция Между(Знач НачальноеЗначение, Знач КонечноеЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение >= НачальноеЗначение И ПроверяемоеЗначение <= КонечноеЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "МЕЖДУ (" + НачальноеЗначение + ") и (" + КонечноеЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

Функция Содержит(Знач ИскомоеЗначение) Экспорт
	Перем ИскомоеЗначениеНайдено;

	ТипПроверяемоегоЗначения = ТипЗнч(ПроверяемоеЗначение);
	Если ТипПроверяемоегоЗначения = Тип("Строка") Тогда
		Если СтрЧислоСтрок(ИскомоеЗначение) = 1 Тогда
			ИскомоеЗначениеНайдено = Найти(ПроверяемоеЗначение, ИскомоеЗначение) > 0;
		Иначе
			ПроверитьЧтоМногострочнаяСтрокаСодержитПодстрокуБезУчетаНачальныхКонечныхПробеловВПодстроках(ПроверяемоеЗначение, ИскомоеЗначение, ФорматДСО(ДопСообщениеОшибки));
			ИскомоеЗначениеНайдено = Истина;
			Возврат ЭтотОбъект;
		КонецЕсли;
		
	ИначеЕсли ТипПроверяемоегоЗначения = Тип("Массив") Или ТипПроверяемоегоЗначения = Тип("ФиксированныйМассив") Тогда
		ИскомоеЗначениеНайдено = ПроверяемоеЗначение.Найти(ИскомоеЗначение) <> Неопределено;
	ИначеЕсли ТипПроверяемоегоЗначения = Тип("Структура") Или ТипПроверяемоегоЗначения = Тип("ФиксированнаяСтруктура")
			Или ТипПроверяемоегоЗначения = Тип("Соответствие") Или ТипПроверяемоегоЗначения = Тип("ФиксированноеСоответствие") Тогда
		Для каждого КлючЗначение Из ПроверяемоеЗначение Цикл
			ИскомоеЗначениеНайдено = КлючЗначение.Значение = ИскомоеЗначение;
			Если ИскомоеЗначениеНайдено Тогда
				Прервать;
			КонецЕсли;
		КонецЦикла;
	ИначеЕсли ТипПроверяемоегоЗначения = Тип("СписокЗначений") Тогда
		ИскомоеЗначениеНайдено = ПроверяемоеЗначение.НайтиПоЗначению(ИскомоеЗначение) <> Неопределено;
	КонецЕсли;

	Если ИскомоеЗначениеНайдено = Неопределено Тогда
		СообщениеОшибки = "Утверждение ""Содержит"" не умеет работать с типом <" + ТипПроверяемоегоЗначения + ">." + ФорматДСО(ДопСообщениеОшибки);
		ВызватьИсключение СообщениеОшибки;
	КонецЕсли;

	Если Не ЛогическоеВыражениеВерно(ИскомоеЗначениеНайдено) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "СОДЕРЖИТ (" + ИскомоеЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

Функция ИмеетДлину(Знач ОжидаемаяДлина) Экспорт
	
	Перем ФактическаяДлина;
	
	ТипПроверяемогоЗначения = ТипЗнч(ПроверяемоеЗначение);
	Если ТипПроверяемогоЗначения = Тип("Строка") Тогда
		ФактическаяДлина = СтрДлина(ПроверяемоеЗначение);
	ИначеЕсли ЭтоКоллекция(ТипПроверяемогоЗначения) Тогда
		ФактическаяДлина = ПроверяемоеЗначение.Количество();
	КонецЕсли;
	
	Если ФактическаяДлина = Неопределено Тогда
		
		СообщениеОшибки = "Утверждение ""ИмеетДлину"" не умеет работать с типом <"
			+ ТипПроверяемогоЗначения + ">." + ФорматДСО(ДопСообщениеОшибки);
		ВызватьИсключение СообщениеОшибки;
		
	КонецЕсли;
	
	Если Не ЛогическоеВыражениеВерно(ФактическаяДлина = ОжидаемаяДлина) Тогда
		
		СообщениеОшибки = СформироватьСообщениеОбОшибке("<" +ПроверяемоеЗначение + "> с длиной "
			+ ФактическаяДлина, "ИМЕЕТ ДЛИНУ (" + ОжидаемаяДлина + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
		
	КонецЕсли;
	
	Возврат ЭтотОбъект;
	
КонецФункции

Функция ВыбрасываетИсключение(Знач ФрагментИсключения = "") Экспорт
	Контекст = ПроверяемоеЗначение;
	СтрокаПараметры = "";
	Если ТипЗнч(ПараметрыМетода) = Тип("Массив") Тогда
		Для Сч = 0 По ПараметрыМетода.Количество() - 1 Цикл
			СтрокаПараметры = СтрокаПараметры + ",ПараметрыМетода[" + Сч + "]";
		КонецЦикла;
		СтрокаПараметры = Сред(СтрокаПараметры, 2);
	ИначеЕсли ТипЗнч(ПараметрыМетода) = Тип("Строка") Тогда
		СтрокаПараметры = """" + ПараметрыМетода + """";
	ИначеЕсли ТипЗнч(ПараметрыМетода) = Тип("Число") Тогда
		СтрокаПараметры = Строка( ПараметрыМетода );
	КонецЕсли;
	СтрокаДляВыполнения = "Контекст." + ИмяМетода + "(" + СтрокаПараметры + ")";

	ИсключениеВозникло = Ложь;
	Попытка
		Выполнить(СтрокаДляВыполнения);
	Исключение
		ИсключениеВозникло = Истина;
		ТекстИсключения = ОписаниеОшибки();
	КонецПопытки;

	Если Не ЛогическоеВыражениеВерно(ИсключениеВозникло И Найти(ТекстИсключения, ФрагментИсключения) > 0) Тогда
		СообщениеОшибки = "Ожидали, что " + СтрокаДляВыполнения
			+ ?(ФлагОтрицания, " НЕ ", " ")
			+ "ВЫБРОСИТ ИСКЛЮЧЕНИЕ"
			+ ?(ЗначениеЗаполнено(ФрагментИсключения), " СОДЕРЖАЩЕЕ ТЕКСТ <" + ФрагментИсключения + ">, а был текст <" + ТекстИсключения + ">.", "");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;

	Возврат ЭтотОбъект;
КонецФункции

// { Helpers
Функция ФорматДСО(Знач ДопСообщениеОшибки)
	Если ДопСообщениеОшибки = "" Тогда
		Возврат "";
	КонецЕсли;

	Возврат Символы.ПС + ДопСообщениеОшибки;
КонецФункции

Процедура ВызватьОшибкуПроверки(Знач СообщениеОшибки)
	Префикс = "["+ СтатусыРезультатаТестирования.ОшибкаПроверки + "]";
	ВызватьИсключение Префикс + " " + СообщениеОшибки;
КонецПроцедуры

Функция ЛогическоеВыражениеВерно(Знач ЛогическоеВыражение)
	Результат = ФлагОтрицания <> ЛогическоеВыражение;
	ФлагОтрицанияДляСообщения = ФлагОтрицания;
	ФлагОтрицания = Ложь;

	Возврат Результат;
КонецФункции

Функция СформироватьСообщениеОбОшибке(Знач ПроверяемоеЗначение, Знач Ожидание)
	Возврат "Ожидали, что проверяемое значение (" + ПроверяемоеЗначение + ")" + ?(ФлагОтрицанияДляСообщения, " НЕ ", " ") + Ожидание + ФорматДСО(ДопСообщениеОшибки);
КонецФункции

Процедура ПроверитьЧтоМногострочнаяСтрокаСодержитПодстрокуБезУчетаНачальныхКонечныхПробеловВПодстроках(Знач Строка, Знач Подстрока, ДопСообщениеОшибки = "")
	СообщениеОшибки = "";
	Нашли = МногострочнаяСтрокаСодержитПодстрокуБезУчетаНачальныхКонечныхПробеловВПодстроках(Строка, Подстрока, СообщениеОшибки);
	Если Не Нашли Тогда
		ВызватьОшибкуПроверки( СтрШаблон_("Ожидали, что в строке <
		|%1
		|>
		|найдем подстроку<
		|%2
		|>
		|А это не так.
		|Уточнение: %3.
		|%4", Строка, Подстрока, СообщениеОшибки, ДопСообщениеОшибки));
	КонецЕсли;
КонецПроцедуры

Функция МногострочнаяСтрокаСодержитПодстрокуБезУчетаНачальныхКонечныхПробеловВПодстроках(Знач Строка, Знач Подстрока, СообщениеОшибки = "")
	ПерваяСтрока = СокрЛП(СтрПолучитьСтроку(Подстрока, 1));
	НашлиПервуюСтроку = Ложь;
	Для Счетчик = 1 По СтрЧислоСтрок(Строка) Цикл
		ОчереднаяСтрока = СокрЛП(СтрПолучитьСтроку(Строка, Счетчик));
		НашлиПервуюСтроку = Найти(ОчереднаяСтрока, ПерваяСтрока) <> 0;
		Если НашлиПервуюСтроку Тогда
			Прервать;
		КонецЕсли;
	КонецЦикла;
	Если Не НашлиПервуюСтроку Тогда
		СообщениеОшибки = СтрШаблон_("Не нашли первую же подстроку <%1>", ПерваяСтрока);
		Возврат Ложь;
	КонецЕсли;

	СчетчикЧтоИщем = 2;
	Для Счетчик = Счетчик + 1 По СтрЧислоСтрок(Строка) Цикл
		ОчереднаяСтрока = СокрЛП(СтрПолучитьСтроку(Строка, Счетчик));
		ЧтоИщем = СокрЛП(СтрПолучитьСтроку(Подстрока, СчетчикЧтоИщем));
		Поз = Найти(ОчереднаяСтрока, ЧтоИщем);
		Если Поз = 0 Тогда
			СообщениеОшибки = СтрШаблон_("Не нашли подстроку № %1 <%2>", СчетчикЧтоИщем, ЧтоИщем);
			Возврат Ложь;
		Иначе
			СчетчикЧтоИщем  = СчетчикЧтоИщем  + 1;
			Если СчетчикЧтоИщем > СтрЧислоСтрок(Подстрока) Тогда
				Возврат Истина;
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;
	Возврат СчетчикЧтоИщем > СтрЧислоСтрок(Подстрока);
КонецФункции

// Замена функции СтрШаблон на конфигурациях с режимом совместимости < 8.3.6
// При внедрении в конфигурацию с режимом совместимости >= 8.3.6 данную функцию необходимо удалить
//
Функция СтрШаблон_(Знач СтрокаШаблон, Знач Парам1 = Неопределено, Знач Парам2 = Неопределено,
		Знач Парам3 = Неопределено, Знач Парам4 = Неопределено) Экспорт

	МассивПараметров = Новый Массив;
	МассивПараметров.Добавить(Парам1);
	МассивПараметров.Добавить(Парам2);
	МассивПараметров.Добавить(Парам3);
	МассивПараметров.Добавить(Парам4);

	Для Сч = 1 По МассивПараметров.Количество() Цикл
		ТекЗначение = МассивПараметров[Сч-1];
		СтрокаШаблон = СтрЗаменить(СтрокаШаблон, "%"+Сч, Строка(ТекЗначение));
	КонецЦикла;
	Возврат СтрокаШаблон;
КонецФункции

Функция ЭтоКоллекция(ТипЗначения)
	
	ТипыКоллекций = Новый Массив;
	ТипыКоллекций.Добавить(Тип("Массив"));
	ТипыКоллекций.Добавить(Тип("ФиксированныйМассив"));
	ТипыКоллекций.Добавить(Тип("Структура"));
	ТипыКоллекций.Добавить(Тип("ФиксированнаяСтруктура"));
	ТипыКоллекций.Добавить(Тип("Соответствие"));
	ТипыКоллекций.Добавить(Тип("ФиксированноеСоответствие"));
	ТипыКоллекций.Добавить(Тип("СписокЗначений"));
	ТипыКоллекций.Добавить(Тип("ТаблицаЗначений"));
	
	Возврат ТипыКоллекций.Найти(ТипЗначения) <> Неопределено;
	
КонецФункции

// } Helpers

СтатусыРезультатаТестирования = Новый Структура;
СтатусыРезультатаТестирования.Вставить("ОшибкаПроверки", "Failed");
СтатусыРезультатаТестирования.Вставить("НеизвестнаяОшибка", "Broken");
СтатусыРезультатаТестирования.Вставить("ТестПропущен", "Pending");
СтатусыРезультатаТестирования = Новый ФиксированнаяСтруктура(СтатусыРезультатаТестирования);
