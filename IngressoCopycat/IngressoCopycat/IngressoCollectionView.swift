//
//  IngressoCollectionView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 01/06/23.
//

import SwiftUI

struct IngressoCollectionView: View {
    
    @State private var list: [Int] = Array(0...4)
    @State private var selectedItem: Int?
    @ObservedObject var movie: Library = Library()
    @State var num = index
    
    let rows = [GridItem(.fixed(300))]
    
    
    var body: some View {
        LazyVGrid(columns:rows){
            ForEach(0..<movie.movies.count, id:\.self){ index in
                NavigationLink (destination: IndividualView()){
                    ZStack{
                        Rectangle()
                            .frame(width: 350, height: 160)
                            .cornerRadius(12)
                            .foregroundColor(Color(red: 49/255, green: 49/255, blue: 54/255))
                        HStack{
                            Image(movie.movies[index].Fotoinicio)
                                .resizable()
                                .frame(width: 100, height: 120)
                                .cornerRadius(10)
                                .padding(.trailing, 6)
                                .padding(.leading)
                            
                            VStack(alignment: .leading){
                                Text(movie.movies[index].nome)
                                    .font(Font.custom("SF Pro Text Bold", size: 21))
                                    .foregroundColor(.white)
                                    .lineLimit(1)
                                    .padding(.trailing)
                                Text("2D Dublado")
                                    .font(Font.custom("SF Pro Text Bold", size: 18))
                                    .foregroundColor(.white)
                                    .padding(.top, 6)
                                Text("Kinoplex Dom Pedro")
                                    .font(Font.custom("SF Pro Text Bold", size: 18))
                                    .foregroundColor(.white)
                                HStack{
                                    Text("Data:")
                                        .font(Font.custom("SF Pro Text Bold", size: 18))
                                        .foregroundColor(.white)
                                    Text("Sexta-Feira, 05/04")
                                        .font(Font.custom("SF Pro Text", size: 16))
                                        .foregroundColor(.white)
                                }
                                HStack{
                                    Text("Horario:")
                                        .font(Font.custom("SF Pro Text Bold", size: 18))
                                        .foregroundColor(.white)
                                    Text("16:40")
                                        .font(Font.custom("SF Pro Text", size: 16))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    .padding(.top, 6)
                }
                
            }
            
        }
        
        
        //Button("Selecionar item aleatório") {
    }
}

struct IngressoCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        IngressoCollectionView()
    }
}
