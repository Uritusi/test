import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var viewModel: LifeTrackerViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    MetricCard(title: "Sport aujourd'hui", value: "\(viewModel.todayWorkoutMinutes) min", icon: "figure.run")
                    MetricCard(title: "Sommeil moyen", value: String(format: "%.1f h", viewModel.averageSleep), icon: "bed.double.fill")
                    MetricCard(title: "Solde mensuel", value: String(format: "%.2f €", viewModel.monthlyBalance), icon: "eurosign.circle.fill")
                }
                .padding()
            }
            .navigationTitle("Life Tracker")
        }
    }
}

private struct MetricCard: View {
    let title: String
    let value: String
    let icon: String

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 28, weight: .semibold))
                .frame(width: 48, height: 48)
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                Text(value)
                    .font(.title3.bold())
            }

            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
