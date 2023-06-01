//
//  FilmesView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 30/05/23.
//

import SwiftUI

struct FilmesView: View {
    @State private var isFilterSheetPresented = false
    @State private var isLocationSheetPresented = false
    @State private var isBagSheetPresented = false
    @State var selectedCity: String? = "Campinas"
    @State private var tipoFilmes = 0
    
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
                        Text("Buscando em")
                            .foregroundColor(Color.white)
                            .font(Font.custom("SF Text Semibold", size: 13))
                        
                        Button(action: {
                            isLocationSheetPresented = true
                        }) {
                            Text("Campinas, SP")
                                .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
                                .font(Font.custom("SF Text Semibold", size: 13))
                        }
                        .sheet(isPresented: $isLocationSheetPresented) {
                            LocationView(selectedCity: $selectedCity)
                                .preferredColorScheme(.dark)
                        }
                    }
//                    HStack{
//                        Text("Buscando em ")
//                            .font(Font.custom("SF Text Semibold", size: 13))
//                            .foregroundColor(Color.white)
//                        Text("Campinas, SP")
//                            .font(Font.custom("SF Text Semibold", size: 13))
//                            .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
//                    }
                    .padding(.trailing, 180)
                    .padding(.bottom, 10)
                    
                    //Barra selecao
                    Picker(selection: $tipoFilmes, label: Text("test")) {
                        Text("Em Cartaz").tag(0)
                        Text("Em Breve").tag(1)
                    
                }
                    .pickerStyle(.segmented)
                    .frame(width: 375)
                   // Fecha barra
                    .padding(.bottom, 16)
                    
                    if tipoFilmes == 0 {
                        CollectionView()
                    }else{
                        Text("")
                    }
                    
                    
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
