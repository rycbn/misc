import SwiftUI
import ComposableArchitecture
import ComposableShopFeature

struct AppState: Equatable {
  var selectedTab: Tab = .shop
  var shop: ShopState = .init()
}
extension AppState {
  enum Tab {
    case shop
    case trakt
  }
}

enum AppAction {
  case onAppear
  case shop(ShopAction)
}

struct AppEnvironment {
  let shopClient: ComposableShopClient
  let mainQueue: AnySchedulerOf<DispatchQueue>
  
  static let live = Self(
    shopClient: .live,
    mainQueue: DispatchQueue.main.eraseToAnyScheduler()
  )
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment>.combine(
  .init { state, action, _ in
    switch action {
    case .onAppear:
      state = .init()
      return .none
    default:
      return .none
    }
  },
  shopReducer
    .pullback(
      state: \.shop,
      action: /AppAction.shop,
      environment: { .init(client: $0.shopClient, mainQueue: $0.mainQueue) }
    )
)

struct ContentView: View {
  @State private var selectedTab: AppState.Tab = .shop
  let store: Store<AppState, AppAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      TabView(selection: $selectedTab) {
        ShopView(
          store: store.scope(
            state: \.shop,
            action: AppAction.shop
          )
        )
        .tabItem {
          Label("Shop", systemImage: "list.bullet.below.rectangle")
            .accessibility(label: Text("Shop"))
        }
        .tag(AppState.Tab.shop)
        
        NavigationView {
          //TraktView()
          Text("Trakt")
            .navigationTitle(Text("Trakt"))
        }
        .tabItem {
          Label("Trakt", systemImage: "tv")
            .accessibility(label: Text("Trakt"))
        }
        .tag(AppState.Tab.trakt)
      }
      .onAppear {
        viewStore.send(.onAppear)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(
      store: Store(
        initialState: .init(),
        reducer: appReducer,
        environment: .init(
          shopClient: .mock,
          mainQueue: DispatchQueue.main.eraseToAnyScheduler()
        )
      )
    )
  }
}
