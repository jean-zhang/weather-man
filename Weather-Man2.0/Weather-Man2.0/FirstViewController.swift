//
//  FirstViewController.swift
//  Weather-Man2.0
//
//  Created by Tanvi Daga on 4/13/19.
//  Copyright © 2019 Tanvi Daga. All rights reserved.
//

import UIKit
import WXKDarkSky
import Alamofire
import SwiftyJSON
import MapKit

class FirstViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
    }
    

    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
            print("in checkLocationServices")
        } else {
            print("error")
        }
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            // mapView.showsUserLocation = true
            centerViewOnUserLocation()
            print("authorized")
        // locationManager.startUpdatingLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }
    
    func centerViewOnUserLocation(){
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
            //   mapView.setRegion(region, animated: true)
            getWeather(location.latitude, location.longitude)
            
        }
    }
    
    func getWeather(_ lat: Double, _ long: Double){
        let key = "f188fd3d9c794413a663be68aba8173b/"
        let req = "https://api.darksky.net/forecast/"
        let lat = String(lat)
        let toAdd = ","
        let lon = String(long)
        let toReq = req + key + lat + toAdd + lon
        Alamofire.request(toReq).validate().responseJSON { response in
            let json = JSON(response.result.value)
            let date = Date()
            let calendar = NSCalendar.current
            let hourlyData = json["hourly"]["data"]
            let hoursUntil12 = 24 - calendar.component(.hour, from: date)
            var count = 0;
          //  print(hoursUntil12)
            let currentHour = calendar.component(.hour, from: date)
            var startHourInd = -1
            var endHourInd = -1
            if(7 < currentHour  && currentHour < 21){
                startHourInd = 0
                let hoursUntil21  = 21 - currentHour + 14
                endHourInd = hoursUntil21
            } else if (currentHour >= 21) {
                let hoursUntil7 = 24 - currentHour + 7
                let hoursUntil21 = hoursUntil7 + 14
                startHourInd = hoursUntil7
                endHourInd = hoursUntil21
            } else if (currentHour <= 7) {
                let hoursUntil7 = 7 - currentHour
                let hoursUntil21 = hoursUntil7 + 14
                startHourInd = hoursUntil7
                endHourInd = hoursUntil21
            }
            print(startHourInd)
            print(endHourInd)
            var bestTemp = 1000
            var worstTemp = -460
           // var bestPrecip
            
            
            for val in startHourInd...endHourInd {
                
                print(hourlyData[val]["temperature"])
                print(hourlyData[val]["cloudCover"])
                print(hourlyData[val]["precipProbability"])
                if(hourlyData[val]["precipProbability"] > 0){
                    
                    if((hourlyData[val]["precipType"]) == "rain"){
                        
                    }
                    
                }
                count += 1
                print(count)
            }
           
            print(lat)
            print(lon)
            
            //   print(json)
            
        }
    }
}

extension FirstViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        //  self.getWeather(center.latitude, center.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
        //  mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}



