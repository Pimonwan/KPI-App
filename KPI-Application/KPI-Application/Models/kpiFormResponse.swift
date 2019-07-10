// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let kpiFormResponse = try? newJSONDecoder().decode(KpiFormResponse.self, from: jsonData)

import Foundation

// MARK: - KpiFormResponse
struct KpiFormResponse: Codable {
    let status: Status
    let data: KpiFormResponseData
}

// MARK: - KpiFormResponseData
struct KpiFormResponseData: Codable {
    let status: Status
    let data: DataData
}

// MARK: - DataData
struct DataData: Codable {
    let id: Int
    let name: String
    let topicList: [TopicList]
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case topicList = "topic_list"
    }
}

// MARK: - TopicList
struct TopicList: Codable {
    let id: Int
    let name: String
    let subTopicList: [SubTopicList]
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case subTopicList = "sub_topic_list"
    }
}

// MARK: - SubTopicList
struct SubTopicList: Codable {
    let id: Int
    let name, rate1, rate2, rate3: String
    let rate4, rate5, rateUnit: String
    let isLowerBetter, weight: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, rate1, rate2, rate3, rate4, rate5
        case rateUnit = "rate_unit"
        case isLowerBetter = "is_lower_better"
        case weight
    }
}

// MARK: - Status
struct Status: Codable {
    let code: Int
    let message: String
}
