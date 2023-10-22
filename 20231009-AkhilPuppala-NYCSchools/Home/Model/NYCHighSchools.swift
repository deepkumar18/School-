//
//  NYCHighSchools.swift
//  20231009-AkhilPuppala-NYCSchools
//
//  Created by Akhil  on 09/10/23.
//

import Foundation

typealias NYCHighSchools = [NYCHighSchool]

// MARK: - NYCHighSchoolDetails
struct NYCHighSchool: Codable {
    let dbn: String?
    let schoolName: String?
    let overviewParagraph: String?
    var academicopportunities1: String?
    var academicopportunities2: String?
    let ellPrograms: String?
    let neighborhood: String?
    var buildingCode: String?
    let location: String?
    var phoneNumber: String?
    var faxNumber: String?
    var schoolEmail: String?
    var website: String?
    var subway: String?
    var bus: String?
    var extracurricularActivities: String?
    var schoolSports: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn,neighborhood,location,academicopportunities1,academicopportunities2,website,subway,bus
        case schoolName = "school_name"
        case overviewParagraph = "overview_paragraph"
        case ellPrograms = "ell_programs"
        case buildingCode = "building_code"
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case extracurricularActivities = "extracurricular_activities"
        case schoolSports = "school_sports"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dbn = try values.decodeIfPresent(String.self, forKey: .dbn)
        schoolName = try values.decodeIfPresent(String.self, forKey: .schoolName)
        overviewParagraph = try values.decodeIfPresent(String.self, forKey: .overviewParagraph)
        academicopportunities1 = try values.decodeIfPresent(String.self, forKey: .academicopportunities1)
        academicopportunities2 = try values.decodeIfPresent(String.self, forKey: .academicopportunities2)
        ellPrograms = try values.decodeIfPresent(String.self, forKey: .ellPrograms)
        neighborhood = try values.decodeIfPresent(String.self, forKey: .neighborhood)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        buildingCode = try values.decodeIfPresent(String.self, forKey: .buildingCode)
        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        faxNumber = try values.decodeIfPresent(String.self, forKey: .faxNumber)
        schoolEmail = try values.decodeIfPresent(String.self, forKey: .schoolEmail)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        subway = try values.decodeIfPresent(String.self, forKey: .subway)
        bus = try values.decodeIfPresent(String.self, forKey: .bus)
        extracurricularActivities = try values.decodeIfPresent(String.self, forKey: .extracurricularActivities)
        schoolSports = try values.decodeIfPresent(String.self, forKey: .schoolSports)
    }
}
