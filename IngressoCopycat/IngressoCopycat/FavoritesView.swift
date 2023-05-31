//
//  FavoritesView.swift
//  IngressoCopycat
//
//  Created by Vitor Monzillo on 30/05/23.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var cinemas: [Cinema]
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach(cinemas) { cinema in
                        Button(action: {
                            toggleFavorite(cinema)
                        }) {
                            HStack {
                                Image(cinema.brandIcon)
                                    .resizable()
                                    .cornerRadius(5)
                                    .frame(width: 28, height: 28)
                                
                                Text(cinema.name)
                                
                                Spacer()
                                
                                Image(systemName: cinema.isFavorite ? "star.fill" : "star")
                                    .foregroundColor(cinema.isFavorite ? .yellow : .gray)
                            }
                        }
                    }
                }
                .navigationBarItems(trailing: Button(action: {
                    dismiss()
                }, label: {
                    Text("Fechar")
                        .fontWeight(.bold)
                }))
                .navigationBarTitle("Favoritar Cinemas")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    func toggleFavorite(_ cinema: Cinema) {
        if let index = cinemas.firstIndex(where: { $0.id == cinema.id }) {
            cinemas[index].isFavorite.toggle()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    @State static var cinemas: [Cinema] = [
        Cinema(name: "Kinoplex Dom Pedro Campinas", brand: "Kinoplex", shopping: "Dom Pedro", city: "Campinas", isFavorite: false, brandIcon: "kinoplex"),
        Cinema(name: "Cinemark Iguatemi São Paulo", brand: "Cinemark", shopping: "Iguatemi", city: "São Paulo", isFavorite: false, brandIcon: "cinemark"),
        Cinema(name: "Cinépolis Galleria Campinas", brand: "Cinépolis", shopping: "Galleria", city: "Campinas", isFavorite: true, brandIcon: "cinepolis"),
        Cinema(name: "Cinemark Iguatemi Campinas", brand: "Cinemark", shopping: "Iguatemi", city: "Campinas", isFavorite: false, brandIcon: "cinemark"),
        Cinema(name: "Kinoplex Dom Pedro São Paulo", brand: "Kinoplex", shopping: "Dom Pedro", city: "São Paulo", isFavorite: false, brandIcon: "kinoplex"),
        Cinema(name: "Cinépolis Galleria Campinas", brand: "Cinépolis", shopping: "Galleria", city: "Campinas", isFavorite: true, brandIcon: "cinepolis"),
        Cinema(name: "Cinépolis Galleria São Paulo", brand: "Cinépolis", shopping: "Iguatemi", city: "Campinas", isFavorite: true, brandIcon: "cinepolis")
    ]
    
    static var previews: some View {
        FavoritesView(cinemas: $cinemas)
    }
}
