import SwiftUI

struct SleepView: View {
    @EnvironmentObject private var viewModel: LifeTrackerViewModel
    @State private var hours = ""
    @State private var quality = 3

    var body: some View {
        NavigationStack {
            List {
                Section("Ajouter une nuit") {
                    TextField("Heures de sommeil", text: $hours)
                        .keyboardType(.decimalPad)

                    Stepper("Qualité: \(quality)/5", value: $quality, in: 1...5)

                    Button("Enregistrer") {
                        let normalized = hours.replacingOccurrences(of: ",", with: ".")
                        guard let h = Double(normalized), h > 0 else { return }
                        viewModel.addSleep(hours: h, quality: quality)
                        hours = ""
                        quality = 3
                    }
                }

                Section("Historique") {
                    ForEach(viewModel.sleeps) { sleep in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(String(format: "%.1f heures", sleep.hours))
                                .font(.headline)
                            Text("Qualité: \(sleep.quality)/5")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            Text(sleep.date.formatted(date: .abbreviated, time: .omitted))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Sommeil")
        }
    }
}
