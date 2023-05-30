//
//  FilterView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 30/05/23.
//

import SwiftUI

struct FilterSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedItems = Set<Int>()
    var body: some View {
        GeometryReader { geometry in
            NavigationView{
                VStack {
                    HStack{
                        Spacer()
                        Text("Filtros")
                            .font(Font.custom("SF Pro Text Semibold", size: 20))
                            .padding(.leading, 20)
                        Spacer()
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
                                .font(Font.custom("SF Text Semibold", size: 20))
                        }
                        
                    }
                    
                    
                    
                    List(0..<5, id: \.self) { index in
                        Button(action: {
                            if self.selectedItems.contains(index) {
                                self.selectedItems.remove(index)
                            } else {
                                self.selectedItems.insert(index)
                            }
                        }) {
                            HStack {
                                Text("Item \(index)")
                                Spacer()
                                if self.selectedItems.contains(index) {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                    
                }
                
                .padding()
            }
        }
        
    }
}

struct click: View{
    @State var check = false
    var body: some View{
        if check == false{
            Image(systemName: "checkmark")
                .hidden()
        }else{
            Image(systemName: "checkmark")
        }
    }
}

struct BagSelectionView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var check = false
    @State private var selectedItems = Set<Int>()
    var body: some View {
        
        // Add more filter buttons as needed
        GeometryReader { geometry in
            NavigationView{
                VStack {
                    HStack{
                        Spacer()
                        Text("Sacola")
                            .font(Font.custom("SF Pro Text Semibold", size: 20))
                            .padding(.leading, 20)
                        Spacer()
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
                                .font(Font.custom("SF Text Semibold", size: 20))
                        }
                        
                    }
                    Spacer()
                    
                    
//                    List(0..<5, id: \.self) { index in
//                        Button(action: {
//                            if self.selectedItems.contains(index) {
//                                self.selectedItems.remove(index)
//                            } else {
//                                self.selectedItems.insert(index)
//                            }
//                        }) {
//                            HStack {
//                                Text("Item \(index)")
//                                Spacer()
//                                if self.selectedItems.contains(index) {
//                                    Image(systemName: "checkmark")
//                                }
//                            }
//                        }
//                    }
                    
                }
                
                
                .padding()
            }
        }
    }
}



struct FiltroView_Previews: PreviewProvider {
    static var previews: some View {
        FilterSelectionView()
        BagSelectionView()
    }
}

