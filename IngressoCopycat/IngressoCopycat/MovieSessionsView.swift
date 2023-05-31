//
//  MovieSessionsView.swift
//  IngressoCopycat
//
//  Created by Vitor Monzillo on 30/05/23.
//

import SwiftUI

struct CinemaSession: Identifiable, Hashable {
    let id = UUID()
    let cinema: String
    let date: Date
    let language: String
    let format: String
    let time: String
}

struct MovieSessionsView: View {
    @State private var selectedDate = Date()
    @State private var selectedCinema: String? = nil
    
    var movie: Movie

    let sessions: [CinemaSession] = [
        CinemaSession(cinema: "Cinema A", date: Date(), language: "Dublado", format: "2D", time: "10:00"),
        CinemaSession(cinema: "Cinema A", date: Date(), language: "Legendado", format: "2D", time: "11:00"),
        CinemaSession(cinema: "Cinema A", date: Date(), language: "Dublado", format: "3D", time: "12:30"),
        CinemaSession(cinema: "Cinema A", date: Date(), language: "Legendado", format: "3D", time: "13:00"),
        CinemaSession(cinema: "Cinema B", date: Date(), language: "Dublado", format: "2D", time: "14:30"),
        CinemaSession(cinema: "Cinema B", date: Date(), language: "Legendado", format: "2D", time: "15:30"),
        CinemaSession(cinema: "Cinema B", date: Date(), language: "Dublado", format: "2D", time: "16:30"),
        CinemaSession(cinema: "Cinema B", date: Date(), language: "Legendado", format: "2D", time: "17:30"),
        CinemaSession(cinema: "Cinema C", date: Date(), language: "Dublado", format: "2D", time: "18:30"),
        CinemaSession(cinema: "Cinema C", date: Date(), language: "Dublado", format: "2D", time: "19:30"),
        CinemaSession(cinema: "Cinema C", date: Date(), language: "Dublado", format: "2D", time: "20:30"),
        CinemaSession(cinema: "Cinema C", date: Date(), language: "Dublado", format: "2D", time: "21:30"),
        CinemaSession(cinema: "Cinema do Sergio", date: Date(), language: "Dublado", format: "2D", time: "21:30")
    ]

    var cinemaOptions: [String] {
        let uniqueCinemas = Array(Set(sessions.map { $0.cinema }))
        return uniqueCinemas.sorted()
    }
    
    var filteredSessions: [[CinemaSession]] {
        let filtered = sessions.filter { session in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let selectedDateString = dateFormatter.string(from: selectedDate)
            let sessionDateString = dateFormatter.string(from: session.date)
            
            if let selectedCinema = selectedCinema {
                return selectedDateString == sessionDateString && selectedCinema == session.cinema
            } else {
                return selectedDateString == sessionDateString
            }
        }
        
        let groupedSessions = Dictionary(grouping: filtered) { session in
            "\(session.cinema)-\(session.language)-\(session.format)"
        }
        
        return groupedSessions.values.sorted { $0.first!.cinema < $1.first!.cinema }
    }

    var body: some View {
//        NavigationView {
            List {
                Section(header: Text("Escolha sua sessão")) {
                    DatePicker(
                        "Data",
                        selection: $selectedDate,
                        displayedComponents: .date
                    )
                    Picker(
                        "Cinema",
                        selection: $selectedCinema
                    ) {
                        Text("Todos").tag(nil as String?)
                        ForEach(cinemaOptions, id: \.self) { cinema in
                            Text(cinema).tag(cinema as String?)
                        }
                    }
                }

                ForEach(filteredSessions, id: \.self) { sessions in
                    Section(header: selectedCinema == nil ? Text("\(sessions.first!.cinema) - \(sessions.first!.language) - \(sessions.first!.format)") : Text(" \(sessions.first!.language) - \(sessions.first!.format)") ) {
                        ForEach(sessions) { session in
                            NavigationLink(destination: IngressoView(movie: movie)) {
                                Text(session.time)
                            }
                        }
                    }
                }


            }
            .navigationTitle(movie.nome)
//        }
    }
}

struct MovieSessionsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSessionsView(movie: Movie(nome: "Guardiões da Galaxia", tipo: "Aventura", duracao: "1h 43m", ano: "2023", sinopse: "Em “Guardiões da Galáxia Vol. 3” nosso amado grupo de desajustados está se estabelecendo em Knowhere. Mas não demora muito até que suas vidas sejam reviradas pelo passado turbulento de Rocket. Peter Quill, ainda se recuperando da perda de Gamora, deve reunir sua equipe em uma missão perigosa para salvar a vida de Rocket - uma missão que, se não for concluída com sucesso, pode levar ao fim dos Guardiões como os conhecemos.", critica: "81", publico: "91", classificacao: "14", FotoFundo: "guardians", Fotoinicio: "guardiansInicio", elenco: "Chris Pratt, Zoe Saldana, Dave Bautista, Vin Diesel (oz), Bradley Cooper (Voz), Karen Gillan, Pom Klementieff, Elizabeth Debicki", diretor: "James Gunn", distribuidora: "Disney", País: "Estados Unidos"))
    }
}

