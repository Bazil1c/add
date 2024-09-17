﻿#Область ОписаниеПеременных

&НаКлиенте
Перем КонтекстЯдра;
&НаКлиенте
Перем Утверждения;
&НаКлиенте
Перем СтроковыеУтилиты;
&НаКлиенте
Перем ОсновныеРоли;
&НаКлиенте
Перем СтандартныеРоли;
&НаКлиенте
Перем ВыводитьИсключения;
&НаКлиенте
Перем ИсключенияИзПроверок;
&НаКлиенте
Перем ОтборПоПрефиксу;
&НаКлиенте
Перем ПрефиксОбъектов;

#КонецОбласти

#Область ИнтерфейсТестирования

&НаКлиенте
Процедура Инициализация(КонтекстЯдраПараметр) Экспорт

	КонтекстЯдра = КонтекстЯдраПараметр;
	Утверждения = КонтекстЯдра.Плагин("БазовыеУтверждения");
	СтроковыеУтилиты = КонтекстЯдра.Плагин("СтроковыеУтилиты");

	Настройки(КонтекстЯдра, ИмяТеста());

КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьНаборТестов(НаборТестов, КонтекстЯдраПараметр) Экспорт

	Инициализация(КонтекстЯдраПараметр);

	Если Не ВыполнятьТест(КонтекстЯдра) Тогда
		Возврат;
	КонецЕсли;

	Если ОсновныеРоли.Количество() Тогда
		НаборТестов.НачатьГруппу("Основные роли конфигурации", Ложь);
		Для Каждого ОсновнаяРоль Из ОсновныеРоли Цикл
			ИмяПроцедуры = "ТестДолжен_ПроверитьСоставОсновныхРолей";
			ИмяТеста = КонтекстЯдра.СтрШаблон_("Роль.%1 [%2]", ОсновнаяРоль, НСтр("ru = 'Проверка основной роли'"));
			НаборТестов.Добавить(ИмяПроцедуры, НаборТестов.ПараметрыТеста(ОсновнаяРоль), ИмяТеста);
		КонецЦикла;
		КоличествоОсновныхРолей = ОсновныеРоли.Количество();
		ИмяПроцедуры = "ТестДолжен_ПроверитьКоличествоОсновныхРолей";
		ИмяТеста = КонтекстЯдра.СтрШаблон_("Количество основных ролей [%1]", НСтр("ru = 'Проверка основной роли'"));
		НаборТестов.Добавить(ИмяПроцедуры, НаборТестов.ПараметрыТеста(КоличествоОсновныхРолей), ИмяТеста);
	КонецЕсли;

	Если СтандартныеРоли.Количество() Тогда
		НаборТестов.НачатьГруппу("Стандартные роли", Ложь);
		Для Каждого СтандартнаяРоль Из СтандартныеРоли Цикл
			ИмяПроцедуры = "ТестДолжен_ПроверитьПраваДоступаСтандартнойРоли";
			ОписаниеТеста = НСтр("ru = 'Проверка прав стандартной роли'");
			ИмяТеста = КонтекстЯдра.СтрШаблон_("Роль.%1 [%2]", СтандартнаяРоль.Ключ, ОписаниеТеста);
			НаборТестов.Добавить(
				ИмяПроцедуры,
				НаборТестов.ПараметрыТеста(СтандартнаяРоль.Ключ, СтандартнаяРоль.Значение),
				ИмяТеста);
		КонецЦикла;
	КонецЕсли;

	ИменаРолей = ИменаРолей(СтандартныеРоли, ОтборПоПрефиксу, ПрефиксОбъектов);
	Если Не ВыводитьИсключения Тогда
		МассивТестов = УбратьИсключения(ИменаРолей);
	Иначе
		МассивТестов = ИменаРолей;
	КонецЕсли;
	Если МассивТестов.Количество() > 0 Тогда
		НаборТестов.НачатьГруппу("Роли", Ложь);
	КонецЕсли;
	Для Каждого Тест Из МассивТестов Цикл
		ИмяПроцедуры = "ТестДолжен_ПроверитьНедоступностьПравНаКореньКонфигурацииДляОстальныхРолей";
		ОписаниеТеста = НСтр("ru = 'Проверка прав роли на корень конфигурации'");
		ИмяТеста = КонтекстЯдра.СтрШаблон_("%1 [%2]", Тест.ПолноеИмя, ОписаниеТеста);
		НаборТестов.Добавить(ИмяПроцедуры, НаборТестов.ПараметрыТеста(Тест.Имя, Тест.ПолноеИмя), ИмяТеста);
	КонецЦикла;

КонецПроцедуры

#КонецОбласти

#Область РаботаСНастройками

