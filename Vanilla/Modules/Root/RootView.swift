import SwiftUI

struct RootView: View {
  
  var body: some View {
    TabView {
      NavigationView {
        ShopView()
          .navigationTitle("Shop")
      }
      .tabItem {
        Label("Shop", systemImage: "list.bullet.below.rectangle")
          .accessibility(label: Text("Shop"))
      }
      
      NavigationView {
        TraktView()
          .navigationTitle("Trakt")
      }
      .tabItem {
        Label("Trakt", systemImage: "tv")
          .accessibility(label: Text("Trakt"))
      }
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}
