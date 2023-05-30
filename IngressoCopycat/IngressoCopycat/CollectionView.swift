//
//  CollectionView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 30/05/23.
//

import Foundation
import SwiftUI


struct CollectionView: View {
    
    @State private var list: [Int] = Array(0...11)
    @State private var selectedItem: Int?
    
    let rows = [GridItem(.fixed(178)), GridItem(.fixed(178))]
    
    
    var body: some View {
                LazyVGrid(columns:rows){
                    ForEach(0...11, id:\.self){ value in
                        NavigationLink (destination: FilmesView()){
                            VStack{
                                Rectangle()
                                    .foregroundColor(Color.white)
                                    .frame(width: 170, height: 95)
                                    .cornerRadius(7)
                                
                                Text("Guardiões da Galáxia")
                                    .font(Font.custom("SF Text Semibold", size:13))
                                    .foregroundColor(Color.white)
                            }
                            
                        }
                        
                    }
                }
            
        
        //Button("Selecionar item aleatório") {
    }
                    
    }

struct FilmesColeection_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
