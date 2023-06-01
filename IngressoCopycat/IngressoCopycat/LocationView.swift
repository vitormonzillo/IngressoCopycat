//
//  LocationView.swift
//  IngressoCopycat
//
//  Created by Vitor Monzillo on 30/05/23.
//

import SwiftUI

struct LocationView: View {
    @State private var searchQuery = ""
    @Environment(\.dismiss) var dismiss
    @Binding var selectedCity: String?
 
    let cities = [
            "Campinas",
            "São Paulo",
            "Sorocaba",
            "Ribeirão Preto",
            "Santos",
            "Guarulhos",
            "Osasco",
            "São José dos Campos",
            "Mogi das Cruzes",
            "Barueri"
        ]
    
    var filteredCities: [String] {
            if searchQuery.isEmpty {
                return cities
            } else {
                return cities.filter { $0.lowercased().contains(searchQuery.lowercased()) }
            }
        }
        
        var body: some View {
            NavigationView {
                VStack {
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Buscar", text: $searchQuery)
                            .overlay(Image(systemName: "mic.fill"), alignment: .trailing)
                            
                    }
                    .padding(8)
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
                    .padding(.horizontal, 8)
                            
                            List(filteredCities, id: \.self) { city in
                                Button(action: {
                                    selectedCity = city
                                    dismiss()
                                }) {
                                    Text(city)
                                        .foregroundColor(.white)
                                }
                            }

                            .navigationBarItems(trailing: Button(action: {
                                dismiss()
                            }, label: {
                                Text("Fechar")
                                    .fontWeight(.bold)
                            }))
                            .navigationBarTitle("Mudar Localização")
                            .navigationBarTitleDisplayMode(.inline)
                        }
            }
        }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(selectedCity: .constant(nil))
    }
}
