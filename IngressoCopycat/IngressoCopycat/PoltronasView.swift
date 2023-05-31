//
//  PoltronasView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 31/05/23.
//

import SwiftUI

struct PoltronaView: View {
    let rows: Int
    let columns: Int
    @State private var elementColor: Color = .red
    @State private var element: Int = 0
    @State private var currentScale: CGFloat = 1
    @State private var elementFix: Int?
    @State private var selectedRow: Int?
    @State private var selectedColumn: Int?
    @State private var selectedCell: (row: Int, column: Int)?
    @State private var selectedCells: Set<Cell> = []
    @State private var selectedPoltrona = [""]
    
    let letras = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    var body: some View {
        
        ZStack{
//            Rectangle()
//                .frame(width: 360, height: 600)
//                .ignoresSafeArea()
//                .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
//                .cornerRadius(12)
            VStack{
                VStack {
                    Spacer()
                    ForEach(0..<rows, id: \.self) { row in
                        HStack {
                            Text("      \(letras[row])")
                                .foregroundColor(.white)
                                .padding(.trailing, 10)
                                .font(Font.custom("SF Pro Text", size: 14))
                            
                            ForEach(0..<columns, id: \.self) { column in
                                
                                Circle()
                                    .foregroundColor(circleColor(for: row, column))
                                    .frame(width: 35, height: 35)
                                
                                
                                    .onTapGesture {
                                        selectedRow = row
                                        selectedColumn = column
                                        selectedCell = (row, column)
                                        let cell = Cell(row: row, column: column)
                                        if selectedCells.contains(cell) {
                                            selectedCells.remove(cell)
                                            element = selectedCells.count
                                        } else {
                                            selectedCells.insert(cell)
                                            element = selectedCells.count
                                            selectedPoltrona.append("\(letras[row])\(column)")
                                        }
                                    }
                                    .overlay(
                                        Text("\(letras[row])\(column)")
                                            .foregroundColor(textColor(for: row, column)))
                            }
                            Text("\(letras[row])      ")
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                                .font(Font.custom("SF Pro Text", size: 14))
                        }
                        
                    } // Matriz de poltronas
                    ZStack{
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(width: 300, height: 17)
                            .padding(.top, 20)
                        Text("TELA")
                            .foregroundColor(.white)
                            .padding(.top, 20)
                        
                    }
                    Spacer()
                   
                }
    
                .background(Color(red: 51/255, green: 51/255, blue: 51/255))
                .cornerRadius(12)
                .frame(width: 700,height: 450)
                
                    
                    Text("  Poltronas Selecionadas:")
                        .foregroundColor(.white)
                        .font(Font.custom("SF Pro Text Semibold", size: 17))
                        .padding(.trailing, 150)
                        .padding(.top, 20)
                    
                    
                    HStack{
                        selectedCellsInfoView()
                    }
                    Spacer()
                
            }
            
        }

    }
    
    private func circleColor(for row: Int, _ column: Int) -> Color {
        let cell = Cell(row: row, column: column)
        return selectedCells.contains(cell) ? .white : Color(red: 238/255, green: 123/255, blue: 48/255)
    }
    private func textColor(for row: Int, _ column: Int) -> Color {
        let cell = Cell(row: row, column: column)
        return selectedCells.contains(cell) ? Color(red: 238/255, green: 123/255, blue: 48/255) : .white
    }
    private func selectedCellsInfoView() -> some View {
//        ScrollView(.horizontal){
            HStack(alignment: .center) {
                
                ForEach(selectedCells.sorted(), id: \.self) { cell in
                    Circle()
                        .foregroundColor(Color(red: 238/255, green: 123/255, blue: 48/255))
                        .frame(width: 35)
                        .overlay(
                            Text("\(letras[cell.row])\(cell.column)")
                                .foregroundColor(.white)
                        )}
            }
//        }
            
        .padding()
        .cornerRadius(10)
    }// Fecha a View
        
    
}// fecha Struct

struct Cell: Hashable, Comparable {
    let row: Int
    let column: Int
    static func < (lhs: Cell, rhs: Cell) -> Bool {
        if lhs.row == rhs.row {
            return lhs.column < rhs.column
        } else {
            return lhs.row < rhs.row
        }
    }
}


struct MatrixView: View {
    var body: some View {
        PoltronaView(rows: 9, columns: 5)
            .preferredColorScheme(.dark)
    }
}

struct PoltronaView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixView()
    }
}
