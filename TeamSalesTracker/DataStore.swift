import Foundation
import SwiftUI

final class SalesStore: ObservableObject {
    @Published var reps: [SalesRep]
    @Published var deals: [SalesDeal]
    @Published var activities: [ActivityEntry]

    init() {
        let reps: [SalesRep] = [
            SalesRep(id: UUID(), name: "Aisha Patel", team: "Enterprise", region: "North America", monthlyTarget: 120000, currentRevenue: 108000, dealsClosed: 9),
            SalesRep(id: UUID(), name: "Marcus Lee", team: "SMB", region: "EMEA", monthlyTarget: 95000, currentRevenue: 82000, dealsClosed: 7),
            SalesRep(id: UUID(), name: "Priya Singh", team: "Mid-Market", region: "APAC", monthlyTarget: 110000, currentRevenue: 97000, dealsClosed: 8),
            SalesRep(id: UUID(), name: "Daniel Brooks", team: "Enterprise", region: "North America", monthlyTarget: 130000, currentRevenue: 117500, dealsClosed: 10)
        ]

        let now = Date()
        let deals: [SalesDeal] = [
            SalesDeal(id: UUID(), repId: reps[0].id, customer: "Northwind Labs", dealName: "AI Operations Suite", value: 42000, stage: .proposal, closeDate: Calendar.current.date(byAdding: .day, value: 14, to: now) ?? now, notes: "Expansion in automation spend."),
            SalesDeal(id: UUID(), repId: reps[0].id, customer: "Blue Harbor", dealName: "CRM Migration", value: 68000, stage: .negotiation, closeDate: Calendar.current.date(byAdding: .day, value: 9, to: now) ?? now, notes: "Legal review in progress."),
            SalesDeal(id: UUID(), repId: reps[1].id, customer: "SummitWorks", dealName: "Team Productivity Platform", value: 24000, stage: .qualified, closeDate: Calendar.current.date(byAdding: .day, value: 21, to: now) ?? now, notes: "Budget approved by finance."),
            SalesDeal(id: UUID(), repId: reps[1].id, customer: "Coastal Retail", dealName: "Sales Enablement Bundle", value: 31000, stage: .closed, closeDate: Calendar.current.date(byAdding: .day, value: -2, to: now) ?? now, notes: "Signed after two product demos."),
            SalesDeal(id: UUID(), repId: reps[2].id, customer: "Helio Group", dealName: "Global Talent Dashboard", value: 52000, stage: .proposal, closeDate: Calendar.current.date(byAdding: .day, value: 18, to: now) ?? now, notes: "Negotiating multi-year contract."),
            SalesDeal(id: UUID(), repId: reps[2].id, customer: "Fjord Systems", dealName: "Customer Success Suite", value: 36000, stage: .closed, closeDate: Calendar.current.date(byAdding: .day, value: -5, to: now) ?? now, notes: "Champion secured."),
            SalesDeal(id: UUID(), repId: reps[3].id, customer: "Oak & Pine", dealName: "Data Integration Upgrade", value: 74000, stage: .prospect, closeDate: Calendar.current.date(byAdding: .day, value: 27, to: now) ?? now, notes: "Initial discovery call complete."),
            SalesDeal(id: UUID(), repId: reps[3].id, customer: "Redstone Health", dealName: "Reporting Platform", value: 58000, stage: .closed, closeDate: Calendar.current.date(byAdding: .day, value: -8, to: now) ?? now, notes: "Board approval received.")
        ]

        self.reps = reps
        self.deals = deals
        self.activities = [
            ActivityEntry(id: UUID(), repId: reps[0].id, title: "Demo completed", date: Calendar.current.date(byAdding: .day, value: -1, to: now) ?? now, details: "Customer walked through automation workflows."),
            ActivityEntry(id: UUID(), repId: reps[1].id, title: "Proposal sent", date: Calendar.current.date(byAdding: .day, value: -4, to: now) ?? now, details: "Pricing agreement shared to finance."),
            ActivityEntry(id: UUID(), repId: reps[2].id, title: "Renewal call", date: Calendar.current.date(byAdding: .day, value: -6, to: now) ?? now, details: "Discussed expansion scope with leadership."),
            ActivityEntry(id: UUID(), repId: reps[3].id, title: "Champion update", date: Calendar.current.date(byAdding: .day, value: -2, to: now) ?? now, details: "Stakeholder is excited about ROI story.")
        ]
    }

    var closedRevenue: Double {
        deals.filter { $0.stage == .closed }.reduce(0) { $0 + $1.value }
    }

    var pipelineValue: Double {
        deals.filter { $0.stage != .closed }.reduce(0) { $0 + $1.value }
    }

    var averageDealValue: Double {
        guard !deals.isEmpty else { return 0 }
        return deals.reduce(0) { $0 + $1.value } / Double(deals.count)
    }

    var totalDeals: Int {
        deals.count
    }

    var stageBreakdown: [DealStage: Double] {
        var result: [DealStage: Double] = [:]
        for stage in DealStage.allCases {
            result[stage] = deals.filter { $0.stage == stage }.reduce(0) { $0 + $1.value }
        }
        return result
    }

    var maxStageValue: Double {
        stageBreakdown.values.max() ?? 1
    }

    func addDeal(_ deal: SalesDeal) {
        deals.insert(deal, at: 0)
    }

    func rep(for id: UUID) -> SalesRep? {
        reps.first { $0.id == id }
    }

    func activity(for repID: UUID) -> [ActivityEntry] {
        activities.filter { $0.repId == repID }.sorted { $0.date > $1.date }
    }
}
