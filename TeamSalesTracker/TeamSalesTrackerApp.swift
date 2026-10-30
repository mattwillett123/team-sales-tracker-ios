import SwiftUI

struct AddDealView: View {
    @EnvironmentObject var store: SalesStore
    @Environment(\.dismiss) private var dismiss

    @State private var selectedRepID: UUID?
    @State private var customer: String = ""
    @State private var dealName: String = ""
    @State private var amountText: String = ""
    @State private var stage: DealStage = .prospect
    @State private var closeDate: Date = Date().addingTimeInterval(14 * 86400)
    @State private var notes: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Sales rep") {
                    Picker("Representative", selection: Binding(
                        get: { selectedRepID ?? store.reps.first?.id ?? UUID() },
                        set: { selectedRepID = $0 }
                    )) {
                        ForEach(store.reps) { rep in
                            Text(rep.name).tag(rep.id)
                        }
                    }
                }

                Section("Deal details") {
                    TextField("Customer", text: $customer)
                    TextField("Deal name", text: $dealName)
                    TextField("Value", text: $amountText)
                        .keyboardType(.decimalPad)
                    Picker("Stage", selection: $stage) {
                        ForEach(DealStage.allCases, id: \.self) { stage in
                            Text(stage.rawValue).tag(stage)
                        }
                    }
                    DatePicker("Close date", selection: $closeDate, displayedComponents: .date)
                    TextField("Notes", text: $notes, axis: .vertical)
                        .lineLimit(3...6)
                }

                Section {
                    Button(action: saveDeal) {
                        Text("Save deal")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle("New deal")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
            }
            .onAppear {
                if selectedRepID == nil, let first = store.reps.first {
                    selectedRepID = first.id
                }
            }
        }
    }

    private func saveDeal() {
        guard let repID = selectedRepID,
              let amount = Double(amountText.trimmingCharacters(in: .whitespacesAndNewlines)),
              !customer.isEmpty,
              !dealName.isEmpty else { return }

        let deal = SalesDeal(
            id: UUID(),
            repId: repID,
            customer: customer,
            dealName: dealName,
            value: amount,
            stage: stage,
            closeDate: closeDate,
            notes: notes
        )

        store.addDeal(deal)
        dismiss()
    }
}

#Preview {
    AddDealView()
        .environmentObject(SalesStore())
}
