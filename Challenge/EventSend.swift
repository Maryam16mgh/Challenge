//
//  EventSend.swift
//  Challenge
//
//  Created by Maryam Mohammad on 13/05/1445 AH.
//

import SwiftUI
import CloudKit

class EventSendViewModel: ObservableObject{
   /* @Published var textTest1 : String = ""
    @Published var textTest2 : String = ""
    @Published var textTest3 : String = ""
    @Published var textTest14 : String = ""*/
    
    
        @Published var eventNameSheet: String = ""
        @Published var eventDescr: String = ""
        @Published var eventLink: String = ""
       // @Published var eventNote: String = ""
    
    
    func sendButtonPressed(){
        guard !eventNameSheet.isEmpty else {return}
        guard !eventDescr.isEmpty else {return}
        guard !eventLink.isEmpty else {return}
        //guard !eventNote.isEmpty else {return}
        
        addItem(name: eventNameSheet, descr: eventDescr, link: eventLink)
    }
    
    
    private func addItem(name:String , descr:String , link:String){
        let newRecord = CKRecord(recordType: "EventSendData")
        newRecord["eventNameSheet"] = name
        newRecord["eventDescr"] = descr
        newRecord["eventLink"] = link
        
        saveItem(record: newRecord)
    }
    
    
    private func saveItem (record: CKRecord){
        CKContainer(identifier: "iCloud.M.ChallengeM2.Tahada").publicCloudDatabase.save(record){ returnedRecord, returnedErorr in
            guard returnedErorr == nil else {
                return
            }
            print("Record: \(String(describing: returnedRecord))")
            print("Erorr: \(String(describing: returnedErorr))")
            
//            self?.eventNameSheet = ""
//            self?.eventDescr = ""
//            self?.eventLink = ""
//            self?.eventNote = ""
        }
    }
    /*
    private func saveItem (record: CKRecord){
        CKContainer.default().publicCloudDatabase.save(record){[weak self] returnedRecord, returnedErorr in
            print("Record: \(String(describing: returnedRecord))")
            print("Erorr: \(String(describing: returnedErorr))")
            
            self?.eventNameSheet = ""
            self?.eventDescr = ""
            self?.eventLink = ""
            self?.eventNote = ""
        }
    }*/
}


struct EventSend:View {
    
    
    
//STRART//
       /* @Published private var eventNameSheet = EventSendViewModel()
        @StateObject private var eventDescr = EventSendViewModel()
        @StateObject private var eventLink = EventSendViewModel()
        @StateObject private var eventNote = EventSendViewModel()*/

    
        @ObservedObject var viewModel = EventSendViewModel()
    
        var fieldData: [(String, Binding<String>)] = []

        init() {
            fieldData = [
                ("اسم الفعالية", $viewModel.eventNameSheet),
                ("وصف الفعالية", $viewModel.eventDescr),
                ("رابط الفعالية", $viewModel.eventLink)
//                ("ملاحظات", $viewModel.eventNote)
            ]
        }
   
    
//FUNCTION//
    private func createTextField(title: String, text: Binding<String>) -> some View {
        VStack {
            Text(title)
                .frame(width: 329, height: 45, alignment: .trailing)
                .font(.title2)
                .foregroundColor(Color("darkBlue"))

            ZStack {
                Rectangle()
                    .frame(width: 329, height: 45 , alignment: .trailing)
                    .cornerRadius(23)
                    .foregroundColor(Color("lightBlue"))

                TextField("مطلوب", text: text)
                    .padding(.trailing, -200)
                    .keyboardType(.alphabet)
            }
        }
    }
    
    
    
    
   
    
    
    
    
    
    

//BODY//
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        
        ZStack{
            Image("fullScreen")
                .resizable()
                .frame(width: 423 , height: 800)
           
            
            VStack{
                Image("logo")
                    .resizable()
                    .frame(width: 243 ,height: 123)
                
                VStack {
                    ForEach(fieldData, id: \.0) { field, binding in
                        createTextField(title: field, text: binding)
                    }
                }
                
                 sendButtton
                }
                
            }
            
        }
        
    }



extension EventSend {
    
    
    private var sendButtton: some View {
        
        
        Button(action:{
            viewModel.sendButtonPressed()
            presentationMode.wrappedValue.dismiss()

        }) {
            ZStack{
                Rectangle()
                    .frame(width: 278 , height: 45)
                    .cornerRadius(23)
                    .foregroundColor(Color("midBlue"))
                Text("ارسال")
                    .font(.title2)
                    .foregroundColor(.white)
                
            }
            
        } .padding(.top , 30)
    }
}

#Preview {
    EventSend()
}




