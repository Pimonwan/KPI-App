//
//import Foundation
//
//// MARK: - KpiFormResponse
//struct KpiFormResponse: Codable {
//    let status: Status
//    let data: KpiFormResponseData
//}
//
//// MARK: - KpiFormResponseData
//struct KpiFormResponseData: Codable {
//    let status: Status
//    let data: DataData
//}
//
//// MARK: - DataData
//struct DataData: Codable {
//    let id: Int
//    let name: String
//    let topicList: [TopicList]
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case topicList = "topic_list"
//    }
//}
//
//// MARK: - TopicList
//struct TopicList: Codable {
//    let id: Int
//    let name: String
//    let subTopicList: [SubTopicList]
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case subTopicList = "sub_topic_list"
//    }
//}
//
//// MARK: - SubTopicList
//struct SubTopicList: Codable {
//    let id: Int
//    let name, rate1, rate2, rate3: String
//    let rate4, rate5, rateUnit: String
//    let isLowerBetter, weight: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, rate1, rate2, rate3, rate4, rate5
//        case rateUnit = "rate_unit"
//        case isLowerBetter = "is_lower_better"
//        case weight
//    }
//}
//
//// MARK: - Status
//struct Status: Codable {
//    let code: Int
//    let message: String
//}


import Foundation

// MARK: - KpiFormResponse
struct KpiFormResponse: Codable {
    let status: Status
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
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
