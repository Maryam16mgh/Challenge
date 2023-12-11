//
//  ChatView.swift
//  playingWithTahada
//
//  Created by Hasna Ahmed on 14/05/1445 AH.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var viewModel : ChatsViewModel
    let chat : Chat
    
    @State private var text = ""
    @FocusState private var isFocused
    @State private var messageIDToScroll : UUID?
    @State var showingSheet = false
    
    var body: some View {
            ZStack{
                VStack(spacing: 0){
                    GeometryReader{ reader in
                        ScrollView{
                            ScrollViewReader{ scrollReader in
                                getMessageView(ViewWidth : reader.size.width)
                                    .padding(.horizontal)
                                    .onChange(of: messageIDToScroll){ newValue in
                                        if let messageID = messageIDToScroll{
                                            scrollTo(messageID: messageID, shouldAnimated: true, scrollReader: scrollReader)
                                        }
                                    }.onAppear{
                                        if let messageID = chat.messages.last?.id {
                                            scrollTo(messageID: messageID, anchor: .bottom, shouldAnimated: false, scrollReader: scrollReader)
                                        }
                                    }// to make it automatically at the last message in the chat
                            }
                            
                        }
                        
                    }.padding(.bottom, 5)
                    toolbarView()
                }.padding(.top , 1)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(leading: navBarLeadingBtn , trailing: navBarTrailingBtn)
                
                
                    .onAppear{
                        viewModel.markAsUnread(false, chat: chat)
                    }
            }.background(Image("MainBackground").resizable().scaledToFill().ignoresSafeArea())

    }
    
    var navBarLeadingBtn: some View {
        NavigationLink(
            destination: FriendAccountView(friendName: chat.person.name, friendImg: chat.person.imgString),
            label: {
                HStack {
                    Image(chat.person.imgString)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())

                    Text(chat.person.name).bold()
                }
                .foregroundColor(.black)
            }
        )
    }
    
    
//    var navBarLeadingBtn: some View {
//        NavigationLink(destination: FriendAccountView()){
//                    HStack {
//                       // Image(chat.person.imgString)
//                        Image("user")
//                            .resizable()
//                            .frame(width: 40, height: 40)
//                            .clipShape(Circle())
//    
//                       // Text(chat.person.name).bold()
//                        Text("سارا احمد").bold()
//                            .foregroundStyle(Color("darkBlue"))
//                    }
//                    .foregroundColor(.black)
//                }
//        
//        }
    
    
    
    var navBarTrailingBtn : some View{
        HStack{
        Button(action : {
            showingSheet.toggle()
        }){
            Image(systemName: "ellipsis")
        }.sheet(isPresented: $showingSheet){
            ReportView()
        }
        }
    }
    
    func scrollTo(messageID : UUID , anchor : UnitPoint? = nil , shouldAnimated : Bool, scrollReader: ScrollViewProxy ){
        DispatchQueue.main.async {
            withAnimation(shouldAnimated ? Animation.easeIn : nil) {
                scrollReader.scrollTo(messageID, anchor: anchor)
            }
        }
        
    }
    
    func toolbarView() -> some View {
        VStack{
            let height : CGFloat = 37
            HStack{
              TextField("Message ... " , text: $text)
                    .padding(.horizontal, 10)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .focused($isFocused)
                
                Button(action : sendMessage) {
                    
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .frame(width: height , height: height)
                        .background(
                        Circle()
                        .foregroundColor(text.isEmpty ? .gray : Color("midBlue") ))
                } .disabled(text.isEmpty)
            }.frame(height: height)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
    }
    
   func sendMessage(){
       if let message =  viewModel.sendMessage(text, in: chat){
           text = ""
           messageIDToScroll = message.id
       }
    }
    
    let columns = [GridItem(.flexible(minimum: 10))]
    
    func getMessageView(ViewWidth: CGFloat) -> some View {
        LazyVGrid(columns: columns, spacing: 0, pinnedViews: [.sectionHeaders]) {
            let sectionMessage = viewModel.getSectionMessage(for: chat)
            ForEach(sectionMessage.indices, id: \.self) { sectionIndex in
                let messages = sectionMessage[sectionIndex]
                Section(header: sectionHeader(firstMessage: messages.first!)) {
                    ForEach(messages) { message in
                        let isReceived = message.type == .Received
                        HStack {
                            ZStack {
                                Text(message.text)
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal)
                                    .padding(.vertical)
                                    .background(isReceived ? Color("lightBlue") : Color("midBlue"))
                                    .cornerRadius(13)
//                                    .overlay(
//                                    RoundedRectangle(cornerRadius: 13)
//                                    .stroke(Color.gray, lineWidth: 1)
//                                    )
                                
                                // Add border
                            }
                            .frame(width: ViewWidth * 0.7, alignment: isReceived ? .leading : .trailing)
                            .padding(.vertical)
                        }
                        .frame(maxWidth: .infinity, alignment: isReceived ? .leading : .trailing)
                        .id(message.id) // for automatic scroll later
                    }
                }
            }
        }
    }

    
    func sectionHeader(firstMessage message : Message) -> some View{
        ZStack{
            Text(message.date.descriptiveString(dateStyle: .medium))
                .foregroundColor(.darkBlue)
                .font(.system(size: 14, weight: .regular))
                .frame(width: 120)
                .padding(.vertical, 5)
                .background(Capsule().foregroundColor(Color("lightBlue")))
//                .background(Capsule().foregroundColor(.accentColor))
        }
        .padding(.vertical,5)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    NavigationView{
        ChatView(chat: Chat.sampleChat[0])
            .environmentObject(ChatsViewModel())
    }

}



/*
 
 
 .navigationBarItems(leading: NavigationLink(
     destination: FriendAccountView(),
     label: {
         navBarLeadingBtn
     }), trailing: navBarTrailingBtn)
 
 
 
 .navigationBarItems(leading: NavigationLink(
     destination: FriendAccountView(),
     label: {
         navBarLeadingBtn
     }), trailing: navBarTrailingBtn)
 
 */
