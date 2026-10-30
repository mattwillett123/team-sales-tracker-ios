import Foundation

struct SalesRep: Identifiable, Hashable {
    let id: UUID
    let name: String
    let team: String
    let region: String
    let monthlyTarget: Double
    let currentRevenue: Double
    let dealsClosed: Int
}

enum DealStage: String, CaseIterable, Codable {
    case prospect = "Prospect"
    case qualified = "Qualified"
    case proposal = "Proposal"
    case negotiation = "Negotiation"
    case closed = "Closed"

    var accentColor: String {
        switch self {
        case .prospect: return "#7C8AA5"
        case .qualified: return "#49A6FF"
        case .proposal: return "#FFB703"
        case .negotiation: return "#FF7B54"
        case .closed: return "#22C55E"
        }
    }
}

struct SalesDeal: Identifiable, Codable, Hashable {
    let id: UUID
    let repId: UUID
    let customer: String
    let dealName: String
    let value: Double
    let stage: DealStage
    let closeDate: Date
    let notes: String
}

struct ActivityEntry: Identifiable, Codable, Hashable {
    let id: UUID
    let repId: UUID
    let title: String
    let date: Date
    let details: String
}
