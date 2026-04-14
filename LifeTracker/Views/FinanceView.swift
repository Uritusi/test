import SwiftUI

struct FinanceView: View {
    @EnvironmentObject private var viewModel: LifeTrackerViewModel
    @State private var amount = ""
    @State private var category = ""
    @State private var type: TransactionType = .expense

    var body: some View {
        NavigationStack {
            List {
                Section("Ajouter une transaction") {
                    TextField("Montant", text: $amount)
                        .keyboardType(.decimalPad)
                    TextField("Catégorie", text: $category)

                    Picker("Type", selection: $type) {
                        Text(TransactionType.income.rawValue).tag(TransactionType.income)
                        Text(TransactionType.expense.rawValue).tag(TransactionType.expense)
                    }
                    .pickerStyle(.segmented)

                    Button("Enregistrer") {
                        let normalized = amount.replacingOccurrences(of: ",", with: ".")
                        guard let value = Double(normalized), value > 0, !category.isEmpty else { return }
                        viewModel.addFinance(amount: value, category: category, type: type)
                        amount = ""
                        category = ""
                        type = .expense
                    }
                }

                Section("Historique") {
                    ForEach(viewModel.finances) { entry in
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text(entry.category)
                                    .font(.headline)
                                Spacer()
                                Text(String(format: "%@%.2f €", entry.type == .income ? "+" : "-", entry.amount))
                                    .foregroundStyle(entry.type == .income ? .green : .red)
                            }
                            Text(entry.type.rawValue)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            Text(entry.date.formatted(date: .abbreviated, time: .omitted))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Finance")
        }
    }
}
