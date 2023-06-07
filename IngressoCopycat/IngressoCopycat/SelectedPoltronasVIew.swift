//
//  SelectedPoltronasVIew.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 31/05/23.
//

import SwiftUI

struct SelectedPoltronasView: View {
    
    var movie: Movie
    @State private var isAble: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            PoltronaView(rows: 8, columns: 5, isAble: $isAble)
                .frame(height: 580)
            Spacer()
            NavigationLink{
                Resumo_View(movie: movie)
            }label:{
                    Text ("Continuar")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 120)
                        .background(isAble ? Color.gray : Color(red: 238/255, green: 123/255, blue: 48/255))
                        .cornerRadius (10)
                        .shadow(radius: 10)

            }
            .disabled(isAble)
            .onAppear{
                isAble = true
            }

            Spacer()
        }
        
        
        .navigationTitle("Poltronas")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}

struct SelectedPoltronasView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedPoltronasView(movie:  Movie(nome: "Guardiões da Galaxia", tipo: "Aventura", duracao: "1h 43m", ano: "2023", sinopse: "Em “Guardiões da Galáxia Vol. 3” nosso amado grupo de desajustados está se estabelecendo em Knowhere. Mas não demora muito até que suas vidas sejam reviradas pelo passado turbulento de Rocket. Peter Quill, ainda se recuperando da perda de Gamora, deve reunir sua equipe em uma missão perigosa para salvar a vida de Rocket - uma missão que, se não for concluída com sucesso, pode levar ao fim dos Guardiões como os conhecemos.", critica: "81", publico: "91", classificacao: "14", FotoFundo: "guardians", Fotoinicio: "guardiansInicio", elenco: "Chris Pratt, Zoe Saldana, Dave Bautista, Vin Diesel (oz), Bradley Cooper (Voz), Karen Gillan, Pom Klementieff, Elizabeth Debicki", diretor: "James Gunn", distribuidora: "Disney", País: "Estados Unidos"))
            .preferredColorScheme(.dark)
    }
}
