// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getUserName = try? newJSONDecoder().decode(GetUserName.self, from: jsonData)

import Foundation

// MARK: - GetUserName
struct GetUserName: Codable {
    let data: [Da]
}

// MARK: - Datum
struct Da: Codable {
    let userID: Int
    let firstNameTh, lastNameTh, firstNameEn, lastNameEn: String
    let address: Address
    let position: Position
    let profilePhotoPath: JSONNull?
    let birthDate: String
    let registerDate: RegisterDate
    let mobileNo, emailNotificationFlag: String
    let nationality: Nationality
    let religion: Religion
    let email: String
    
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

enum Address: String, Codable {
    case bangkok = "bangkok"
}

enum Nationality: String, Codable {
    case ไทย = "ไทย"
}

enum Position: String, Codable {
    case staff2 = "staff2"
}

enum RegisterDate: String, Codable {
    case the20190722021351 = "2019-07-22 02:13:51"
}

enum Religion: String, Codable {
    case นองง = "น้องง"
    case พทธ = "พุทธ"
}

// MARK: - Encode/decode helpers

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
