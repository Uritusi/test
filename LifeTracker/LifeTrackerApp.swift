import SwiftUI

@main
struct LifeTrackerApp: App {
    @StateObject private var viewModel = LifeTrackerViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
