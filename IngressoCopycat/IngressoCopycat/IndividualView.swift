//
//  IndividualView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 01/06/23.
//

import SwiftUI

struct IndividualView: View {
    var body: some View {
        VStack{
            Image("Ingresso")
            Image("wallet")
                .resizable()
                .frame(width: 200, height: 65)
                .padding(.top, 32)
                .padding(.bottom, 32)
        }
    }
}

struct IndividualView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualView()
            .preferredColorScheme(.dark)
    }
}
