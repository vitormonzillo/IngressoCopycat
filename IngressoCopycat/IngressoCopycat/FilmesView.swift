//
//  FilmesView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 30/05/23.
//

import SwiftUI

struct FilmesView: View {
    @State private var isFilterSheetPresented = false
    @State private var isBagSheetPresented = false
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                VStack{
                    
                    HStack{
                        SearchBarView()
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
                    HStack{
                        Text("Buscando em ")
                            .font(Font.custom("SF Text Semibold", size: 13))
                            .foregroundColor(Color.white)
                        Text("Campinas, SP")
                            .font(Font.custom("SF Text Semibold", size: 13))
                            .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
                    }
                    .padding(.trailing, 180)
                    .padding(.bottom, 10)
                    
                    //Barra selecao
                    ZStack{
                        Rectangle()
                            .frame(width: 358, height: 32)
                            .foregroundColor(Color(red: 50/255, green: 51/255, blue: 54/255))
                            .cornerRadius(10)
                        Rectangle()
                            .frame(width: 178, height:28)
                            .foregroundColor(Color(red: 99/255, green: 99/255, blue: 102/255))
                            .cornerRadius(7)
                            .padding(.trailing, 168)
                        Text("Em Cartaz")
                            .font(Font.custom("SF Text Semibold", size:13))
                            .foregroundColor(.white)
                            .padding(.trailing, 168)
                        Text("Em Breve")
                            .font(Font.custom("SF Text Semibold", size:13))
                            .foregroundColor(.white)
                            .padding(.leading, 168)
                    }// Fecha barra
                    .padding(.bottom, 30)
                    
                    CollectionView()
                    
                }// Fecha VStack
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Filmes")
            
        }
    }
}

struct FilmesView_Previews: PreviewProvider {
    static var previews: some View {
        FilmesView()
    }
}
