import Foundation

struct AllNews: Codable {
    let topNews: [Article]
    let dailyBriefings: DailyBriefings
    let technicalAnalysis, specialReport: [Article]
}

struct DailyBriefings: Codable {
    let eu, asia, us: [Article]
}

struct Article: Codable {
    let title: String
    let url: String
    let headlineImageUrl, articleImageUrl, backgroundImageUrl: String?
    let authors: [[String: String?]]
    let instruments, tags, categories: [String]?
    let displayTimestamp, lastUpdatedTimestamp: Int
}

extension Article: Hashable {}

struct MarketsResponse: Codable {
    let currencies, commodities, indices: [Market]
}

struct Market: Codable {
    let displayName, marketId: String
    let rateDetailURL: String
    let topMarket: Bool
}
