//
//  ViewController.swift
//  kkumerDrone
//
//  Created by 박혁진 on 2020/06/11.
//  Copyright © 2020 kkumercompany. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var txtField: UITextField!
    
    @IBAction func didTouchTextField(_ sender: UITextField) {
        let newVC = self.storyboard?.instantiateViewController(identifier: "SearchViewController")
        newVC?.modalPresentationStyle = .currentContext
        self.present(newVC!, animated: false, completion: nil)
    }
        
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager.delegate = self
        // 포그라운드일 때 위치 추적 권한 요청
        locationManager.requestWhenInUseAuthorization()
        // 배터리에 맞게 권장되는 최적의 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치 업데이트
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
        // 위도, 경도 가져오기
        let coor = locationManager.location?.coordinate
        var latitude = coor?.latitude
        var longitude = coor?.longitude
        
        txtField.backgroundColor = UIColor.white
    }
    
    func goLocation(latitude: CLLocationDegrees,longitude: CLLocationDegrees, span: Double) {
        let presentLocation = CLLocationCoordinate2DMake(latitude, longitude)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let presentRegion = MKCoordinateRegion(center: presentLocation, span: spanValue)
        mapView.setRegion(presentRegion, animated: true)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let presentLocation = locations.last
        goLocation(latitude: (presentLocation?.coordinate.latitude)!, longitude: (presentLocation?.coordinate.longitude)!, span: 0.01)

    }
    
}

