//
//  TheaterViewController.swift
//  0823hw
//
//  Created by 임승섭 on 2023/08/23.
//

import UIKit
import CoreLocation
import MapKit
import SnapKit



// 8/23 hw

// 에러 : 지도에서 화면이 움직이는 동안 앱을 백그라운드로 보내면 에러나면서 종료됨
        // 설정 화면으로 보낼 때는 걍 에러남
        // 현재 위치로 화면이 이동하는 것도 애니메이션이 없어짐


// 1. 사용자의 위치 권한 허용 여부
    // 허용 -> 사용자의 위치로 포커스
    // 거부 -> 청년취업사관학교 영등포캠퍼스 - 구분해주기 위해 일단 롯데월드
        // 롯데월드 37.511081, 127.098167
        // 청취사 37.517829, 126.886270

// 2. location 버튼
    // 허용 -> 사용자의 위치로 포커스
    // 거부 -> alert으로 설정 창 유도

// 3. 영화관 어노테이션

class TheaterViewController: UIViewController {
    
    
    // location 버튼
    // filter 버튼 (actionsheet)
    // mapView
    
    
    let locationManager = CLLocationManager()
    
    let mapView = MKMapView()
    let locationButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "location.fill"), for: .normal)
        
        return button
    }()
    let filterButton = {
        let button = UIButton()
        
        button.setTitle("Filter", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        
        
        
        return button
    }()
    
    let theaterList = TheaterList().mapAnnotations

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 화면 디자인
        view.backgroundColor = .white
        [mapView, locationButton, filterButton].forEach { item in
            view.addSubview(item)
        }
        setLayout()
        
        // 프로토콜 연결
        mapView.delegate = self
        locationManager.delegate = self

        // 전체 영화관 어노테이션
        setAnnotation("전체보기")
        
        // 시작
        checkDeviceLocationAuthorization()
        
        // 버튼 연결
        locationButton.addTarget(self, action: #selector(locationButtonClicked), for: .touchUpInside)
        filterButton.addTarget(self, action: #selector(filterButtonClicked), for: .touchUpInside)
    }
    
    
    
    
    func setLayout() {
        mapView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.bottom.equalTo(view)
        }
        locationButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.size.equalTo(40)
        }
        filterButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(40)
        }
    }
}


// 버튼 클릭 함수
extension TheaterViewController {
    
    @objc
    func locationButtonClicked() {
        
        DispatchQueue.global().async {
            if (CLLocationManager.locationServicesEnabled()) {
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                DispatchQueue.main.async {
                    switch authorization {
                    case .denied:
                        self.showLocationSettingAlert()
                    default:
                        self.locationManager.startUpdatingLocation()
                        
                        
                    }
                }
            }
        }
    }
    
    
    @objc
    func filterButtonClicked() {
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let mega = UIAlertAction(title: "메가박스", style: .default) { _ in
            self.setAnnotation("메가박스")
        }
        let lotte = UIAlertAction(title: "롯데시네마", style: .default) { _ in
            self.setAnnotation("롯데시네마")
        }
        let cgv = UIAlertAction(title: "CGV", style: .default) { _ in
            self.setAnnotation("CGV")
        }
        let all = UIAlertAction(title: "전체보기", style: .default) { _ in
            self.setAnnotation("전체보기")
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        actionSheet.addAction(mega)
        actionSheet.addAction(lotte)
        actionSheet.addAction(cgv)
        actionSheet.addAction(all)
        
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true)
    }
    
    
}


// 커스텀 함수 선언
extension TheaterViewController {
    
    // annotation
    func setAnnotation(_ sender: String) {
        
        // 일단 다 지우고
        mapView.removeAnnotations(mapView.annotations)
        
        // 추가
            // 전체보기 -> 리스트 모두 추가
            // else -> sender(String)과 같은 요소만 추가
        if (sender == "전체보기") {
            theaterList.forEach { item in
                let anno = MKPointAnnotation()
                
                anno.title = item.location
                anno.coordinate = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
                
                mapView.addAnnotation(anno)
            }
        }
        
        else {
            theaterList.forEach { item in
                
                if (item.type == sender) {
                    let anno = MKPointAnnotation()
                    
                    anno.title = item.location
                    anno.coordinate = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
                    
                    mapView.addAnnotation(anno)
                }
                
            }
            
        }
    }
    
    
    // 권한 설정 여부
    func checkDeviceLocationAuthorization() {
        
        DispatchQueue.global().async {
            
            // 기기의 권한 설정 여부
            if (CLLocationManager.locationServicesEnabled()) {
                
                let authorization: CLAuthorizationStatus
                
                // 사용자의 권한 설정 여부
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                
                
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
                
                
            }
            else {
                print("기기의 위치 서비스가 꺼져 있습니다. 권한 요청이 불가합니다")
            }
        }
    }
    
        
    // 사용자의 권한에 따라 동작
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("권한 상태 : notdetermined")
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("restriced")
        case .denied:
            print("권한 상태 : denied")
            setRegionAndAnnotation(center: CLLocationCoordinate2D(latitude: 37.511081, longitude: 127.098167))
//            showLocationSettingAlert()
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("권한 상태 : authorizedWhenInUse")
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        @unknown default:
            print("default")
        }
    }
    
    
    // 화면 전환 및 어노테이션 찍기 (아마 과제에서는 어노테이션은 필요 없다)
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        
        let region = MKCoordinateRegion(
            center: center,
            latitudinalMeters: 100,
            longitudinalMeters: 100
        )
        mapView.setRegion(region, animated: true)
    
//        let annotation = MKPointAnnotation()
//        annotation.title = "현재 위치입니다"
//        annotation.coordinate = center
//        
//        mapView.addAnnotation(annotation)
    }
    
    
    
    // 권한이 거부되었을 때, 설정 창으로 유도하는 alert
    func showLocationSettingAlert() {
        
        let requestLocationServiceAlert = UIAlertController(
            title: "위치 정보 이용",
            message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요",
            preferredStyle: .alert
        )
        
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _ in
            // 설정 창으로 이동
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .default)
        
        requestLocationServiceAlert.addAction(cancel)
        requestLocationServiceAlert.addAction(goSetting)
        
        present(requestLocationServiceAlert, animated: true, completion: nil)
    }
}


// location 함수 선언
extension TheaterViewController: CLLocationManagerDelegate {
    
    // 사용자 위치를 성공적으로 받아옴
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let coordinate = locations.last?.coordinate {    // 실질적으로 사용자의 위치가 저장되는 곳?
            print("현재 위도경도 : ", coordinate)
            
            setRegionAndAnnotation(center: coordinate)
        }
        
        locationManager.stopUpdatingLocation()
    }
    
    
    // 사용자 위치를 가져오는 데 실패함
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("사용자 위치를 불러오는 것을 실패하였습니다")
    }
    
    
    // 사용자의 권한 상태가 바뀔 때를 알려줌
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        
        // 권한을 다시 체크
        checkDeviceLocationAuthorization()
    }
    
}


// map 함수 선언
extension TheaterViewController: MKMapViewDelegate {
    
    // 지도 움직이다 멈춘다
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("화면이 움직였습니다")
    }
}
