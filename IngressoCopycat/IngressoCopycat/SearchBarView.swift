//
//  SearchBarView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 30/05/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @State var searchText: String = ""
    
    
    var body: some View {
        
        HStack{
            Image(systemName: "magnifyingglass")
            TextField("Buscar", text: $searchText)
                .overlay(Image(systemName: "mic.fill"), alignment: .trailing)
                
        }
        .padding(8)
        .background(Color(.systemGray5))
        .cornerRadius(8)
        .padding(.horizontal, 8)
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
