//
//  ChatView.swift
//  playingWithTahada
//
//  Created by Hasna Ahmed on 13/05/1445 AH.
//

import SwiftUI

struct ChatRow: View {
    
    let chat : Chat
    
    var body: some View {
        HStack(spacing: 20){

            
            ZStack{
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text(chat.messages.last?.date.descriptiveString() ?? "")
                        
                        
                        Spacer()
                        Text(chat.person.name)
                            .bold()
                       
                    }
                    
                    HStack{
                        Circle()
                            .foregroundColor(chat.hasUnreadMessage ? .blue : .clear)
                            .frame(width: 18 , height: 18 )
//                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        Text(chat.messages.last?.text ?? "")
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .frame(height: 50 , alignment: .trailing)
                            .frame(maxWidth: .infinity, alignment: .trailing)
//                            .padding(.trailing)
                    }
                }
                
            }
            
            Image(chat.person.imgString)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
        }.frame(height: 80)
    }
}

#Preview {
    ChatRow(chat: Chat.sampleChat[0])
}

