//
//  MapObjectTapListener.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//
//import UIKit
//import YandexMapsMobile
//
//final private class MapObjectTapListener: NSObject, YMKMapObjectTapListener {
//    private let controller: UIViewController
//    
//    init(controller: UIViewController) {
//        self.controller = controller
//    }
//
//    func onMapObjectTap(with mapObject: YMKMapObject, point: YMKPoint) -> Bool {
//        AlertPresenter.present(
//            with: "Tapped point",
//            message: "\((point.latitude, point.longitude))",
//            from: controller
//        )
//        return true
//    }
//}
