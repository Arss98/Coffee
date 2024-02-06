//
//  Consts.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 03.02.2024.
//

import Foundation

struct Consts {
    struct UIConsts {
        static let emailTextFieldTitle = "E-mail"
        static let emailTextFieldPlaceholder = "Введите ваш E-mail"
        static let passwordTextFieldPlaceholder = "Введите ваш пароль"
        static let passwordTextFieldTitle = "Пароль"
        static let confirmPasswordTextFieldPlaceholder = "Введите ваш пароль повторно"
        static let confirmPasswordTextFieldTitle = "Подтвердите пароль"
        static let loginViewTitle = "Вход"
        static let loginButtonTitle = "Войти"
        static let openMapButtonTitle = "На карте"
        static let registerButtonTitle = "Зарегистрироваться"
        static let registerViewTitle = "Регистрация" 
        static let errorAlertTitle = "Ошибка"
        static let alertOkButtonTitle = "Ок"
        static let passwordsNotMatchError = "Пароли не совпадают"
        static let passwordRequirementsMessage = "Пароль должен содержать как минимум одну заглавную букву, одну цифру и одну строчную букву"
        static let emptyFieldsErrorMessage = "Пожалуйста, заполните все обязательные поля"
        static let nearbyCellIdentifier = "NearbyCoffeeCell"
        static let nearbyCoffeeViewTitle = "Ближайшие кофейни"
        static let distanceLabel = " км от вас"
        static let mapViewTitle = "Карта"
        static let menuViewTitle = "Меню"
        static let toPaymentViewButtonTitle = "Перейти к оплате"
        static let collectionCellIdentifier = "CustomCollectionCell"
        static let paymnetViewTitle = "Ваш заказ"
        static let paymentButtonTitle = "Оплатить"
        static let paymentCellIdentifier = "CustomPaymentCell"
        static let waitingTimeLabelTitle = "Время ожидания заказа 15 минут!\nСпасибо, что выбрали нас!"
        static let successPaymentMessage = "Оплата прошла успешно!"
        static let successPaymentTitle = "Оплата"
        static let emptyCartMessage = "Ваша корзина пуста. Пожалуйста, добавьте товары, чтобы продолжить покупки."
    }
    
    struct ApiConsts {
        static let mapApiKey = "dfff789a-5e7e-4dba-891c-78e5c020c93b"
    }
}
