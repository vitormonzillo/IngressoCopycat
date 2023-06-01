//
//  IngressosView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 01/06/23.
//

import SwiftUI

struct IngressosView: View {
    @State private var isFilterSheetPresented = false
    @State private var isBagSheetPresented = false
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                SearchBarView()
                IngressoCollectionView()
                    .padding(.top, 16)
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction){
                    Button(action: {
                        isFilterSheetPresented = true
                    }) {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
                            .font(Font.custom("SF Text Semibold", size: 20))
                    }
                    .sheet(isPresented: $isFilterSheetPresented) {
                        FilterSelectionView()
                            .preferredColorScheme(.dark)
                    }
                    Button() {
                        isBagSheetPresented = true
                    }label:{
                        Image(systemName: "bag")
                            .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
                            .font(Font.custom("SF Text Semibold", size: 20))
                    }
                    .sheet(isPresented: $isBagSheetPresented) {
                        BagSelectionView()
                            .preferredColorScheme(.dark)
                    }
                }

            }
            .navigationTitle("Ingressos")
            .navigationBarBackButtonHidden(true)
            
        }
    }
}

struct IngressosView_Previews: PreviewProvider {
    static var previews: some View {
        IngressosView()
    }
}
