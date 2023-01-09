﻿#language: ru

Функционал: оформление поступления товара

Как Менеджер по закупкам я хочу
протестировать приёмку товара
чтобы поставить товар на учет

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание поступления товаров
//* Открытие и заполнение шапки документа     222 *//
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
	Тогда элемент формы с именем "Склад" стал равен 'Большой'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И я нажимаю кнопку выбора у поля с именем "Поставщик"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'       |
		| '000000013' | 'Магазин "Продукты"' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление товара (создание) *'
* Заполнение товаров
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000030' | 'Колбаса'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление товара (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '4,00'
	И в таблице "Товары" я завершаю редактирование строки
	И я выбираю пункт контекстного меню с именем 'ТоварыКонтекстноеМенюДобавить' на элементе формы с именем "Товары"
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'х'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2,00'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыТовар"
	И я выбираю пункт контекстного меню с именем 'ТоварыКонтекстноеМенюСкопировать' на элементе формы с именем "Товары"
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '20,00'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1,00'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка ТЧ
	Тогда таблица "Товары" содержит строки:
		| 'Товар'   | 'Цена'     | 'Количество' | 'Сумма'     |
		| 'Колбаса' | '250,00'   | '4,00'       | '1 001,00'  |
		| 'Вихрь'   | '6 000,00' | '2,00'       | '12 000,00' |
		| 'Вихрь'   | '20,00'    | '1,00'       | '*'     |
	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$' |
	
Сценарий: Проверка торта
	И В командном интерфейсе я выбираю 'Продажи' 'Товары'
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	Тогда таблица "Список" содержит строки:
		| 'Наименование' |
		| 'Торт3 '        |