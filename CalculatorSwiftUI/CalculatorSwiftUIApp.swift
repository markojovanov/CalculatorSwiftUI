import SwiftUI

@main
struct CalculatorSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: CalculateLogic())
        }
    }
}
