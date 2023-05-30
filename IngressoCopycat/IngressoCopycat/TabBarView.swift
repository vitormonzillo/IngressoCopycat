//
//  TabBarView.swift
//  IngressoCopycat
//
//  Created by Vitor Monzillo on 30/05/23.
//

import Foundation
import SwiftUI

struct tabBarView: View {
  @State private var SelectedTab = 0
  var body: some View {
      TabView(selection: $SelectedTab) {
        FilmesView()
          .tabItem {
            Image(systemName: "popcorn.fill")
            Text("Filmes")
          }.tag(0)
        Text("CINEMAS")
          .tabItem {
            Image(systemName: "map.fill")
            Text("Cinemas")
          }.tag(1)
        Text("NOTICIAS")
          .tabItem {
            Image(systemName: "newspaper.fill")
            Text("Notícias")
          }.tag(2)
        Text("INGRESSOS")
          .tabItem {
            Image(systemName: "ticket.fill")
            Text("Ingressos")
          }.tag(3)
        Text("PERFIL")
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
    tabBarView()
  }
}
