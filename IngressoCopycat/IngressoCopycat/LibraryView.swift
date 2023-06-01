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
    var ano: String
    var sinopse: String
    var critica: String
    var publico: String
    var classificacao: String
    var FotoFundo: String
    var Fotoinicio: String
    var elenco: String
    var diretor: String
    var distribuidora: String
    var País: String
    
}

struct Session : Identifiable{
    var id = UUID()
    var cinema: String
    var tipo: String
    var data: String
    var horario: String
}

class Library: ObservableObject {
   @Published var movies = [
        Movie(nome: "Guardiões da Galaxia", tipo: "Aventura", duracao: "1h 43m", ano: "2023", sinopse: "Em “Guardiões da Galáxia Vol. 3” nosso amado grupo de desajustados está se estabelecendo em Knowhere. Mas não demora muito até que suas vidas sejam reviradas pelo passado turbulento de Rocket. Peter Quill, ainda se recuperando da perda de Gamora, deve reunir sua equipe em uma missão perigosa para salvar a vida de Rocket - uma missão que, se não for concluída com sucesso, pode levar ao fim dos Guardiões como os conhecemos.", critica: "81", publico: "91", classificacao: "14", FotoFundo: "guardians", Fotoinicio: "guardiansInicio", elenco: "Chris Pratt, Zoe Saldana, Dave Bautista, Vin Diesel (oz), Bradley Cooper (Voz), Karen Gillan, Pom Klementieff, Elizabeth Debicki", diretor: "James Gunn", distribuidora: "Disney", País: "Estados Unidos"),
        
        Movie(nome: "Dungeons and Dragons: Honra Entre Rebeldes", tipo: "Aventura", duracao: "1h 37m", ano: "2023", sinopse: "Baseado no famoso jogo Dungeons & Dragons de Role Playing game (RPG), o filme contará a história de um ex-harpista e sua parceira, uma humana bárbara, que após fugirem da prisão se juntam ao um mago sem talento e uma druida novata para roubar o trapaceiro responsável por colocar o harpista atrás das grades. Ele, agora chamado de Senhor de Neverwinter, tem como seu aliado um poderoso Mago Vermelho.", critica: "84", publico: "76", classificacao: "14", FotoFundo: "dungeons", Fotoinicio: "dugeonsInicio", elenco: "Justice Smith, Sophia Lillis, Chris Pine, Chloe Coleman, Hugh Grant, Michelle Rodriguez, Regé-Jean Page, Jason Wong, Daisy Head.", diretor: "John Francis Daley, Jonathan Goldstein", distribuidora: "Paramount", País: "Estados Unidos"),
        
        Movie(nome: "A Morte do Demônio: A Ascensão", tipo: "Terror", duracao: "1h 43m", ano: "2023", sinopse: "MPORTANTE - Não recomendado para menores de 18 anos Movendo o terror para fora da floresta e para dentro da cidade, o filme conta a história distorcida de duas irmãs distantes, interpretadas por Sutherland e Sullivan, cujo reencontro é interrompido pela ascensão de demônios possuidores de carne que as empurram para uma batalha pela sobrevivência enquanto enfrentam a versão mais aterrorizante da sua família", critica: "81", publico: "91", classificacao: "18", FotoFundo: "demonio", Fotoinicio: "demonioInicio", elenco: "Alyssa Sutherland, Lily Sullivan, Morgan Davies.", diretor: "Lee Cronin", distribuidora: "Warner Bros", País: "Estados Unidos"),
        
        Movie(nome: "Os Cavaleiros do Zodíaco", tipo: "Aventura", duracao: "1h 52m", ano: "2023", sinopse: "Baseado no anime que é um fenômeno internacional, Os Cavaleiros do Zodíaco: Saint Seiya – O Começo traz a saga de Saint Seiya para a tela grande em live-action pela primeira vez. Seiya (Mackenyu), é um jovem obstinado que passa seu tempo lutando por dinheiro enquanto procura por sua irmã sequestrada. Quando uma de suas lutas inadvertidamente explora poderes místicos que ele nunca soube que tinha, Seiya se vê lançado em um mundo de guerreiros, treinamento mágico antigo e uma deusa reencarnada que precisa de sua proteção. Se ele quiser sobreviver, precisará abraçar seu destino e sacrificar tudo para ocupar seu lugar de direito entre os Cavaleiros do Zodíaco.", critica: "25", publico: "62", classificacao: "14", FotoFundo: "cavaleiros", Fotoinicio: "cavaleirosInicio", elenco: "Mackenyu Arata, Sean Bean, Famke Janssen,Madison Iseman, Mark Dacascos", diretor: "Tomasz Baginski", distribuidora: "Sony Pictures", País: "Japão"),
        
        Movie(nome: "Renfield - Dando Sangue Pelo Chefe", tipo: "Comédia", duracao: "1h 33m", ano: "2023", sinopse: "O mal não dura a eternidade sem uma pequena ajuda. Nesta moderna história de monstros sobre o leal servo de Drácula, Nicholas Hoult (Mad Max: Estrada da Fúria, franquia X-Men) estrela como Renfield, o torturado ajudante do chefe mais narcisista da história, Drácula (vencedor do Oscar® Nicolas Cage). Renfield é forçado a obter a presa de seu mestre e cumprir todas as suas ordens, não importa o quão degradado seja. Mas agora, após séculos de servidão, Renfield está pronto para ver se há uma vida fora da sombra do Príncipe das Trevas. Se ao menos ele pudesse descobrir como acabar com sua co-dependência.", critica: "58", publico: "79", classificacao: "18", FotoFundo: "renfield", Fotoinicio: "renfieldInicio", elenco: "Nicholas Hoult, Nicolas Cage, Awkwafina, Shohreh Aghdashloo, Ben Schwartz.", diretor: "Chris McKay", distribuidora: "Universal Pictures Brasil", País: "Estados Unidos"),
        
        Movie(nome: "John Wick 4: Baba Yaga", tipo: "Ação", duracao: "2h 49m", ano: "2023", sinopse: "Com o preço por sua cabeça cada vez maior, o lendário assassino de aluguel John Wick leva sua luta contra o High Table global enquanto procura os jogadores mais poderosos do submundo, de Nova York a Paris, do Japão a Berlim.", critica: "94", publico: "93", classificacao: "16", FotoFundo: "john", Fotoinicio: "johnInicio", elenco: "Keanu Reeves, Donnie Yen, Bill Skarsgård, Laurence Fishburne, Hiroyuki Sanada, Shamier Anderson, Lance Reddick, Rina Sawayama, Scott Adkins e Ian McShane", diretor: "Chad Stahelski", distribuidora: "Paris Filmes", País: "Estados Unidos"),
        
        Movie(nome: "O Exorcista do Papa", tipo: "Terror", duracao: "1h 43m", ano: "2023", sinopse: "A trama será baseada na história real do exorcista Gabriele Amorth, “um lendário padre italiano que realizou mais de 100 mil exorcismo para o vaticano”.", critica: "50", publico: "81", classificacao: "18", FotoFundo: "exorcista", Fotoinicio: "exorcistaInicio", elenco: "Russell Crowe, Alex Essoe, Daniel Zovatto", diretor: "Julius Avery", distribuidora: "Sony Pictures", País: "Estados Unidos"),
        
        Movie(nome: "Super Mario Bros", tipo: "Aventura", duracao: "1h 32m", ano: "2023", sinopse: "Mario é um filme baseado na série de video games, Super Mario Bros, da Nintendo. Em Super Mario Bros. - O Filme, Mario (Chris Pratt) é um encanador qualquer no bairro de Brooklyn junto com seu irmão Luigi (Charlie Day). Um dia, Mario e Luigi vão para no reino dos cogumelos, governado pela Princesa Peach (Anya Taylor-Joy), mas ameaçado pelo rei dos Koopas, Bowser (Jack Black), que vai fazer de tudo para conseguir reinar todos os lugares. É então quando Luigi é raptado por Bowser e o usa para procurar Mario, o único capaz de deter o Koopa e reestabelexcer a paz. Mario terá que aprender como viver nesse novo reino perigoso, passando por vários biomas, aprender a dirigir carros, utilizar itens que o fazem soltar bolas de fogo das mãos, virar um animal e andar em plataformas nada confiáveis. Também estará acompanhados de amigos, como Toad (Keegan-Michael Key) e Donkey Kong (Seth Rogan).", critica: "59", publico: "96", classificacao: "L", FotoFundo: "mario", Fotoinicio: "marioInicio", elenco: "Raphael Rossatto, Chris Pratt, Manolo Rey", diretor: "Aaron Horvath, Michael Jelenic", distribuidora: "Warner Bros", País: "Estados Unidos")
    ]
    
    @Published var sessions = [Session(cinema: "Kinoplex Dom pedro", tipo: "2D Dublado", data: "Sexta-Feira, 05/04", horario: "16:40"),
                               Session(cinema: "Cinemark Iguatemi Campinas", tipo: "2D Dublado", data: "Domingo 07/04", horario: "13:30"),
                               Session(cinema: "Cinemark Iguatemi Campinas", tipo: "3D Legendado", data: "Domingo 07/04", horario: "16:00"),
                               Session(cinema: "Cinépolis Shopping Campinas", tipo: "2D Legendado", data: "Sábado 06/04", horario: "19:40"),
                               Session(cinema: "Kinoplex Dom pedro", tipo: "3D Legendado", data: "Segunda 08/04", horario: "20:00"),
                               Session(cinema: "Kinoplex Dom pedro", tipo: "2D Legendado", data: "Sábado 13/04", horario: "16:30"),
                               Session(cinema: "Cinemark Iguatemi Campinas", tipo: "3D Dublado", data: "Domingo 14/04", horario: "17:00"),
                               Session(cinema: "Cinépolis Shopping Campinas", tipo: "3D Dublado", data: "Domingo 07/04", horario: "20:00")]
}


//criar uma classe
