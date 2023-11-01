# SeSAC_HW2


## 6주차
#### 0822hw
- CodeBase Layout (SnapKit 사용)
    - UIButton TitleLable & Image Vertical
    - UILabel inset padding (drawText)   

#### 0823hw
- Theaters In Map (MapKit, CoreLocation 사용)
    - location authorization check
    - goSetting, setAnnotation
       

#### 0824hw
- Transition Practice (present, push, navigationController)
- NetFlix Screen Layout (SnapKit)
    - UIButton TitleLabel & Image Vertical
    - New class for designing property
        - attributed placeholder
    - MVVM practice (Observable)

#### 0825hw
- UIPageViewController Practice
    - SkipToEnd Delegate (delegate pattern)
    - window rootViewController
- CustomImageView (new class)
    - frame vs. layout size
    - layoutSubviews() 메서드

<br>

## 7주차
#### 0828hw
- TMDB Trending / Detail API
    - Code Base (SnapKit)
    - Alamofire (Codable)
    - View 분리 (Base V / Base VC / Base TVC)

#### 0829hw
- Modify Profile Screen
    - 값 전달 (Notification / Delegate Pattern / Closure)
    - UIButton tap issue (backgroundColor)

#### 0830hw
- Photogram Project
    - UIAlertController 다른 파일에서 생성 (handler 관리)
    - 갤러리에서 가져오기
        - UIImagePickerController / .photoLibrary
    - 웹에서 가져오기
        - Unsplash API (Alamofire + Codable / Singleton Pattern) 
        - UISearchBaxr (responder)
        - KingFisher
        - Notification Center 값 전달 (addObserver / post)

#### 0831pr
- WebView (WebKit)
    - navigation bar appearance
- Animation
- 값 전달 시 ARC
    - delegate pattern
    - closure
    - weak 키워드 필요 x


#### 0901hw
- View & ViewController 역할 분담
    - CollectionViewCell Protocol
    - 값 전달 (delegate) + weak 키워드
    - ARC
- URLSession
    - .shared
    - .default
        - loading buffer
    - KingFisher 없이 이미지 다운
 
<br>

## 8주차
#### 0904hw
- Kakao Book Search API
    - ReusableProtocol (identifier)
    - URLSession
        - URLRequest
        - URLComponent
        - HeaderFields
    - 이미지 다운
        - KingFisher 사용 o
        - KingFisher 사용 x
    - Realm Model
        - transaction 보장
        - CREATE, READ
        - UPDATE, DELETE
    - 이미지 관리 (.jpg로 도큐먼트에서 관리)
        - saveImageToDocument
        - loadImageFromDocument
        - removeImageFromDocument
    - Repository Pattern
        - new protocol / new class / 코드 수정
    - Migration
        - schemaVersion
        - Automatic Update
        - Manually Migration

<br>

## 9주차
#### 0912hw
- MVVM Practice (ViewController - ViewModel 분리)
    - Sample
    - Photo
    - Login

#### 0913hw
- MVVM Practice (ViewController - ViewModel 분리)
    - Calculator
    - Lotto

#### 0914hw
- Emoji Explorer Project
    - Diffable DataSource + Section Snapshot
    - Compositional Layout + List Configuration
        - content configuration
        - background configuration


<br>

## 10주차
#### 0918hw
- MVVM + UICollectionView (modern)
    - User & Photo project
    - VC
        - Section (enum)
        - 인스턴스 (viewModel, dataSource, collectionView)
        - 메서드 (createLayout, configureDataSource, updateSnapshot)
        - extension 메서드 (didSelectItemAt, searchButtonClicked, ...)
    - VM
        - 데이터 인스턴스 (list)
        - 메서드 (API call, list append/remove, ...)

#### 0920hw
- 네트워크 코드 추상화
    - Singleton pattern
    - API Enum
    - Result Type
    - Error Enum
    - Generic 이용해서 메서드 통합
    - Router Pattern (URLRequestConvertible)
- MVVM
    - VM과 VC 역할 분리
        1. VM 메서드의 매개변수에 completionHandler로 동작 설정
        2. VM 프로퍼티를 Observable로 선언 후 listener에 동작 설정
        3. 한번 더 Enum으로 캡슐화하여 VM의 메서드에 직접 접근하지 못하도록 설정


#### 0921hw
- 네트워크 코드 추상화 + MVVM + UICollectionView Practice 
    - Punk API (Beers, Single Beer, Random Beer)
    - Router Pattern, requestConvertible, Observable
    - Diffable DataSource, Custom Cell 사용

