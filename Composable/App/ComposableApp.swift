import SwiftUI
import ComposableArchitecture

@main
struct ComposableApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(
        store: Store(
          initialState: .init(),
          reducer: appReducer,
          environment: .live
        )
      )
    }
  }
}
