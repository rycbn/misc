import SwiftUI
import ShopFeature
import ShopClientLive

enum Tab {
  case shop
  case trakt
}

struct ContentView: View {
  @State private var selectedTab: Tab = .shop
  
  var body: some View {
    TabView(selection: $selectedTab) {
      NavigationView {
        ComposableShopView()
          .navigationTitle(Text("Shop"))
          .navigationBarTitleDisplayMode(.inline)
      }
      .tabItem {
        Label("Shop", systemImage: "list.bullet.below.rectangle")
          .accessibility(label: Text("Shop"))
      }
      .tag(Tab.shop)
      
      NavigationView {
        //TraktView()
        Text("Trakt")
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
