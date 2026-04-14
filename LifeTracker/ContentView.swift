import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Accueil", systemImage: "house.fill")
                }

            SportView()
                .tabItem {
                    Label("Sport", systemImage: "figure.run")
                }

            SleepView()
                .tabItem {
                    Label("Sommeil", systemImage: "bed.double.fill")
                }

            FinanceView()
                .tabItem {
                    Label("Finance", systemImage: "eurosign.circle.fill")
                }
        }
    }
}
