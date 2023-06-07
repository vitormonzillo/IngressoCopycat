//
//  IndividualView.swift
//  IngressoCopycat
//
//  Created by Rafael Santos Seixas Figueiredo on 01/06/23.
//

import SwiftUI
import PassKit

struct IndividualView: View {
    var pkpassURL = URL(string: "https://guu-batista.github.io/IngressoCopycat/IngressoPass.pkpass")

    var body: some View {
        VStack {
            Image("Ingresso")
            
            AddPassToWalletButton{
                downloadPKPASS()
                print("baixou!")
            }
            .frame(height: 22)
            .padding(8)
            .cornerRadius(50)
            .padding(.horizontal, 8)
            //.background(Color.blue)
        }
    }

    func downloadPKPASS() {
        guard let pkpassURL = pkpassURL else {
            return
        }

        UIApplication.shared.open(pkpassURL)
    }
}

struct IndividualView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualView(pkpassURL: nil)
            .preferredColorScheme(.dark)
    }
}
