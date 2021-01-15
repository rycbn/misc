import SwiftUI
import ShopClientLive
import ShopFeature

struct ContentView: View {

  var body: some View {
    TabView {
      NavigationView {
        ShopView(viewModel: ShopViewModel(client: .live))
          .navigationTitle(Text("Shop"))
      }
      .tabItem {
        Label("Shop", systemImage: "list.bullet.below.rectangle")
          .accessibility(label: Text("Shop"))
      }
      
      NavigationView {
        TraktView()
          .navigationTitle(Text("Trakt"))
      }
      .tabItem {
        Label("Trakt", systemImage: "tv")
          .accessibility(label: Text("Trakt"))
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
