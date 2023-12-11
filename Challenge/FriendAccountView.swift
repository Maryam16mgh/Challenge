//
//  FriendAccountView.swift
//  playingWithTahada
//
//  Created by Hasna Ahmed on 20/05/1445 AH.
//

import SwiftUI
struct FriendAccountView: View {
    // Sample user data
    @State var friendName = "سارا احمد "
    @State var friendImg = "user"
    @State var phoneNumber = ""
    @State var interests = ""
//    @State private var phoneNumber = ""
//    @State private var interests = ""

    // Model data
    var event:Array<Even1> = [
Even1(EventName: "DataHacK هاكاثون ", Picter: "DataHack", City: "📍الرياض")]

    var body: some View {
        ZStack {
            
            // Overlay with color
            
            Color("lightBlue")
            .edgesIgnoringSafeArea(.all)

            // Background
            Image("MainBackground")
                .resizable()
                .frame(width: 390 , height: 584)
                .aspectRatio(contentMode: .fill)
                .padding(.bottom, -120.0)
                .edgesIgnoringSafeArea(.all)
            
            Image(friendImg)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(Color.gray)
                .frame(width: 100, height: 130)
                .clipShape(Circle())
                .padding(.top, 20)
                .offset(y:-250)

            VStack {
                
//                Image(systemName: "chevron.backward")
//                    .padding(.leading, -180.0)
//                    .padding(.top, -80.0)
//

                // Profile Picture
//                Image(friendImg)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .foregroundColor(Color.gray)
//                    .frame(width: 100, height: 130)
//                    .clipShape(Circle())
//                    .padding(.top, 20)

                // User Name
                Text(friendName)
                    .foregroundStyle(Color("darkBlue"))
                
                
                HStack{
                    
//                    NavigationLink(destination: CommunityView(), label: {
//                        Image(systemName: "message.fill")
//                            .foregroundColor(Color("Color2"))
//                    })
                    
                    Button(action: {
//                        CommunityView()
                        // Action to perform on button tap
                    }) {
       Image(systemName: "message.fill")
      .foregroundColor(Color("midBlue"))
                    }
                    
                  
                   
                    
                    Text("|")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("midBlue"))
                    
                    Image(systemName: "exclamationmark.circle.fill")
                        .foregroundColor(Color("midBlue"))
                        
                }

                    Divider()
                    .frame(minHeight:5)
                
                
                 Text("إهتماماتي")
                    .foregroundStyle(Color("darkBlue"))
                    .font(.title2)
                    .frame(width: 329 , height: 45 , alignment: .trailing)
                
                Text("شاركت في مجالات متعددة وحاصلة على جوائز ")
                    .multilineTextAlignment(.trailing)
                    .foregroundStyle(Color("midBlue"))
                    .frame(width: 329 , height: 45 , alignment: .trailing)
                
                Text("مشاركاتي")
                    .frame(width: 329 , height: 45 , alignment: .trailing)
                    .foregroundStyle(Color("darkBlue"))
                    .font(.title2)
                   .multilineTextAlignment(.trailing)
                   .padding()
                 //  .padding(.trailing, -300.0)
                   
                
                    
                ForEach(event, id: \.id) { fund in

                    ZStack{

                      //  Image(fund.Picter)
                        Image("dataHack")
                            .resizable()
                            .frame(width: 350, height: 200)
                            .cornerRadius(23)
                            .opacity(0.7)


                        RoundedRectangle(cornerRadius: 23)
                            .fill(Color.white)
                            .frame(width: 350, height: 40)
                            .padding([.top],160)
                            .opacity(0.6)


                        Text(fund.EventName)
                            .padding(.trailing, 150)
                            .padding(.top,160)



                        Text(fund.City)
                            .padding(.top,160)
                            .padding(.leading, 220)

                    }
                    .padding()

                }
            }.offset(y:60)
        }
    }
    
    // Create a preview for testing in Xcode
    struct FriendAccountView_Previews: PreviewProvider {
        static var previews: some View {
            FriendAccountView()
        }
    }

    
}

#Preview {
    FriendAccountView()
}

