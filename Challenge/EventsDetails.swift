//
//  EventDetaies2.swift
//  Event
//
//  Created by shaden  on 13/05/1445 AH.
//

import SwiftUI

struct EventsDetails: View {
    var body: some View {
      //  NavigationView{
            
            ZStack{
                
                //              Text("")
                //                  .navigationBarTitle("هاكثون DataHack" , displayMode: .inline)
                Text("هاكثون DataHack")
                    .font(.title2)
                    .foregroundStyle(Color("darkBlue"))
                    .offset(y:-350)
                
                
                
                Image("dataHack")
                    .resizable()
                    .frame(width:400,height: 250)
                    .padding(.bottom,400)
                
                
                HStack{
                    
                    Text("🟢 متاح")
                        .font(.title3)
                        .padding()
                        .foregroundStyle(Color("darkBlue"))
                    Spacer()
                    
                    Text("📍الرياض ")
                        .font(.title3)
                        .foregroundStyle(Color("darkBlue"))
                    
                    
                }.padding(.bottom,90)
                    .padding(.trailing,20)
                    .padding(.leading,30)
                
                VStack{
                    Text("🗓️ ١٦ نوفمبر ٢٠٢٣")
                        .font(.title3)
                        .padding(.leading,170)
                        .padding(.bottom,20)
                        .foregroundStyle(Color("darkBlue"))
                    
                    Text("التفاصيل : ")
                        .font(.title)
                        .padding(.leading,200)
                        .foregroundStyle(Color("darkBlue"))
                    
                    Text("للمهتمين بتحليل بيانات الذكاء الاصطناعي بهدف هاكثون DataHack الى تطوير حلول مبنية على تطوير تحليل البيانات والنماذج ")
                        .multilineTextAlignment(.trailing)
                        .frame(width: 320, alignment: .trailing)
                        .lineLimit(3)
                        .foregroundStyle(Color("darkBlue"))
                    
                }
                .padding(.leading,45)
                .padding(.top,120)
                
                NavigationLink(destination: CreateAccount()) {
                    
                    ZStack{
                        Rectangle()
                            .frame(width: 278, height: 45)
                            .cornerRadius(23)
                            .foregroundStyle(Color("midBlue"))
                        
                        Text("تسجيل")
                            .font(.title2)
                        
                    }.padding(.top,500)
                    
                }.foregroundColor(.white)
                
                
                
            }.background(Image("background1"))
        }
    }

#Preview {
    EventsDetails()
      //  .environment(\.layoutDirection, .rightToLeft)
}

