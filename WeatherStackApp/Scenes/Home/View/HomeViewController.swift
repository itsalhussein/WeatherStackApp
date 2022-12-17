//
//  HomeViewController.swift
//  WeatherStackApp
//
//  Created by Hussein Anwar on 17/12/2022.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var viewModel : HomeViewModelProtocol
    private let locationManager = LocationManager()

    //MARK: - Init
    init(viewModel:HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureBinding()
    }
    
    //MARK: - Methods
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WeatherCell.nib, forCellReuseIdentifier: WeatherCell.identifier)
    }
    
    func configureBinding() {
        self.locationManager.getCurrentLocationClosure = { [weak self] in
            guard let currentLocation = self?.locationManager.currentLocation else { return }
            self?.locationManager.getUserLocation(for: currentLocation) { place in
                if let city = place?.locality {
                    self?.viewModel.currentCity = city
                    self?.viewModel.getWeatherData()
                }
            }
        }
        
        self.viewModel.reloadTableViewClosure = { [weak self] in
            self?.tableView.reloadData()
        }
    
    }
    
}

//MARK: - Table view methods

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getDaysCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.identifier, for: indexPath) as! WeatherCell
        cell.configureCell(model: self.viewModel.model)
        return cell
    }  
}
