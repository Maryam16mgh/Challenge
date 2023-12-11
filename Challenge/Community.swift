//
//  ContentView.swift
//  playingWithTahada
//
//  Created by Hasna Ahmed on 09/05/1445 AH.
//
import SwiftUI

struct Community: View {
    
    @StateObject var viewModel = ChatsViewModel()
    
    @State private var query = "" // in the video was like this // @State private var query = ""
    
    var body : some View{
        
        NavigationView{
            List{
                ForEach(viewModel.getSortFilteredChat(query: query)){ chat in
                    
                    ZStack{
                        ChatRow(chat : chat)
                        NavigationLink(destination : {
                            ChatView(chat: chat)
                            .environmentObject(viewModel)
                            
                        }) {
                         EmptyView()
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: 0)
                        .opacity(0)
                    } // in oreder to hide the arrow
                    .swipeActions(edge: .leading , allowsFullSwipe: true){
                        Button(action: {
                            viewModel.markAsUnread(!chat.hasUnreadMessage, chat: chat)
                        }) {
                            if chat.hasUnreadMessage{
                                Label("Read", systemImage: "text.bubble")
                            } else {
                                Label("Unread", systemImage: "circle.fill")

                            }
                        }
                        .tint(.blue)
                    }
                 
                }
            }.listStyle(PlainListStyle())
                .searchable(text: $query)
                .navigationBarItems(trailing:
                    HStack {
                        Spacer() // Pushes the following items to the right
                        Button(action: {
                            // Your trailing button action
                        }) {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                )
                .navigationBarTitleDisplayMode(.inline) // This ensures the title is inline with the leading items
                .navigationTitle("مجتمعي")
        }
        
    }
    
}




struct Community_Previews: PreviewProvider {
    static var previews: some View {
        
        Community()
    }
}

