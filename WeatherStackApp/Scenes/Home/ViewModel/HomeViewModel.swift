//
//  HomeViewModel.swift
//  WeatherStackApp
//
//  Created by Hussein Anwar on 17/12/2022.
//

import Foundation

protocol HomeViewModelProtocol{
    var currentCity : String { get set }
    var model : CellModel { get set }
    var reloadTableViewClosure : (()->())? { get set }
    func getWeatherData()
    func getDaysCount() -> Int
}

class HomeViewModel : HomeViewModelProtocol{
    var currentCity: String = ""
    var reloadTableViewClosure : (()->())?
    private var weatherAPI: ApiClientProtocol
    var model = CellModel() {
        didSet {
            reloadTableViewClosure?()
        }
    }
    
    //MARK: - init
    init(weatherAPI: ApiClientProtocol = ApiClient()) {
        self.weatherAPI = weatherAPI
    }

    
    //MARK: - Methods
    
    func getDaysCount() -> Int{
        return 1
    }
    
    func getWeatherData() {
            weatherAPI.sendRequest(Api.home(currentLocation: self.currentCity), decadoingType: HomeResponseModel.self) { result in
                switch result {
                case .success(let response):
                    print("RESPONSE : -",response)
                    self.model.countryName = response.location?.country ?? ""
                    self.model.cityName = response.location?.name ?? ""
                    self.model.windSpeed = "\(response.current?.wind_speed ?? 0)"
                    self.model.humadity = "\(response.current?.humidity ?? 0)"
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
}
