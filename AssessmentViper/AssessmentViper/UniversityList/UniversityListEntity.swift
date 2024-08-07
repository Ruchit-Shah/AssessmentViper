//
//  UniversityListEntity.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation

typealias Universities = [University]

struct University: Decodable {
    
    let countryCode: String?
    let country: String?
    let name: String?
    let state: String?
    var weburls: [String]?
    
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case name = "name"
        case state = "state-province"
        case countryCode = "alpha_two_code"
        case weburls = "web_pages"
    }
    
    var url: URL? {
        get {
            if let urlString = weburls?.first {
                return URL(string: urlString)
            }
            return nil
        }
        set {}
    }
    
    init(countryCode: String?, country: String?, name: String?, state: String?, weburls: [String]?) {
        self.countryCode = countryCode
        self.country = country
        self.name = name
        self.state = state
        self.weburls = weburls
    }
    
    init(countryCode: String?, country: String?, name: String?, state: String?, url: URL?) {
        self.countryCode = countryCode
        self.country = country
        self.name = name
        self.state = state
        self.url = url
    }
}
