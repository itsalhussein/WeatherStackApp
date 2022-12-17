//
//  WeatherCell.swift
//  WeatherStackApp
//
//  Created by Hussein Anwar on 17/12/2022.
//

import UIKit

class WeatherCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var humadity: UILabel!
    
    //MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
