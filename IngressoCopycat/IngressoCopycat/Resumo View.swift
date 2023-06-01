//
//  Resumo View.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 31/05/23.
//

import SwiftUI

struct Resumo_View: View {
    
    var movie: Movie
    
    
    var body: some View {
        VStack{
            List{
                HStack(alignment: .top){
                    Image(movie.FotoFundo)
                        .resizable()
                        .frame(width:100, height:140)
                        .cornerRadius(10)
                    
                        VStack(alignment: .leading){
                            Text(movie.nome)
                                .font(.system(size: 21, weight: .bold, design: .default))
                                .foregroundColor(Color(.white))
//                                .frame(maxWidth: .infinity, alignment:.leading)
                            Text("Kinoplex Dom Pedro")
                                .font(.system(size: 18, weight: .regular, design: .default))
                                .foregroundColor(Color(.white))
//                                .frame(maxWidth: .infinity, alignment:.leading)
                            Text("2D Dublado")
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .foregroundColor(Color(.white))
//                                .frame(maxWidth: .infinity, alignment:.leading)
                            Text("Sexta-Feira, 05/04")
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .foregroundColor(Color(.white))
//                                .frame(maxWidth: .infinity, alignment:.leading)
                            Text("16:40")
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .foregroundColor(Color(.white))
//                                .frame(maxWidth: .infinity, alignment:.leading)
                        }
                        .padding(.leading, 16)
                        
                }
                HStack{
                    Text("Inteira")
                    Spacer()
                    Text("1x R$32,00")
                }
                HStack{
                    Text("Poltronas")
                    Spacer()
                    Text("F2")
                }
                Section{
                    HStack(alignment: .center){
                        Image(systemName: "dollarsign.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
                        
                        
                        VStack(alignment: .leading){
                            Spacer()
                            Text("Subtotal")
                                .font(.system(size: 21, weight: .bold, design: .default))
                                .foregroundColor(Color(.white))
                            //                            .frame(maxWidth: .infinity, alignment:.leading)
                            Text("R$92,00")
                                .font(.system(size: 18, weight: .regular, design: .default))
                                .foregroundColor(Color(.white))
                            //                            .frame(maxWidth: .infinity, alignment:.leading)
                            Spacer()
                        }
                        .padding(.leading, 16)
                        
                    }
                }
            }
            .frame(height: 590)
            NavigationLink{
                PagamentoView()
            }label: {
                Text ("Continuar")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 120)
                    .background(Color(red: 238/255, green: 123/255, blue: 48/255)
                    )
                    .cornerRadius (10)
                    .shadow(radius: 10)

            }
            
            Spacer()
            
            
        }
        .navigationTitle("Resumo")
        .navigationBarTitleDisplayMode(.inline)
    }
}
struct Resumo_View_Previews: PreviewProvider {
    static var previews: some View {
        Resumo_View(movie:  Movie(nome: "Guardiões da Galaxia", tipo: "Aventura", duracao: "1h 43m", ano: "2023", sinopse: "Em “Guardiões da Galáxia Vol. 3” nosso amado grupo de desajustados está se estabelecendo em Knowhere. Mas não demora muito até que suas vidas sejam reviradas pelo passado turbulento de Rocket. Peter Quill, ainda se recuperando da perda de Gamora, deve reunir sua equipe em uma missão perigosa para salvar a vida de Rocket - uma missão que, se não for concluída com sucesso, pode levar ao fim dos Guardiões como os conhecemos.", critica: "81", publico: "91", classificacao: "14", FotoFundo: "guardians", Fotoinicio: "guardiansInicio", elenco: "Chris Pratt, Zoe Saldana, Dave Bautista, Vin Diesel (oz), Bradley Cooper (Voz), Karen Gillan, Pom Klementieff, Elizabeth Debicki", diretor: "James Gunn", distribuidora: "Disney", País: "Estados Unidos"))
    }
}
