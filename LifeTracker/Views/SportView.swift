import SwiftUI

struct SportView: View {
    @EnvironmentObject private var viewModel: LifeTrackerViewModel
    @State private var duration = ""
    @State private var calories = ""
    @State private var workoutType = "Course"

    private let workoutTypes = ["Course", "Musculation", "Vélo", "Yoga", "Natation"]

    var body: some View {
        NavigationStack {
            List {
                Section("Ajouter une séance") {
                    Picker("Type", selection: $workoutType) {
                        ForEach(workoutTypes, id: \.self) { type in
                            Text(type)
                        }
                    }
                    TextField("Durée (minutes)", text: $duration)
                        .keyboardType(.numberPad)
                    TextField("Calories", text: $calories)
                        .keyboardType(.numberPad)

                    Button("Enregistrer") {
                        guard let d = Int(duration), let c = Int(calories), d > 0, c > 0 else { return }
                        viewModel.addWorkout(durationMinutes: d, calories: c, type: workoutType)
                        duration = ""
                        calories = ""
                    }
                }

                Section("Historique") {
                    ForEach(viewModel.workouts) { workout in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(workout.workoutType)
                                .font(.headline)
                            Text("\(workout.durationMinutes) min • \(workout.caloriesBurned) kcal")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            Text(workout.date.formatted(date: .abbreviated, time: .omitted))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Sport")
        }
    }
}
