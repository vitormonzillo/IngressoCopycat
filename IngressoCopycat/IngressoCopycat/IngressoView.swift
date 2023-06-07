//
//  IngressoView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 31/05/23.
//

import Foundation
import SwiftUI
class Item: Equatable, Hashable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.name == rhs.name
    }
    init(name: String, count:Int, valor: String) {
        self.name = name
        self.count = count
        self.valor = valor
    }
    var valor = ""
    var name = ""
    var count = 0
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name.hashValue)
    }
}
class Tickets:ObservableObject {
    @Published
    var types = [Item(name: "Inteira",count: 0, valor:"R$ 32,00"),
                        Item(name: "Meia", count:0, valor:"R$ 16,00"),
                        Item(name: "Meia Itaú", count:0, valor:"R$ 16,00"),
                 Item(name: "Meia Bank", count:0, valor:"R$ 16,00")]
    
    func AllValuesAreZero() -> Bool {
        for type in types {
            if type.count != 0 {
                return false
            }
        }
        return true
    }
}
struct IngressoView: View{
    let White_color = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    let TextView = "Feriados e pontos facultativos serão praticados\nos preços de final de semana. Promoções não são\ncumulativas com outras promoções ou benefícios de\nmeia-entrada."
    @ObservedObject var tickets = Tickets()
//    @State var isAble = false
    var movie: Movie
    
    
    var body: some View{
            // Stack Principal
            VStack{
                // Stack Com os elementos da tela
//                ZStack{
                    VStack (alignment: .leading){
                        List{
                            HStack(alignment: .top){
                                Image(movie.FotoFundo)
                                    .resizable()
                                    .frame(width:100, height:140)
                                    .cornerRadius(10)
//                                    .padding(35)
                                
                                    
                    
                                
                                VStack(alignment: .leading){
                                    Text(movie.nome)
                                        .font(.system(size: 21, weight: .bold, design: .default))
                                        .foregroundColor(Color(.white))
                                        .frame(maxWidth: .infinity, alignment:.leading)
                                    Text("Kinoplex Dom Pedro")
                                        .font(.system(size: 18, weight: .regular, design: .default))
                                        .foregroundColor(Color(.white))
                                        .frame(maxWidth: .infinity, alignment:.leading)
                                    Text("2D Dublado")
                                        .font(.system(size: 16, weight: .regular, design: .default))
                                        .foregroundColor(Color(.white))
                                        .frame(maxWidth: .infinity, alignment:.leading)
                                    Text("Sexta-Feira, 05/04")
                                        .font(.system(size: 16, weight: .regular, design: .default))
                                        .foregroundColor(Color(.white))
                                        .frame(maxWidth: .infinity, alignment:.leading)
                                    Text("16:40")
                                        .font(.system(size: 16, weight: .regular, design: .default))
                                        .foregroundColor(Color(.white))
                                        .frame(maxWidth: .infinity, alignment:.leading)
                                }
                                .padding(.leading, 20)
                                
        
                                
                            }
                            .padding(.leading, 32)
//                            .padding(.top,25)
                            .frame(width: 400, height: 110)
                            .padding()
                            .cornerRadius(13)
//                            .position(x:160, y:70)
                            //  Lista com nome, valor, e selecao de quantidade
                            ForEach(0..<tickets.types.count, id: \.self) { index in
                                Stepper(value: $tickets.types[index].count, in: 0...99) {
                                    HStack(alignment: .top){
                                        VStack(alignment: .leading){
                                            Text(tickets.types[index].name)
                                                .font(.system(size: 18, weight: .bold, design: .default))
                                            Text(tickets.types[index].valor)
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular, design: .default))
                                        }
                                        Spacer()
                                        VStack(alignment: .leading){
                                            Text("Quantidade:")
                                              .foregroundColor(.gray)
                                              .font(.system(size: 16, weight: .regular, design: .default))
                                            Text(" \(tickets.types[index].count)")
                                            .font(.system(size: 16, weight: .bold, design: .default))
                                        }
                                    }
                                }
                            }
                        } // Fecha Lista
                        .frame(width: 410, height: 450)
                        .padding()
//                        .position(x:197, y:325)
                    }// fecha VStack
//                }// fecha ZStack
                VStack(alignment: .leading){
                    Text("Observações:")
                        .font(.system(size: 17, weight: .bold, design: .default))
                        .foregroundColor(Color(.white))
//                        .position(x:70, y:500)
                    Text(TextView)
                        .font(.system(size: 13, weight: .bold, design: .default))
                        .foregroundColor(Color(.white))
                    //    .position(x:190, y:165)
                    
                }
                .padding(.top,6)
                .padding(.bottom,16)
                //                .position(x:190, y:540)
                // Botao continuar
                
                NavigationLink {
                    SelectedPoltronasView(movie: movie)
                }label: {
                    Text ("Continuar")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 120)
                        .background(tickets.AllValuesAreZero() ? Color.gray : Color(red: 238/255, green: 123/255, blue: 48/255))
                        .cornerRadius (10)
                        .shadow(radius: 10)
                    //                        .position(x:200, y:650)
                }
                .disabled(tickets.AllValuesAreZero())
                .buttonStyle(.plain)
                Spacer()
                
                
                
            }// Fecha ZStack Principal
            .navigationTitle("Ingressos")
            .navigationBarTitleDisplayMode(.inline)
        
    }
    
    
    
}
struct IngressoView_Previews: PreviewProvider {
    static var previews: some View {
        IngressoView(movie: Movie(nome: "Guardiões da Galaxia", tipo: "Aventura", duracao: "1h 43m", ano: "2023", sinopse: "Em “Guardiões da Galáxia Vol. 3” nosso amado grupo de desajustados está se estabelecendo em Knowhere. Mas não demora muito até que suas vidas sejam reviradas pelo passado turbulento de Rocket. Peter Quill, ainda se recuperando da perda de Gamora, deve reunir sua equipe em uma missão perigosa para salvar a vida de Rocket - uma missão que, se não for concluída com sucesso, pode levar ao fim dos Guardiões como os conhecemos.", critica: "81", publico: "91", classificacao: "14", FotoFundo: "guardians", Fotoinicio: "guardiansInicio", elenco: "Chris Pratt, Zoe Saldana, Dave Bautista, Vin Diesel (oz), Bradley Cooper (Voz), Karen Gillan, Pom Klementieff, Elizabeth Debicki", diretor: "James Gunn", distribuidora: "Disney", País: "Estados Unidos"))
    }
}
