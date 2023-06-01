//
//  PagamentoView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 31/05/23.
//

import SwiftUI

struct PagamentoView: View {
    
    @State var List1Show = false
    @State var List2Show = false
    @State var List3Show = false
    @State var List4Show = false
    
    
    var body: some View {
        VStack{
            List{ Section(header: Text("Formas de Pagamento")) {
                
                VStack {
                    Button{
                        withAnimation(.easeIn){
                            List1Show.toggle()
                            
                        }
                    }label: {
                        HStack{
                            Image(systemName: "creditcard.fill")
                                .resizable()
                                .frame(width: 31, height: 22)
                                .foregroundColor(Color.white)
                                .padding(.trailing, 16)
                            Text("Cartao de crédito")
                                .font(Font.custom("SF Pro Text", size: 17))
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .rotationEffect(.degrees(List1Show ? 90 : 0))
                        }
                    }
                }
                
                Section{
                    if List1Show {
                        Cards1View()
                    }
                }
                
                VStack {
                    Button{
                        withAnimation(.easeIn){
                            List2Show.toggle()
                            
                        }
                    }label: {
                        HStack{
                            Image(systemName: "creditcard.fill")
                                .resizable()
                                .frame(width: 31, height: 22)
                                .foregroundColor(Color.white)
                                .padding(.trailing, 16)
                            Text("Cartao de débito")
                                .foregroundColor(.white)
                                .font(Font.custom("SF Pro Text", size: 17))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .rotationEffect(.degrees(List2Show ? 90 : 0))
                        }
                    }
                }
                
                Section{
                    if List2Show {
                        Cards1View()
                    }
                }
                
                VStack {
                    Button{
                        withAnimation(.easeIn){
                            List3Show.toggle()
                            
                        }
                    }label: {
                        HStack{
                            Image("paypal")
                                .resizable()
                                .frame(width: 31, height: 31)
                                .padding(.trailing, 16)
                            Text("PayPal")
                                .font(Font.custom("SF Pro Text", size: 17))
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .rotationEffect(.degrees(List3Show ? 90 : 0))
                        }
                    }
                }
                
                Section{
                    if List3Show {
                        Cards3View()
                    }
                }
                
                VStack {
                    Button{
                        withAnimation(.easeIn){
                            List4Show.toggle()
                            
                        }
                    }label: {
                        HStack{
                            Image("apple")
                                .resizable()
                                .frame(width: 31, height: 22)
                                .padding(.trailing, 16)
                            Text("ApplePay")
                                .font(Font.custom("SF Pro Text", size: 17))
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .rotationEffect(.degrees(List4Show ? 90 : 0))
                        }
                    }
                }
                
                Section{
                    if List4Show {
                        Cards4View()
                    }
                }
            }
            }// fecha a lista
            .frame(height: 580)
            
            NavigationLink{
                IngressosView()
            }label: {
                Text ("Pagar")
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
        }
        .navigationTitle("Pagamento")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Cards1View: View{
    @State private var selected = false
    @State private var selected2 = false
    @State private var selected3 = false
    
    var body: some View{
        VStack{
                Button{
                    selected.toggle()
                }label: {
                    HStack{
                        Image("card")
                            .resizable()
                            .frame(width: 41, height: 42)
                            .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
                            .padding(.trailing, 16)
                            .padding(.leading, 16)
                        VStack(alignment: .leading){
                            Text("Master Card")
                                .foregroundColor(.white)
                                .font(Font.custom("SF Pro Text", size: 17))
                            Text("**** 5678")
                                .foregroundColor(.white)
                                .font(Font.custom("SF Pro Text", size: 15))
                        }
                        Spacer()
                        if selected{
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                                .padding(.trailing, 16)
                        }
                    }
                }
                
                .frame(width: 350, height: 70)
                .background(Color(red: 51/255, green: 51/255, blue: 51/255))
                .cornerRadius(10)
                
                
//                Button{
//                    selected2.toggle()
//                }label: {
                    HStack{
                        Image("card")
                            .resizable()
                            .frame(width: 41, height: 42)
                            .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
                            .padding(.trailing, 16)
                            .padding(.leading, 16)
                        VStack(alignment: .leading){
                            Text("Master Card")
                                .foregroundColor(.white)
                                .font(Font.custom("SF Pro Text", size: 17))
                            Text("**** 6754")
                                .foregroundColor(.white)
                                .font(Font.custom("SF Pro Text", size: 15))
                        }
                        Spacer()
                        if selected2{
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                                .padding(.trailing, 16)
                        }
                    }
//                }
                .frame(width: 350, height: 70)
                .background(Color(red: 51/255, green: 51/255, blue: 51/255))
                .cornerRadius(10)
            
//                Button{
//                    selected3.toggle()
//                }label: {
                    HStack{
                        Image("card")
                            .resizable()
                            .frame(width: 41, height: 42)
                            .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
                            .padding(.trailing, 16)
                            .padding(.leading, 16)
                        VStack(alignment: .leading){
                            Text("Master Card")
                                .foregroundColor(.white)
                                .font(Font.custom("SF Pro Text", size: 17))
                            Text("**** 4259")
                                .foregroundColor(.white)
                                .font(Font.custom("SF Pro Text", size: 15))
                        }
                        Spacer()
                        if selected3{
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                                .padding(.trailing, 16)
                            
                        }
                    }
//                }
                .frame(width: 350, height: 70)
                .background(Color(red: 51/255, green: 51/255, blue: 51/255))
                .cornerRadius(10)
                
                
        }// VStack
    }
}
            
struct Cards2View: View{
    var body: some View{
        VStack{
            Text("AOBA")
            Image("guardians")
            
        }
    }
}

struct Cards3View: View{
    var body: some View{
        ZStack{
            Rectangle()
                .foregroundColor(.black)
                .frame(height: 400)
            Text("PayPal")
                
        }
    }
}

struct Cards4View: View{
    var body: some View{
        ZStack{
            Rectangle()
                .foregroundColor(.black)
                .frame(height: 400)
            Text("ApplePay")
        }
    }
}

struct PagamentoView_Previews: PreviewProvider {
    static var previews: some View {
        Cards1View()
            .preferredColorScheme(.dark)
        PagamentoView()
            .preferredColorScheme(.dark)
    }
}
