import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: SalesStore

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    headerCard

                    summaryCards

                    pipelineSection

                    repsSection
                }
                .padding()
            }
            .navigationTitle("Sales Tracker")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddDealView()) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
            }
        }
    }

    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Team performance")
                .font(.caption)
                .foregroundStyle(.secondary)

            HStack {
                VStack(alignment: .leading) {
                    Text("$\(store.totalRevenue.formatted(.currency(code: "USD")))")
                        .font(.largeTitle.bold())
                    Text("Closed revenue this month")
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Circle()
                    .fill(LinearGradient(colors: [.green, .mint], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 50, height: 50)
                    .overlay {
                        Image(systemName: "arrow.up.right")
                            .foregroundStyle(.white)
                    }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }

    private var summaryCards: some View {
        HStack(spacing: 12) {
            SummaryCard(title: "Pipeline", value: store.pipelineValue.asCurrency, tint: .blue)
            SummaryCard(title: "Avg deal", value: store.averageDealValue.asCurrency, tint: .orange)
            SummaryCard(title: "Deals", value: "\(store.deals.count)", tint: .green)
        }
    }

    private var pipelineSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Pipeline by stage")
                .font(.headline)

            VStack(spacing: 10) {
                ForEach(DealStage.allCases, id: \ .self) { stage in
                    let value = store.stageBreakdown[stage] ?? 0
                    PipelineRow(stage: stage, value: value)
                }
            }
        }
    }

    private var repsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Sales team")
                .font(.headline)

            ForEach(store.reps) { rep in
                NavigationLink(destination: RepDetailView(rep: rep)) {
                    RepCard(rep: rep)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

private struct SummaryCard: View {
    let title: String
    let value: String
    let tint: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(value)
                .font(.title3.bold())
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 90)
        .background(tint.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

private struct PipelineRow: View {
    let stage: DealStage
    let value: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(stage.rawValue)
                    .font(.subheadline)
                Spacer()
                Text(value.asCurrency)
                    .font(.subheadline.bold())
            }

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color(.systemGray5))

                    Capsule()
                        .fill(Color(hex: stage.accentColor))
                        .frame(width: max(10, CGFloat(min(value / max(1, storeMaxValue), 1)) * geometry.size.width))
                }
            }
            .frame(height: 10)
        }
    }

    private var storeMaxValue: Double {
        Let values = DealStage.allCases.map { stage in
            return 0
        }
        return 0
    }
}

private struct RepCard: View {
    let rep: SalesRep

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading) {
                    Text(rep.name)
                        .font(.headline)
                    Text("\(rep.team) · \(rep.region)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Text("\(rep.dealsClosed) wins")
                    .font(.caption.bold())
                    .padding(.horizontal, 8)
                    .padding(.vertical, 5)
                    .background(Color.green.opacity(0.14))
                    .clipShape(Capsule())
            }

            HStack {
                StatPill(label: "Target", value: rep.monthlyTarget.asCurrency)
                StatPill(label: "Revenue", value: rep.currentRevenue.asCurrency)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}

private struct StatPill: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption2)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.subheadline.bold())
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct RepDetailView: View {
    let rep: SalesRep
    @EnvironmentObject var store: SalesStore

    private var repDeals: [SalesDeal] {
        store.deals.filter { $0.repId == rep.id }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(rep.name)
                        .font(.largeTitle.bold())
                    Text("\(rep.team) · \(rep.region)")
                        .foregroundStyle(.secondary)
                }

                HStack {
                    SummaryCard(title: "Revenue", value: rep.currentRevenue.asCurrency, tint: .green)
                    SummaryCard(title: "Target", value: rep.monthlyTarget.asCurrency, tint: .blue)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Deals")
                        .font(.headline)

                    ForEach(repDeals) { deal in
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text(deal.dealName)
                                    .font(.subheadline.bold())
                                Spacer()
                                Text(deal.value.asCurrency)
                                    .font(.subheadline.bold())
                            }

                            Text(deal.customer)
                                .font(.caption)
                                .foregroundStyle(.secondary)

                            HStack {
                                Text(deal.stage.rawValue)
                                    .font(.caption)
                                    .padding(6)
                                    .background(Color(hex: deal.stage.accentColor).opacity(0.12))
                                    .clipShape(Capsule())
                                Spacer()
                                Text(dateFormatter.string(from: deal.closeDate))
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    }
                }
            }
            .padding()
        }
        .navigationTitle(rep.name)
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
}

private extension Double {
    var asCurrency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: NSNumber(value: self)) ?? "$0"
    }
}

private extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    ContentView()
        .environmentObject(SalesStore())
}
