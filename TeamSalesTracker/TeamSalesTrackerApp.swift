import SwiftUI

@main
struct TeamSalesTrackerApp: App {
    @StateObject private var store = SalesStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
