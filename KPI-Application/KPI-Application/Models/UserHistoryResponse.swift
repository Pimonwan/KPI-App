import Foundation

// MARK: - UserHistoryResponse
struct UserHistory: Codable {
//    let historyStatus: Status
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id, userID, formID, finalActualScore: Int
    let finalRatingScore: Double
    let updatedAt: String
    let scoreHistoryList: [ScoreHistoryList]
    
    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case formID = "form_id"
        case finalActualScore = "final_actual_score"
        case finalRatingScore = "final_rating_score"
        case updatedAt = "updated_at"
        case scoreHistoryList = "score_history_list"
    }
}

// MARK: - ScoreHistoryList
struct ScoreHistoryList: Codable {
    let id, topicID, subTopicID, actualScore: Int
    let ratingScore: Int
    let remark: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case id
        case topicID = "topic_id"
        case subTopicID = "sub_topic_id"
        case actualScore = "actual_score"
        case ratingScore = "rating_score"
        case remark
    }
}

// MARK: - Status
struct historyStatus: Codable {
    let code: Int
    let message: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
