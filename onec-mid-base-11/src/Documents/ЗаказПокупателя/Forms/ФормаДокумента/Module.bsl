
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
	// ++ Агаев Внесение изменений в конфигурацию на поддержке 27.05.2024
	
	РеквизитКонтактноеЛицо = Элементы.Добавить("ДЗ_КонтактноеЛицо", Тип("ПолеФормы"), Элементы.ГруппаШапкаПраво);
	РеквизитКонтактноеЛицо.Вид = ВидПоляФормы.ПолеВвода;
	РеквизитКонтактноеЛицо.ПутьКДанным = "Объект.ДЗ_КонтактноеЛицо";
	
	РеквизитСогласованнаяСкидка = Элементы.Вставить("ДЗ_СогласованнаяСкидка", Тип("ПолеФормы"), Элементы.ГруппаСуммаДокумента, Элементы.ДекорацияЗаполнениеСуммыДокумента);
	РеквизитСогласованнаяСкидка.Вид = ВидПоляФормы.ПолеВвода;
	РеквизитСогласованнаяСкидка.ПутьКДанным = "Объект.ДЗ_СогласованнаяСкидка";
	РеквизитСогласованнаяСкидка.УстановитьДействие("ПриИзменении", "ДЗ_СогласованнаяСкидкаПриИзменении");
	
	КомандаРассчитать = Команды.Добавить("РассчитатьСоСкидкой");
	КомандаРассчитать.Заголовок = "Рассчитать со скидкой";
	КомандаРассчитать.Действие = "ДЗ_РассчитатьСоСкидкой";
	КнопкаФормыРассчитать = Элементы.Вставить("КнопкаРассчитатьСоСкидкой", Тип("КнопкаФормы"), Элементы.ГруппаСуммаДокумента, Элементы.ДекорацияЗаполнениеСуммыДокумента);
	КнопкаФормыРассчитать.ИмяКоманды = "РассчитатьСоСкидкой";
	КнопкаФормыРассчитать.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	
	// --
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
	//КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	//ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	
	// ++ Агаев Внесение изменений в конфигурацию на поддержке 06.02.2024
	
	Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество;
	ОбщаяСкидка = ТекущиеДанные.Скидка + Объект.ДЗ_СогласованнаяСкидка;
	
	Если ОбщаяСкидка > 100 Тогда
		ОбщаяСкидка = 100;
	КонецЕсли;
	
	Если Объект.ДЗ_СогласованнаяСкидка <> 0 Тогда
		ТекущиеДанные.Сумма = Сумма - (Сумма * (ОбщаяСкидка / 100));
	КонецЕсли;
	
	РассчитатьСуммуДокумента();
	
	// --
	
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти


#Область Доработка

// ++ Агаев Внесение изменений в конфигурацию на поддержке 06.02.2024

&НаКлиенте
Процедура ДЗ_РассчитатьСоСкидкой(Команда)
	
	РассчитатьСоСкидкой();
	
КонецПроцедуры

&НаКлиенте
Процедура ДЗ_СогласованнаяСкидкаПриИзменении(Элемент)
	
	РассчитатьСоСкидкой();
	
КонецПроцедуры

&НаКлиенте
Асинх Процедура РассчитатьСоСкидкой()
	
	Если Объект.Товары.Количество() <> 0 ИЛИ Объект.Услуги.Количество() <> 0 Тогда
		
		ОтветНаВопрос = Ждать ВопросАсинх("Пересчитать табличные части?", РежимДиалогаВопрос.ДаНет);
		
		Если ОтветНаВопрос = КодВозвратаДиалога.Нет Тогда
			Возврат;
		КонецЕсли;
		
	КонецЕсли;
	
	Для Каждого СтрокаТовар Из Объект.Товары Цикл
		
		РассчитатьСуммуСтроки(СтрокаТовар);
		
	КонецЦикла;
	
	Для Каждого СтрокаУслуга Из Объект.Услуги Цикл
		
		РассчитатьСуммуСтроки(СтрокаУслуга);
		
	КонецЦикла
	
КонецПроцедуры

// --

#КонецОбласти