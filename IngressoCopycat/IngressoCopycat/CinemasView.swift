//
//  CinemasView.swift
//  IngressoCopycat
//
//  Created by Vitor Monzillo on 30/05/23.
//

import SwiftUI

struct Cinema: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let brand: String
    let shopping: String
    let city: String
    var isFavorite: Bool
    let brandIcon: String
}

struct CinemasView: View {
    @State var isShowingLocationView = false
    @State var isShowingFavoritesView = false
    @State var selectedCity: String? = "Campinas"
    
    @State private var cinemas: [Cinema] = [
        Cinema(name: "Kinoplex Dom Pedro Campinas", brand: "Kinoplex", shopping: "Dom Pedro", city: "Campinas", isFavorite: false, brandIcon: "kinoplex"),
        Cinema(name: "Cinemark Iguatemi São Paulo", brand: "Cinemark", shopping: "Iguatemi", city: "São Paulo", isFavorite: false, brandIcon: "cinemark"),
        Cinema(name: "Cinépolis Galleria Campinas", brand: "Cinépolis", shopping: "Galleria", city: "Campinas", isFavorite: true, brandIcon: "cinepolis"),
        Cinema(name: "Cinemark Iguatemi Campinas", brand: "Cinemark", shopping: "Iguatemi", city: "Campinas", isFavorite: false, brandIcon: "cinemark"),
        Cinema(name: "Kinoplex Dom Pedro São Paulo", brand: "Kinoplex", shopping: "Dom Pedro", city: "São Paulo", isFavorite: false, brandIcon: "kinoplex"),
        Cinema(name: "Cinépolis Galleria Campinas", brand: "Cinépolis", shopping: "Galleria", city: "Campinas", isFavorite: true, brandIcon: "cinepolis"),
        Cinema(name: "Cinépolis Galleria São Paulo", brand: "Cinépolis", shopping: "Iguatemi", city: "Campinas", isFavorite: true, brandIcon: "cinepolis"),
        Cinema(name: "Kinoplex Dom Pedro Barueri", brand: "Kinoplex", shopping: "Dom Pedro", city: "Barueri", isFavorite: false, brandIcon: "kinoplex"),
        Cinema(name: "Kinoplex São José dos Campos", brand: "Kinoplex", shopping: "Dom Pedro", city: "São José dos Campos", isFavorite: false, brandIcon: "kinoplex"),
        Cinema(name: "Cinemark Santos", brand: "Cinemark", shopping: "Iguatemi", city: "Santos", isFavorite: false, brandIcon: "cinemark"),
        Cinema(name: "Cinemark Ribeirão Preto", brand: "Cinemark", shopping: "Iguatemi", city: "Ribeirão Preto", isFavorite: false, brandIcon: "cinemark")
    ]
    
    var favoriteCinemas: [Cinema] {
        cinemas.filter { $0.isFavorite }
    }
    
    var nonFavoriteCinemas: [Cinema] {
        cinemas.filter { !$0.isFavorite }
    }
    
    var cinemasBySelectedCity: [Cinema] {
        if let city = selectedCity {
            return cinemas.filter { $0.city == city }
        } else {
            return []
        }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("Favoritos")) {
                    ForEach(favoriteCinemas) { cinema in
                        NavigationLink(destination: Text("inserir filmes aqui")) {
                            HStack {
                                Image(cinema.brandIcon)
                                    .resizable()
                                    .cornerRadius(5)
                                    .frame(width: 28, height: 28)
                                
                                Text(cinema.name)
                                
                                Spacer()
                            }
                        }
                    }
                }
                
                if let city = selectedCity {
                    Section(header: Text("Cinemas em \(city)")) {
                        ForEach(cinemasBySelectedCity) { cinema in
                            NavigationLink(destination: Text("inserir filmes aqui")) {
                                HStack {
                                    Image(cinema.brandIcon)
                                        .resizable()
                                        .cornerRadius(5)
                                        .frame(width: 28, height: 28)
                                    
                                    Text(cinema.name)
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                
                Section(header: Text("Outros Cinemas")) {
                    ForEach(nonFavoriteCinemas) { cinema in
                        NavigationLink(destination: Text("inserir filmes aqui")) {
                            HStack {
                                Image(cinema.brandIcon)
                                    .resizable()
                                    .cornerRadius(5)
                                    .frame(width: 28, height: 28)
                                
                                Text(cinema.name)
                                
                                Spacer()
                            }
                        }
                    }
                }
            }
            
            
            
            .navigationBarTitle("Cinemas")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(action: {
                            isShowingFavoritesView = true
                        }) {
                            Label("Favoritar Cinemas", systemImage: "star")
                        }
                        
                        Button(action: {
                            isShowingLocationView = true
                        }) {
                            Label("Mudar Localização", systemImage: "location")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .imageScale(.large)
                    }
                }
            }
            .sheet(isPresented: $isShowingLocationView) {
                LocationView(selectedCity: $selectedCity)
            }
            .sheet(isPresented: $isShowingFavoritesView) {
                FavoritesView(cinemas: $cinemas)
            }
        }
        .onAppear {
            if selectedCity == nil {
                selectedCity = "Campinas"
            }
        }
    }
    
}


struct CinemasView_Previews: PreviewProvider {
    static var previews: some View {
        CinemasView()
    }
}
