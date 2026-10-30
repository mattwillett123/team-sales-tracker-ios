import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: SalesStore
    @State private var isAddingDeal = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    headerCard
                    summaryCards
                    pipelineSection
                    teamSection
                    activitySection
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Sales Tracker")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAddingDeal = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $isAddingDeal) {
                AddDealView()
            }
        }
    }

    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("MAY PERFORMANCE")
                        .font(.caption.bold())
                        .foregroundStyle(.secondary)
                    Text(store.closedRevenue.asCurrency)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(.primary)
                }

                Spacer()

                Image(systemName: "arrow.up.right.circle.fill")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .foregroundStyle(.green)
            }

            HStack(spacing: 12) {
                StatTag(label: "Pipeline", value: store.pipelineValue.asCurrency, color: .blue)
                StatTag(label: "Target", value: "82%", color: .green)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            LinearGradient(
                colors: [Color.blue.opacity(0.16), Color.green.opacity(0.12)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private var summaryCards: some View {
        HStack(spacing: 12) {
            SummaryCard(title: "Closed", value: store.closedRevenue.asCurrency, tint: .green)
            SummaryCard(title: "Avg deal", value: store.averageDealValue.asCurrency, tint: .orange)
            SummaryCard(title: "Deals", value: "\(store.totalDeals)", tint: .blue)
        }
    }

    private var pipelineSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Pipeline by stage")

            VStack(spacing: 12) {
                ForEach(DealStage.allCases, id: \ .self) { stage in
                    PipelineRow(stage: stage, value: store.stageBreakdown[stage] ?? 0, maxValue: store.maxStageValue)
                }
            }
        }
    }

    private var teamSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Team")

            VStack(spacing: 10) {
                ForEach(store.reps) { rep in
                    NavigationLink(destination: RepDetailView(rep: rep)) {
                        TeamMemberRow(rep: rep)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var activitySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Recent activity")

            VStack(spacing: 8) {
                ForEach(store.activities.sorted { $0.date > $1.date }.prefix(4)) { activity in
                    ActivityRow(activity: activity)
                }
            }
        }
    }
}

private struct SummaryCard: View {
    let title: String
    let value: String
    let tint: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.title3.bold())
                .foregroundStyle(.primary)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 90, alignment: .leading)
        .background(tint.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}

private struct StatTag: View {
    let label: String
    let value: String
    let color: Color

    var body: some View {
        HStack(spacing: 6) {
            Circle()
                .fill(color.opacity(0.22))
                .frame(width: 8, height: 8)
            Text(label)
                .font(.caption2)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.caption.bold())
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 7)
        .background(Color(.secondarySystemBackground))
        .clipShape(Capsule())
    }
}

private struct SectionHeader: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundStyle(.primary)
    }
}

private struct PipelineRow: View {
    let stage: DealStage
    let value: Double
    let maxValue: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(stage.rawValue)
                    .font(.subheadline)
                Spacer()
                Text(value.asCurrency)
                    .font(.subheadline.bold())
            }

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule().fill(Color(.systemGray5))
                    Capsule()
                        .fill(Color(hex: stage.accentColor))
                        .frame(width: max(8, (value / max(maxValue, 1)) * geometry.size.width))
                }
            }
            .frame(height: 10)
        }
    }
}

private struct TeamMemberRow: View {
    let rep: SalesRep

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            ZStack {
                Circle()
                    .fill(LinearGradient(colors: [.blue, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 44, height: 44)
                Text(initials)
                    .font(.headline)
                    .foregroundStyle(.white)
            }

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(rep.name)
                        .font(.headline)
                    Spacer()
                    Text("\(rep.dealsClosed) wins")
                        .font(.caption.bold())
                        .foregroundStyle(.green)
                }

                Text("\(rep.team) • \(rep.region)")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                HStack {
                    ProgressView(value: min(rep.currentRevenue / max(rep.monthlyTarget, 1), 1.0))
                        .progressViewStyle(.linear)
                        .tint(.green)
                }

                HStack {
                    Text(rep.currentRevenue.asCurrency)
                        .font(.caption.bold())
                    Spacer()
                    Text("Target: \(rep.monthlyTarget.asCurrency)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var initials: String {
        let parts = rep.name.split(separator: " ")
        let first = parts.first?.first.map(String.init) ?? ""
        let last = parts.count > 1 ? parts.last?.first.map(String.init) ?? "" : ""
        return first + last
    }
}

private struct ActivityRow: View {
    let activity: ActivityEntry

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Circle()
                .fill(Color.blue.opacity(0.15))
                .frame(width: 10, height: 10)
            VStack(alignment: .leading, spacing: 4) {
                Text(activity.title)
                    .font(.subheadline.bold())
                Text(activity.details)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(dateFormatter.string(from: activity.date))
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter
    }()
}

struct RepDetailView: View {
    let rep: SalesRep
    @EnvironmentObject var store: SalesStore

    var repDeals: [SalesDeal] {
        store.deals.filter { $0.repId == rep.id }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(rep.name)
                        .font(.largeTitle.bold())
                    Text("\(rep.team) • \(rep.region)")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }

                HStack {
                    SummaryCard(title: "Revenue", value: rep.currentRevenue.asCurrency, tint: .green)
                    SummaryCard(title: "Target", value: rep.monthlyTarget.asCurrency, tint: .blue)
                }

                VStack(alignment: .leading, spacing: 12) {
                    SectionHeader(title: "Open deals")

                    ForEach(repDeals) { deal in
                        DealCardRow(deal: deal)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(rep.name)
    }
}

private struct DealCardRow: View {
    let deal: SalesDeal

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(deal.dealName)
                    .font(.headline)
                Spacer()
                Text(deal.value.asCurrency)
                    .font(.headline.bold())
            }

            Text(deal.customer)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            HStack {
                Text(deal.stage.rawValue)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 5)
                    .background(Color(hex: deal.stage.accentColor).opacity(0.18))
                    .clipShape(Capsule())
                Spacer()
                Text(formattedDate)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: deal.closeDate)
    }
}

#Preview {
    ContentView()
        .environmentObject(SalesStore())
}
