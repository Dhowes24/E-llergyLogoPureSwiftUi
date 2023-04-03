//
//  Homepage.swift
//  E-llergyLogoPureSwiftUi
//
//  Created by Derek Howes on 4/3/23.
//

import SwiftUI

struct Homepage: View {
    var body: some View {
        VStack{
            LogoView()
                .scale(0.5)
            Spacer()
        }
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
