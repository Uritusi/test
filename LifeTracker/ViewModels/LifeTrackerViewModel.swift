import Foundation

final class LifeTrackerViewModel: ObservableObject {
    @Published var workouts: [WorkoutEntry]
    @Published var sleeps: [SleepEntry]
    @Published var finances: [FinanceEntry]

    init() {
        let today = Date()
        let calendar = Calendar.current

        workouts = [
            WorkoutEntry(date: today, durationMinutes: 45, caloriesBurned: 420, workoutType: "Course"),
            WorkoutEntry(date: calendar.date(byAdding: .day, value: -1, to: today) ?? today, durationMinutes: 30, caloriesBurned: 250, workoutType: "Musculation")
        ]

        sleeps = [
            SleepEntry(date: today, hours: 7.6, quality: 4),
            SleepEntry(date: calendar.date(byAdding: .day, value: -1, to: today) ?? today, hours: 6.8, quality: 3)
        ]

        finances = [
            FinanceEntry(date: today, amount: 120.0, category: "Freelance", type: .income),
            FinanceEntry(date: today, amount: 42.0, category: "Courses", type: .expense),
            FinanceEntry(date: calendar.date(byAdding: .day, value: -1, to: today) ?? today, amount: 19.9, category: "Streaming", type: .expense)
        ]
    }

    var todayWorkoutMinutes: Int {
        workouts
            .filter { Calendar.current.isDateInToday($0.date) }
            .reduce(0) { $0 + $1.durationMinutes }
    }

    var averageSleep: Double {
        guard !sleeps.isEmpty else { return 0 }
        let total = sleeps.reduce(0.0) { $0 + $1.hours }
        return total / Double(sleeps.count)
    }

    var monthlyBalance: Double {
        let monthEntries = finances.filter { Calendar.current.isDate($0.date, equalTo: Date(), toGranularity: .month) }
        let income = monthEntries.filter { $0.type == .income }.reduce(0.0) { $0 + $1.amount }
        let expenses = monthEntries.filter { $0.type == .expense }.reduce(0.0) { $0 + $1.amount }
        return income - expenses
    }

    func addWorkout(durationMinutes: Int, calories: Int, type: String) {
        workouts.insert(
            WorkoutEntry(date: Date(), durationMinutes: durationMinutes, caloriesBurned: calories, workoutType: type),
            at: 0
        )
    }

    func addSleep(hours: Double, quality: Int) {
        sleeps.insert(SleepEntry(date: Date(), hours: hours, quality: quality), at: 0)
    }

    func addFinance(amount: Double, category: String, type: TransactionType) {
        finances.insert(FinanceEntry(date: Date(), amount: amount, category: category, type: type), at: 0)
    }
}