&НаКлиенте
Процедура Настройки(КонтекстЯдра, Знач ПутьНастройки)

	Если ЗначениеЗаполнено(Объект.Настройки) Тогда
		Возврат;
	КонецЕсли;

	ПрефиксОбъектов = "";
	ОтборПоПрефиксу = Ложь;
	ВыводитьИсключения = Истина;
	ОсновныеРоли = Новый Массив;
	СтандартныеРоли = Новый Массив;
	ИсключенияИзПроверок = Новый Соответствие;
	ПлагинНастроек = КонтекстЯдра.Плагин("Настройки");
	Объект.Настройки = ПлагинНастроек.ПолучитьНастройку(ПутьНастройки);
	Настройки = Объект.Настройки;

	Если Не ЗначениеЗаполнено(Объект.Настройки) Тогда
		Объект.Настройки = Новый Структура(ПутьНастройки, Неопределено);
		Возврат;
	КонецЕсли;

	Если Настройки.Свойство("ОсновныеРоли") Тогда
		ОсновныеРоли = Настройки.ОсновныеРоли;
	КонецЕсли;

	Если Настройки.Свойство("СтандартныеРоли") Тогда
		СтандартныеРоли = Настройки.СтандартныеРоли;
	КонецЕсли;

	Если Настройки.Свойство("ВыводитьИсключения") Тогда
		ВыводитьИсключения = Настройки.ВыводитьИсключения;
	КонецЕсли;

	Если Настройки.Свойство("ИсключенияИзПроверок") Тогда
		ИсключенияИзПроверок(Настройки);
	КонецЕсли;

	Если Настройки.Свойство("Префикс") Тогда
		ПрефиксОбъектов = ВРег(Настройки.Префикс);
	КонецЕсли;

	Если Настройки.Свойство("ОтборПоПрефиксу") Тогда
		ОтборПоПрефиксу = Настройки.ОтборПоПрефиксу;
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура ИсключенияИзПроверок(Настройки)

	Для Каждого ИсключенияИзПроверокПоОбъектам Из Настройки.ИсключенияИзпроверок Цикл
		Для Каждого ИсключениеИзПроверок Из ИсключенияИзПроверокПоОбъектам.Значение Цикл
			ИсключенияИзПроверок.Вставить(ВРег(ИсключенияИзПроверокПоОбъектам.Ключ + "." + ИсключениеИзПроверок), Истина);
		КонецЦикла;
	КонецЦикла;

КонецПроцедуры

#КонецОбласти

#Область Тесты

&НаКлиенте
Процедура ТестДолжен_ПроверитьСоставОсновныхРолей(ИмяРоли) Экспорт

	Результат = ПроверитьСоставОсновныхРолей(ИмяРоли);
	ШаблонОшибки = НСтр("ru = 'Роль %1 не входит в состав основных ролей конфигурации'");
	ТекстОшибки = СтроковыеУтилиты.ПодставитьПараметрыВСтроку(ШаблонОшибки, ИмяРоли);
	Утверждения.Проверить(Результат = Истина, ТекстОшибки);

КонецПроцедуры

&НаСервереБезКонтекста
Функция ПроверитьСоставОсновныхРолей(ИмяРоли)

	Роль = Метаданные.Роли.Найти(ИмяРоли);
	Результат = Метаданные.ОсновныеРоли.Содержит(Роль);

	Возврат Результат;

КонецФункции

&НаКлиенте
Процедура ТестДолжен_ПроверитьКоличествоОсновныхРолей(КоличествоОсновныхРолей) Экспорт

	Результат = ПроверитьКоличествоОсновныхРолей(КоличествоОсновныхРолей);
	ШаблонОшибки = НСтр("ru = 'Количество основных ролей не соответствует стандарту (%1)'");
	ТекстОшибки = СтроковыеУтилиты.ПодставитьПараметрыВСтроку(ШаблонОшибки, КоличествоОсновныхРолей);
	Утверждения.Проверить(Результат = Истина, ТекстОшибки);

КонецПроцедуры

&НаСервереБезКонтекста
Функция ПроверитьКоличествоОсновныхРолей(КоличествоОсновныхРолей)
	Возврат Метаданные.ОсновныеРоли.Количество() = КоличествоОсновныхРолей;
КонецФункции

&НаКлиенте
Процедура ТестДолжен_ПроверитьПраваДоступаСтандартнойРоли(ИмяРоли, ПраваДоступаРоли) Экспорт

	Результат = ПроверитьПраваДоступаСтандартнойРоли(ИмяРоли, ПраваДоступаРоли);
	ШаблонОшибки = НСтр("ru = 'Для стандартной роли %1 не установлены права доступа: %2'");
	ТекстОшибки = СтроковыеУтилиты.ПодставитьПараметрыВСтроку(ШаблонОшибки, ИмяРоли, Результат);
	Утверждения.Проверить(Результат = "", ТекстОшибки);

