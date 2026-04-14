import Foundation

struct WorkoutEntry: Identifiable {
    let id = UUID()
    let date: Date
    let durationMinutes: Int
    let caloriesBurned: Int
    let workoutType: String
}

struct SleepEntry: Identifiable {
    let id = UUID()
    let date: Date
    let hours: Double
    let quality: Int // 1 à 5
}

struct FinanceEntry: Identifiable {
    let id = UUID()
    let date: Date
    let amount: Double
    let category: String
    let type: TransactionType
}

enum TransactionType: String {
    case income = "Revenu"
    case expense = "Dépense"
}
