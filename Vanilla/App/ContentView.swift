import SwiftUI
import VanillaShopClientLive
import VanillaShopFeature

enum Tab {
  case shop
  case trakt
}

struct ContentView: View {
  
  @State private var selectedTab: Tab = .shop

  var body: some View {
    TabView(selection: $selectedTab) {
      NavigationView {
        VanillaShopView(viewModel: ShopViewModel(client: .live))
          .navigationTitle(Text("Shop"))
          .navigationBarTitleDisplayMode(.inline)
      }
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