КонецПроцедуры

&НаСервереБезКонтекста
Функция ПроверитьПраваДоступаСтандартнойРоли(ИмяРоли, ПраваДоступаРоли)

	Результат = "";

	Роль = Метаданные.Роли.Найти(ИмяРоли);

	Для Каждого ПравоДоступаРоли Из ПраваДоступаРоли Цикл
		Попытка
			ЕстьПраво = ПравоДоступа(ПравоДоступаРоли, Метаданные, Роль);
		Исключение
			ЕстьПраво = Истина; // на старых конфигурациях части прав еще нет. например, в 8.3.10 нет МобильныйКлиент
		КонецПопытки;
		Если Не ЕстьПраво Тогда
			Разделитель = ?(ЗначениеЗаполнено(Результат), ", ", "");
			Результат = Результат + Разделитель + ПравоДоступаРоли;
		КонецЕсли;
	КонецЦикла;

	Возврат Результат;

КонецФункции

&НаКлиенте
Процедура ТестДолжен_ПроверитьНедоступностьПравНаКореньКонфигурацииДляОстальныхРолей(ИмяРоли, ПолноеИмяРоли) Экспорт

	ПропускатьТест = ПропускатьТест(ИмяРоли, ПолноеИмяРоли);

	Результат = ПроверитьНедоступностьПравНаКореньКонфигурацииДляОстальныхРолей(ИмяРоли);
	Если Результат <> "" И ПропускатьТест.Пропустить Тогда
		Утверждения.ПропуститьТест(ТекстСообщения(ИмяРоли, Результат));
	Иначе
		Утверждения.Проверить(Результат = "", ТекстСообщения(ИмяРоли, Результат));
	КонецЕсли;

КонецПроцедуры

&НаСервереБезКонтекста
Функция ПроверитьНедоступностьПравНаКореньКонфигурацииДляОстальныхРолей(ИмяРоли)

	Результат = "";

	Роль = Метаданные.Роли.Найти(ИмяРоли);
	ПраваДоступаДляПроверки = ПраваДоступаДляПроверки();

	Для Каждого ПравоДоступаДляПроверки Из ПраваДоступаДляПроверки Цикл
		Попытка
			ЕстьПраво = ПравоДоступа(ПравоДоступаДляПроверки, Метаданные, Роль);
		Исключение
			ЕстьПраво = Истина; // на старых конфигурациях части прав еще нет. например, в 8.3.10 нет МобильныйКлиент
		КонецПопытки;
		Если ЕстьПраво Тогда
			Разделитель = ?(ЗначениеЗаполнено(Результат), ", ", "");
			Результат = Результат + Разделитель + ПравоДоступаДляПроверки;
		КонецЕсли;
	КонецЦикла;

	Возврат Результат;

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Функция ПропускатьТест(ИмяРоли, ПолноеИмяРоли)

	Результат = Новый Структура;
	Результат.Вставить("ТекстСообщения", "");
	Результат.Вставить("Пропустить", Ложь);

	Если ИсключенИзПроверок(ВРег(ПолноеИмяРоли)) Тогда
		ШаблонСообщения = НСтр("ru = 'Роль ""%1"" исключен из проверки'");
		Результат.ТекстСообщения = СтроковыеУтилиты.ПодставитьПараметрыВСтроку(ШаблонСообщения, ИмяРоли);
		Результат.Пропустить = Истина;
		Возврат Результат;
	КонецЕсли;

	Возврат Результат;

КонецФункции

&НаКлиенте
Функция ИсключенИзПроверок(ПолноеИмяМетаданных)

	Результат = Ложь;
	МассивСтрокИмени = СтроковыеУтилиты.РазложитьСтрокуВМассивПодстрок(ПолноеИмяМетаданных, ".");
	ИслючениеВсехОбъектов = СтроковыеУтилиты.ПодставитьПараметрыВСтроку("%1.*", МассивСтрокИмени[0]);

	Если ИсключенияИзПроверок.Получить(ВРег(ПолноеИмяМетаданных)) <> Неопределено
	 Или ИсключенияИзПроверок.Получить(ВРег(ИслючениеВсехОбъектов)) <> Неопределено Тогда
		Результат = Истина;
	КонецЕсли;

	Возврат Результат;

КонецФункции

&НаКлиенте
Функция УбратьИсключения(МассивТестов)

	Результат = Новый Массив;

	Для Каждого Тест Из МассивТестов Цикл
		Если Не ИсключенИзПроверок(Тест.ПолноеИмя) Тогда
			Результат.Добавить(Тест);
		КонецЕсли;
	КонецЦикла;

	Возврат Результат;

