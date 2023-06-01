//
//  NewsView.swift
//  IngressoCopycat
//
//  Created by Vitor Monzillo on 31/05/23.
//

import SwiftUI

struct News: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let date: String
}

let sampleNews: [News] = [
    News(imageName: "news1", title: "Morre Homem Aranha aos 12 anos", description: "Tom Holland caiu num burnaco nas ruas de barueri ele não tava vendo nada tadinho", date: "01/05/2023"),
    News(imageName: "news2", title: "Velozes e Furiosos 14 vem aí", description: "Toretto não terminou sua missão, ele ainda não reformou o Maverick do pai dele, e ta tentando até conseguir", date: "02/05/2023"),
    News(imageName: "news3", title: "Título da notícia 3", description: "Descrição da notícia 3", date: "03/05/2023"),
    News(imageName: "news3", title: "Título da notícia 3", description: "Descrição da notícia 3", date: "03/05/2023"),
    News(imageName: "news3", title: "Título da notícia 3", description: "Descrição da notícia 3", date: "03/05/2023"),
    News(imageName: "news3", title: "Título da notícia 3", description: "Descrição da notícia 3", date: "03/05/2023")
]

struct NewsView: View {
    let newsData: [News] = sampleNews
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TabView {
                        ForEach(newsData) { news in
                            VStack {
                                Image(news.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 360, height: 240)
                                    .cornerRadius(10)
                                    .shadow(radius: 8)
                                
                                Text(news.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                        }
                    }
                    .frame(height: 380)
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    
                    ForEach(newsData) { news in
                        NewsRow(news: news)
                    }
                }
                
            }
            .navigationTitle("Notícias")
        }
    }
}

struct NewsRow: View {
    let news: News
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(news.imageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text(news.title)
                        .font(.headline)
                    
                    Text(news.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(news.date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 8)
            
            Divider()
        }
    }
}


struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
