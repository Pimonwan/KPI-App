// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userProfile = try? newJSONDecoder().decode(UserProfile.self, from: jsonData)

import Foundation

// MARK: - UserProfile
struct UserProfile: Codable {
    let data: [Ddatum]
}

// MARK: - Datum
struct Ddatum: Codable {
    let userID: Int
    let firstNameTh, lastNameTh, firstNameEn, lastNameEn: String
    let address, position: String
    let profilePhotoPath: JSONNull?
    let birthDate, registerDate, mobileNo, emailNotificationFlag: String
    let nationality, religion, email: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case firstNameTh = "first_name_th"
        case lastNameTh = "last_name_th"
        case firstNameEn = "first_name_en"
        case lastNameEn = "last_name_en"
        case address, position
        case profilePhotoPath = "profile_photo_path"
        case birthDate = "birth_date"
        case registerDate = "register_date"
        case mobileNo = "mobile_no"
        case emailNotificationFlag = "email_notification_flag"
        case nationality, religion, email
    }
}

//// MARK: - Status
//struct Status: Codable {
//    let code: Int
//    let message: String
//}

//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
