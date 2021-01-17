import SwiftUI
import VanillaShopFeature

enum Tab {
  case shop
  case trakt
}

struct ContentView: View {
  
  @State private var selectedTab: Tab = .shop

  var body: some View {
    TabView(selection: $selectedTab) {
      ShopView(viewModel: ShopViewModel(client: .live))
        .tabItem {
          Label("Shop", systemImage: "list.bullet.below.rectangle")
            .accessibility(label: Text("Shop"))
        }
        .tag(Tab.shop)
      
      NavigationView {
        TraktView()
          .navigationTitle(Text("Trakt"))
      }
      .tabItem {
        Label("Trakt", systemImage: "tv")
          .accessibility(label: Text("Trakt"))
      }
      .tag(Tab.trakt)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
