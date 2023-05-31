//
//  ProfileView.swift
//  IngressoCopycat
//
//  Created by Vitor Monzillo on 31/05/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    var body: some View {
        NavigationView{
            VStack{
                List {
                    Section{
                        CellView()
                    }
                    NavigationLink(destination: Text("Compras")) {
                        Text("Compras")
                    }
                    NavigationLink(destination: Text("Cards")) {
                        Text("Cartões")
                    }
                    Section{
                        NavigationLink(destination: Text("Cards")) {
                            Text("Resgatar Cartão-Presente")
                        }
                    }
                    
                    Section{
                        NavigationLink(destination: Text("Olá amigo")) {
                        Text("Recomendações")
                    }
                    }
                    
                    
                }
                .listStyle(.insetGrouped)
                .navigationTitle("Perfil")
            }
        }
    }
  
    
    struct CellView: View {
        var body: some View {
            
            NavigationLink(destination: Text("Vou")) {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: 60, maxHeight: 70)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                            .padding(.trailing, 16)
                        
                        VStack(alignment: .leading) {
                            Text("Seixas Miguel")
                                .font(.title2)
                            Text("joaozinhogameplay.com")
                                .font(.subheadline)
                        }
                        .padding(.top, 12)
                    }
                }
            }
        }
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
