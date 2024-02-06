//
//  MapViewController.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import UIKit
import SnapKit
import YandexMapsMobile

class MapViewController: UIViewController {
    var presenter: MapPresenterProtocol?
    private let mapView = YMKMapView()
    private let userLocation = LocationManager.getCurrentLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        presenter?.fetchLocations()
    }
}

// MARK: - MapViewProtocol
extension MapViewController: MapViewProtocol {
    func updateMapPlacemarket() {
        addPlacemarks()
    }
    
    func dispalyError(_ message: String) {
        errorAlert(message: message)
    }
}

// MARK: - YMKMapObjectTapListener
extension MapViewController: YMKMapObjectTapListener {
    func onMapObjectTap(with mapObject: YMKMapObject, point: YMKPoint) -> Bool {
        if let placemark = mapObject as? YMKPlacemarkMapObject  {
            if let placemarkId = placemark.userData as? Int {
                presenter?.navigationToMenu(coffeeShopID: String(placemarkId))
            }
        }
        return true
    }
}

// MARK: - Private methods
private extension MapViewController {
    func initialize() {
        addSubview()
        setupConstraint()
        setupUI()
        setupDefaultNavigationBar(title: Consts.UIConsts.mapViewTitle)
    }
    
    func addSubview() {
        view.addSubview(mapView)
    }
    
    func setupConstraint() {
        mapView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupUI() {
        if let userLatitude = userLocation.latitude, let userLongitude = userLocation.longitude {
            mapView.mapWindow.map.move(
                with: YMKCameraPosition(
                    target: YMKPoint(latitude: userLatitude, longitude: userLongitude),
                    zoom: 15,
                    azimuth: 0,
                    tilt: 0),
                animation: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
                cameraCallback: nil)
        } else {
            print("User location coordinates are not available")
        }
    }
    
    private func addPlacemarks() {
        guard let coffeePlaces = presenter?.locations() else { return }
        
        for place in coffeePlaces {
            if let latitude = Double(place.point.latitude), let longitude = Double(place.point.longitude) {
                let placemark = mapView.mapWindow.map.mapObjects.addPlacemark()
                placemark.geometry = YMKPoint(latitude: latitude, longitude: longitude)
                placemark.userData = place.id
                placemark.addTapListener(with: self)
                
                let icon = UIImage.backgroundCoffee
                icon.withRenderingMode(.alwaysOriginal)
                
                placemark.setIconWith(
                    icon,
                    style: {
                        let iconStyle = YMKIconStyle()
                        iconStyle.scale = 4
                        
                        return iconStyle
                    } ()
                )
                
                placemark.setTextWithText(
                    place.name,
                    style: YMKTextStyle(
                        size: 14.0,
                        color: .main,
                        outlineColor: .white,
                        placement: .top,
                        offset: 0.0,
                        offsetFromIcon: true,
                        textOptional: false
                    )
                )
            }
        }
    }
}
