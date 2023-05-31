//
//  DetailView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 30/05/23.
//

import SwiftUI

struct DetailView: View {
    @State private var isFilterSheetPresented = false
    @State private var isBagSheetPresented = false
    @State private var showFullText = false
    
    @ObservedObject var filmes: Library = Library()
    
    var movie: Movie
    
    var body: some View {
        VStack{
            ScrollView{
                ZStack{
                    Image(movie.FotoFundo)
                        .resizable()
//                        .frame(height: 600)
                        .scaledToFit()
                        .toolbar {
                            ToolbarItem(placement: .primaryAction){
                                Button() {
                                    isBagSheetPresented = true
                                }label:{
                                    Image(systemName: "bag")
                                        .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
                                        .font(Font.custom("SF Text Semibold", size: 20))
                                }
                                .sheet(isPresented: $isBagSheetPresented) {
                                    BagSelectionView()
                                }
                            }
                            
                        }
                        
                    
                        
                    Rectangle()
                        .fill(
                            LinearGradient(gradient:Gradient(colors: [.white.opacity(0.2), .black]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 400, height: 605)
                    VStack{
                        Rectangle()
                            .frame(width: 400, height: 250)
                            .foregroundColor(Color(red: 1/255, green: 1/255, blue: 1/255, opacity: 0/100))
                        Spacer()
                        Text(movie.nome)
                            .foregroundColor(Color.white)
                            .font(Font.custom("SF Pro Text Bold", size: 30))
                            .padding(.bottom, 16)
                            .lineLimit(1)
                        HStack{
                            Text(movie.tipo)
                                .foregroundColor(Color(red: 177/255, green: 177/255, blue: 177/255))
                                .font(Font.custom("SF Pro Text Bold", size: 13))
                            Text(movie.ano)
                                .foregroundColor(Color(red: 177/255, green: 177/255, blue: 177/255))
                                .font(Font.custom("SF Pro Text Bold", size: 13))
                            Text(movie.duracao)
                                .foregroundColor(Color(red: 177/255, green: 177/255, blue: 177/255))
                                .font(Font.custom("SF Pro Text Bold", size: 13))
                        }
                        .padding(.bottom, 16)
                        
                        NavigationLink (destination: MovieSessionsView(movie: movie)){
                            ZStack{
                                Rectangle()
                                    .frame(width: 265, height: 44)
                                    .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
                                    .cornerRadius(12)
    
                                Text("Ver Sessões")
                                    .foregroundColor(Color.white)
                                    .font(Font.custom("SF Pro Text Bold", size: 17))
                                
                            }
                            .padding(.bottom, 16)
                            .navigationTitle(movie.nome)
                            
                        }
                        
                        VStack{
                            if showFullText{
                                Text(movie.sinopse)
                                    .foregroundColor(Color.white)
                                    .font(Font.custom("SF Pro Text Semibold", size: 14))
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                                
                                
                            }else{
                                Text(movie.sinopse)
                                    .foregroundColor(Color.white)
                                    .font(Font.custom("SF Pro Text Semibold", size: 14))
                                    .padding(.leading, 20)
                                
                                    .padding(.trailing, 20)
                                    .lineLimit(3)
                                    .truncationMode(.tail)
                            }
                            
                            HStack{
                                
                                Button{
                                    showFullText.toggle()
                                }label: {
                                    Text(showFullText ? "Read less" : "Read more")
                                        .font(Font.custom("SF Pro Text Bold", size: 14))
                                        .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
                                        .padding(.bottom, 16)
                                        .offset(x: 0, y: 2)
                                }
                                .padding(.leading, 20)
                                Spacer()
                                
                                
                                
                            }
                            HStack{
                                Image("tomate")
                                    .resizable()
                                    .frame(width: 20, height: 25)
                                Text("\(movie.critica)%")
                                    .font(Font.custom("SF Pro Text Bold", size: 14))
                                    .foregroundColor(Color.white)
                                    .padding(.trailing, 8)
                                Image("pipoca")
                                    .resizable()
                                    .frame(width: 20, height: 25)
                                Text("\(movie.publico)%")
                                    .font(Font.custom("SF Pro Text Bold", size: 14))
                                    .foregroundColor(Color.white)
                                Image(movie.classificacao)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Spacer()
                            }
                            .padding(.leading, 20)
                            .padding(.bottom, 20)
                            
                            
                            
                        }// Fecha VStack
                    }// Fecha VStack
                    
                }//Fecha ZStack
                
//                .padding(.top)
                VStack(alignment: .leading){
                    HStack{
                        Image(movie.classificacao)
                            .resizable()
                            .frame(width: 25, height: 25)
                        
                        Text("Contraindicacoes")
                            .font(Font.custom("SF Pro Text Bold", size: 12))
                            .foregroundColor(Color(red: 177/255, green: 177/255, blue: 177/255))
                        
                        Spacer()
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                    
                    VStack(alignment: .leading){
                        
                        Text("Duração")
                            .font(Font.custom("SF Pro Text Bold", size: 16))
                            .foregroundColor(Color.white)
                            .padding(.top, 5)
                        Text(movie.duracao)
                            .font(Font.custom("SF Pro Text Bold", size: 15))
                            .foregroundColor(Color.gray)
                            
                        Text("Elenco")
                            .font(Font.custom("SF Pro Text Bold", size: 16))
                            .foregroundColor(Color.white)
                            .padding(.top, 5)
                        Text(movie.elenco)
                            .font(Font.custom("SF Pro Text Bold", size: 15))
                            .foregroundColor(Color.gray)
                        
                        Text("Digido por")
                            .font(Font.custom("SF Pro Text Bold", size: 16))
                            .foregroundColor(Color.white)
                            .padding(.top, 5)
                        Text(movie.diretor)
                            .font(Font.custom("SF Pro Text Bold", size: 15))
                            .foregroundColor(Color.gray)
                            
                        Text("Distribuidora")
                            .font(Font.custom("SF Pro Text Bold", size: 16))
                            .foregroundColor(Color.white)
                            .padding(.top, 5)
                        Text(movie.distribuidora)
                            .font(Font.custom("SF Pro Text Bold", size: 15))
                            .foregroundColor(Color.gray)
                        
                        Text("País de Origem")
                            .font(Font.custom("SF Pro Text Bold", size: 16))
                            .foregroundColor(Color.white)
                            .padding(.top, 5)
                        Text(movie.País)
                            .font(Font.custom("SF Pro Text Bold", size: 15))
                            .foregroundColor(Color.gray)
                    }
                }//FechaVStack
                .padding(.leading, 20)
                
                
            }
            
        }
        .navigationTitle("Filme")
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(.white)
    }
    
}

//private var backButton: some View {
//    Button(action: {
//        // Handle back button action here
//    }) {
//        HStack{
//            Image(systemName: "chevron.left")
//                .imageScale(.large)
//                .frame(width: 44, height: 44)
//                .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
//                .padding(.trailing, -10)
//            
//            Text("Filmes")
//                .font(Font.custom("SF Text Semibold", size: 20))
//                .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
//            Spacer()
//            
//        }
//    }
//}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie:  Movie(nome: "Guardiões da Galaxia", tipo: "Aventura", duracao: "1h 43m", ano: "2023", sinopse: "Em “Guardiões da Galáxia Vol. 3” nosso amado grupo de desajustados está se estabelecendo em Knowhere. Mas não demora muito até que suas vidas sejam reviradas pelo passado turbulento de Rocket. Peter Quill, ainda se recuperando da perda de Gamora, deve reunir sua equipe em uma missão perigosa para salvar a vida de Rocket - uma missão que, se não for concluída com sucesso, pode levar ao fim dos Guardiões como os conhecemos.", critica: "81", publico: "91", classificacao: "14", FotoFundo: "guardians", Fotoinicio: "guardiansInicio", elenco: "Chris Pratt, Zoe Saldana, Dave Bautista, Vin Diesel (oz), Bradley Cooper (Voz), Karen Gillan, Pom Klementieff, Elizabeth Debicki", diretor: "James Gunn", distribuidora: "Disney", País: "Estados Unidos"))
    }
}
