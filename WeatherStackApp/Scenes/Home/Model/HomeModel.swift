//
//  HomeRequestModel.swift
//  WeatherStackApp
//
//  Created by Hussein Anwar on 17/12/2022.
//

import Foundation

//MARK: - Response Model

struct HomeResponseModel : Codable {
    let request : Request?
    let location : Location?
    let current : Current?

    enum CodingKeys: String, CodingKey {

        case request = "request"
        case location = "location"
        case current = "current"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        request = try values.decodeIfPresent(Request.self, forKey: .request)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        current = try values.decodeIfPresent(Current.self, forKey: .current)
    }

}

struct Request : Codable {
    let type : String?
    let query : String?
    let language : String?
    let unit : String?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case query = "query"
        case language = "language"
        case unit = "unit"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        query = try values.decodeIfPresent(String.self, forKey: .query)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        unit = try values.decodeIfPresent(String.self, forKey: .unit)
    }

}


struct Location : Codable {
    let name : String?
    let country : String?
    let region : String?
    let lat : String?
    let lon : String?
    let timezone_id : String?
    let localtime : String?
    let localtime_epoch : Int?
    let utc_offset : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case country = "country"
        case region = "region"
        case lat = "lat"
        case lon = "lon"
        case timezone_id = "timezone_id"
        case localtime = "localtime"
        case localtime_epoch = "localtime_epoch"
        case utc_offset = "utc_offset"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lon = try values.decodeIfPresent(String.self, forKey: .lon)
        timezone_id = try values.decodeIfPresent(String.self, forKey: .timezone_id)
        localtime = try values.decodeIfPresent(String.self, forKey: .localtime)
        localtime_epoch = try values.decodeIfPresent(Int.self, forKey: .localtime_epoch)
        utc_offset = try values.decodeIfPresent(String.self, forKey: .utc_offset)
    }

}

struct Current : Codable {
    let observation_time : String?
    let temperature : Int?
    let weather_code : Int?
    let weather_icons : [String]?
    let weather_descriptions : [String]?
    let wind_speed : Int?
    let wind_degree : Int?
    let wind_dir : String?
    let pressure : Int?
    let precip : Int?
    let humidity : Int?
    let cloudcover : Int?
    let feelslike : Int?
    let uv_index : Int?
    let visibility : Int?
    let is_day : String?

    enum CodingKeys: String, CodingKey {

        case observation_time = "observation_time"
        case temperature = "temperature"
        case weather_code = "weather_code"
        case weather_icons = "weather_icons"
        case weather_descriptions = "weather_descriptions"
        case wind_speed = "wind_speed"
        case wind_degree = "wind_degree"
        case wind_dir = "wind_dir"
        case pressure = "pressure"
        case precip = "precip"
        case humidity = "humidity"
        case cloudcover = "cloudcover"
        case feelslike = "feelslike"
        case uv_index = "uv_index"
        case visibility = "visibility"
        case is_day = "is_day"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        observation_time = try values.decodeIfPresent(String.self, forKey: .observation_time)
        temperature = try values.decodeIfPresent(Int.self, forKey: .temperature)
        weather_code = try values.decodeIfPresent(Int.self, forKey: .weather_code)
        weather_icons = try values.decodeIfPresent([String].self, forKey: .weather_icons)
        weather_descriptions = try values.decodeIfPresent([String].self, forKey: .weather_descriptions)
        wind_speed = try values.decodeIfPresent(Int.self, forKey: .wind_speed)
        wind_degree = try values.decodeIfPresent(Int.self, forKey: .wind_degree)
        wind_dir = try values.decodeIfPresent(String.self, forKey: .wind_dir)
        pressure = try values.decodeIfPresent(Int.self, forKey: .pressure)
        precip = try values.decodeIfPresent(Int.self, forKey: .precip)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        cloudcover = try values.decodeIfPresent(Int.self, forKey: .cloudcover)
        feelslike = try values.decodeIfPresent(Int.self, forKey: .feelslike)
        uv_index = try values.decodeIfPresent(Int.self, forKey: .uv_index)
        visibility = try values.decodeIfPresent(Int.self, forKey: .visibility)
        is_day = try values.decodeIfPresent(String.self, forKey: .is_day)
    }

}
