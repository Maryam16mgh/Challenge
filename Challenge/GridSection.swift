//
//  GridText.swift
//  Challenge
//
//  Created by Maryam Mohammad on 13/05/1445 AH.
//

import SwiftUI

struct GridItemView: View {
    var imageName: String
    var title: String

    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .frame(width: 145, height: 145)
                .opacity(0.7)
                .cornerRadius(8)

            Rectangle()
                .frame(width: 145, height: 30)
                .cornerRadius(8)
                .opacity(0.7)
                .foregroundColor(.white)
                .padding(.top, 114.0)

            Text(title)
                .font(.title2)
                .foregroundStyle(Color("darkBlue"))
                .padding(.top, 114.0)
        }
    }
}

struct GridSection: View {
    var gridData = [
        ("boardGame", "ألعاب شعبية"),
        ("techGame", "هاكثونات تقنية"),
        ("sportGame", "ألعاب رياضية"),
        ("videoGame", "ألعاب فيديو")
    ]

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                ForEach(gridData, id: \.0) { imageName, title in
                    NavigationLink(destination: EventSections()){
                    GridItemView(imageName: imageName, title: title)
                    // .padding()
                }
            } .offset(y:-95)
        }
    }
}

#Preview {
    GridSection()
}
