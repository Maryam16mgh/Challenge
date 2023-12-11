//
//  SliderImages.swift
//  Challenge
//
//  Created by Maryam Mohammad on 13/05/1445 AH.
//

import SwiftUI

struct SliderImages: View{
     let timer = Timer.publish(every: 1 , on: .main, in: .common).autoconnect()
    
    @State var selection = 0
    var imagesTrend = ["gaming" , "gaya" , "AI"]
    
    var body: some View{
        VStack{
        TabView{
            ForEach(0..<3){ i in Image("\(imagesTrend[i])")
                    .resizable()
                    .frame(width: 318 , height: 146)
                    .cornerRadius(23)
                    .opacity(0.8)
            }
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .onReceive(timer, perform: { _ in
                withAnimation{
                    selection = selection < 3 ? selection + 1 : 0
                }
            })
        }.offset(y:-60)
        // .padding(.top,-90)
}
}

#Preview {
    SliderImages()
}

