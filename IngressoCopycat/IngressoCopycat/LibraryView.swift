//
//  LibraryView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 30/05/23.
//

import SwiftUI

//criar um hashable
struct Movie: Identifiable {
    var id = UUID()
    var nome: String
    var tipo: String
    var duracao: String
    var ano: Int
    var sinopse: String
    var critica: Int
    var publico: Int
    var classificacao: Int
    var FotoFundo: String
    var Fotoinicio: String
}

class Library: ObservableObject {
   @Published var movies = [
        Movie(nome: "Guardiões da Galaxia", tipo: "Aventura", duracao: "1h 43m", ano: 2023, sinopse: "Texto aqui", critica: 81, publico: 91, classificacao: 14, FotoFundo: "guardians", Fotoinicio: "guardiansInicio"),
        Movie(nome: "Super Mario Bros", tipo: "Aventura", duracao: "1h 32m", ano: 2023, sinopse: "Texto aqui", critica: 59, publico: 96, classificacao: 0, FotoFundo: "mario", Fotoinicio: "marioInicio"),
        Movie(nome: "Dungeons and Dragons: Honra Entre Rebeldes", tipo: "Aventura", duracao: "1h 37m", ano: 2023, sinopse: "Texto aqui", critica: 84, publico: 76, classificacao: 14, FotoFundo: "dungeons", Fotoinicio: "dugeonsInicio"),
        Movie(nome: "A Morte do Demônio: A Ascensão", tipo: "Terror", duracao: "1h 43m", ano: 2023, sinopse: "Texto aqui", critica: 81, publico: 91, classificacao: 18, FotoFundo: "demonio", Fotoinicio: "demonioInicio"),
        Movie(nome: "Os Cavaleiros do Zodíaco", tipo: "Aventura", duracao: "1h 52m", ano: 2023, sinopse: "Texto aqui", critica: 25, publico: 62, classificacao: 14, FotoFundo: "cavaleiros", Fotoinicio: "cavaleirosInicio"),
        Movie(nome: "Renfield - Dando Sangue Pelo Chefe", tipo: "Comédia", duracao: "1h 33m", ano: 2023, sinopse: "Texto aqui", critica: 58, publico: 79, classificacao: 18, FotoFundo: "renfield", Fotoinicio: "renfieldInicio"),
        Movie(nome: "John Wick 4: Baba Yaga", tipo: "Ação", duracao: "2h 49m", ano: 2023, sinopse: "Texto aqui", critica: 94, publico: 93, classificacao: 18, FotoFundo: "john", Fotoinicio: "johnInicio"),
        Movie(nome: "O Exorcista do Papa", tipo: "Terror", duracao: "1h 43m", ano: 2023, sinopse: "Texto aqui", critica: 50, publico: 81, classificacao: 18, FotoFundo: "exorcista", Fotoinicio: "exorcistaInicio"),
    ]
}


//criar uma classe