КонецФункции

&НаКлиенте
Функция ТекстСообщения(ИмяРоли, Результат)

	ШаблонСообщения = НСтр("ru = 'Для роли %1 установлены права доступа на корень конфигурации: %2'");
	ТекстСообщения = СтроковыеУтилиты.ПодставитьПараметрыВСтроку(ШаблонСообщения, ИмяРоли, Результат);

	Возврат ТекстСообщения;

КонецФункции

&НаКлиенте
Функция ИмяТеста()

	Если Не ЗначениеЗаполнено(Объект.ИмяТеста) Тогда
		Объект.ИмяТеста = ИмяТестаНаСервере();
	КонецЕсли;

	Возврат Объект.ИмяТеста;

КонецФункции

&НаСервере
Функция ИмяТестаНаСервере()
	Возврат РеквизитФормыВЗначение("Объект").Метаданные().Имя;
КонецФункции

&НаКлиенте
Функция ВыполнятьТест(КонтекстЯдра)

	ВыполнятьТест = Ложь;
	ПутьНастройки = ИмяТеста();
	Настройки(КонтекстЯдра, ПутьНастройки);
	Настройки = Объект.Настройки;

	Если Не ЗначениеЗаполнено(Настройки) Тогда
		Возврат ВыполнятьТест;
	КонецЕсли;

	Если ТипЗнч(Настройки) = Тип("Структура") И Настройки.Свойство("Используется") Тогда
		ВыполнятьТест = Настройки.Используется;
	КонецЕсли;

	Возврат ВыполнятьТест;

КонецФункции

&НаСервереБезКонтекста
Функция ИменаРолей(СтандартныеРоли, ОтборПоПрефиксу, ПрефиксОбъектов)

	ИменаРолей = Новый Массив;

	Для Каждого Роль Из Метаданные.Роли Цикл
		Если Метаданные.ОсновныеРоли.Содержит(Роль) Тогда
			Продолжить;
		КонецЕсли;
		Если ТипЗнч(СтандартныеРоли) = Тип("Структура") И СтандартныеРоли.Свойство(Роль.Имя) Тогда
			Продолжить;
		КонецЕсли;
		Если ОтборПоПрефиксу И Не СтрНачинаетсяС(ВРег(Роль.Имя), ВРег(ПрефиксОбъектов)) Тогда
			Продолжить;
		КонецЕсли;
		СтруктураРоли = Новый Структура;
		СтруктураРоли.Вставить("Имя", Роль.Имя);
		СтруктураРоли.Вставить("ПолноеИмя", Роль.ПолноеИмя());
		ИменаРолей.Добавить(СтруктураРоли);
	КонецЦикла;

	Возврат ИменаРолей;

КонецФункции

&НаСервереБезКонтекста
Функция ПраваДоступаДляПроверки()

	ПраваДоступаДляПроверки = Новый Массив;

	ПраваДоступаДляПроверки.Добавить("Администрирование");
	ПраваДоступаДляПроверки.Добавить("АдминистрированиеДанных");
	ПраваДоступаДляПроверки.Добавить("ОбновлениеКонфигурацииБазыДанных");
	ПраваДоступаДляПроверки.Добавить("МонопольныйРежим");
	ПраваДоступаДляПроверки.Добавить("АктивныеПользователи");
	ПраваДоступаДляПроверки.Добавить("ЖурналРегистрации");
	ПраваДоступаДляПроверки.Добавить("ТонкийКлиент");
	ПраваДоступаДляПроверки.Добавить("ВебКлиент");
	ПраваДоступаДляПроверки.Добавить("МобильныйКлиент");
	ПраваДоступаДляПроверки.Добавить("ТолстыйКлиент");
	ПраваДоступаДляПроверки.Добавить("ВнешнееСоединение");
	ПраваДоступаДляПроверки.Добавить("Automation");
	ПраваДоступаДляПроверки.Добавить("РежимВсеФункции");
	ПраваДоступаДляПроверки.Добавить("РегистрацияИнформационнойБазыСистемыВзаимодействия");
	ПраваДоступаДляПроверки.Добавить("СохранениеДанныхПользователя");
	ПраваДоступаДляПроверки.Добавить("АдминистрированиеРасширенийКонфигурации");
	ПраваДоступаДляПроверки.Добавить("ИнтерактивноеОткрытиеВнешнихОбработок");
	ПраваДоступаДляПроверки.Добавить("ИнтерактивноеОткрытиеВнешнихОтчетов");
	ПраваДоступаДляПроверки.Добавить("Вывод");

	Возврат ПраваДоступаДляПроверки;

КонецФункции

#КонецОбласти
