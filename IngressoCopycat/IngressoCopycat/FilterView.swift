//
//  FilterView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 30/05/23.
//

import SwiftUI

struct Tipos: Identifiable {
    var id = UUID()
    var filtro: String
    var simbolo: String
}

struct FilterSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedItems = Set<Int>()
    @State private var selected = false
    @State var Filtros = [Tipos(filtro: "Legendado", simbolo: "text.below.photo"),Tipos(filtro: "Dublado", simbolo: "text.bubble"), Tipos(filtro: "Filmes em 2D", simbolo: "view.2d"), Tipos(filtro: "Filmes em 3D", simbolo: "view.3d")]
    
    
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView{
                VStack {
                    List(0..<4, id: \.self) { index in
                        Button(action: {
                            if self.selectedItems.contains(index) {
                                self.selectedItems.remove(index)
                            } else {
                                self.selectedItems.insert(index)
                            }
                        }) {
                            HStack(alignment: .center) {
                                Image(systemName: Filtros[index].simbolo)
                                    .foregroundColor(Color.white)
                                Text(Filtros[index].filtro)
                                    .font(Font.custom("SF Pro Text Semibold", size: 17))
                                    .foregroundColor(.white)
                                Spacer()
                                if self.selectedItems.contains(index) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.white)
                                }
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
                .navigationTitle("Sacola")
                .navigationBarTitleDisplayMode(.inline)
                
                .padding()
            }
           
        }
        
    }
}

struct click: View{
    @State var check = false
    var body: some View{
        if check == false{
            Image(systemName: "checkmark")
                .hidden()
        }else{
            Image(systemName: "checkmark")
        }
    }
}

struct BagSelectionView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var check = false
    @State private var selectedItems = Set<Int>()
    var body: some View {
        
        // Add more filter buttons as needed
        GeometryReader { geometry in
            NavigationView{
                VStack {
                    Spacer()
                    
                    
                   
                    
                }
                .navigationBarItems(trailing: Button(action: {
                    dismiss()
                }, label: {
                    Text("Fechar")
                        .fontWeight(.bold)
                }))
                .navigationTitle("Filtros")
                .navigationBarTitleDisplayMode(.inline)
                
                
                .padding()
            }
            
        }
    }
}



struct FiltroView_Previews: PreviewProvider {
    static var previews: some View {
        FilterSelectionView()
        BagSelectionView()
    }
}

