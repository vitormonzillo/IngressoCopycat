//
//  TabBarView.swift
//  IngressoCopycat
//
//  Created by Vitor Monzillo on 30/05/23.
//

import Foundation
import SwiftUI

struct TabBarView: View {
  @State private var selectedTab = 0
  var body: some View {
      TabView(selection: $selectedTab) {
        FilmesView()
          .tabItem {
            Image(systemName: "popcorn.fill")
            Text("Filmes")
          }.tag(0)
        CinemasView()
          .tabItem {
            Image(systemName: "map.fill")
            Text("Cinemas")
          }.tag(1)
        NewsView()
          .tabItem {
            Image(systemName: "newspaper.fill")
            Text("Notícias")
          }.tag(2)
        Text("INGRESSOS")
          .tabItem {
            Image(systemName: "ticket.fill")
            Text("Ingressos")
          }.tag(3)
        ProfileView()
          .tabItem {
            Image(systemName: "person.crop.circle.fill")
            Text("Perfil")
          }.tag(4)
      }
      .onAppear {
        let unselectedColor = UIColor(red: 150/255, green: 150/255, blue: 156/255, alpha: 1.0)
        UITabBar.appearance().unselectedItemTintColor = unselectedColor
      }
    }
}
struct tabBarView_Previews: PreviewProvider {
  static var previews: some View {
    TabBarView()
  }
}
