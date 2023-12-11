//
//  CreateAccount.swift
//  Challenge
//
//  Created by Maryam Mohammad on 22/05/1445 AH.
//

import SwiftUI
import CloudKit




//IMAGEPICKER
struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    
    private let controller = UIImagePickerController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
}







class CreatAcocuntViewModel: ObservableObject{
    
    @Published var userName: String = ""
    @Published var userEmail: String = ""
    @Published var userPhone: String = ""
    
    
    
    func sendButtonPressed(){
        guard !userName.isEmpty else {return}
        guard !userEmail.isEmpty else {return}
        guard !userPhone.isEmpty else {return}
        //guard !eventNote.isEmpty else {return}
        
        addItem(name: userName, email: userEmail, phone: userPhone)
    }
    
    
    private func addItem(name:String , email:String , phone:String){
        let newRecord = CKRecord(recordType: "CreateAccountData")
        newRecord["userName"] = name
        newRecord["userEmail"] = email
        newRecord["userPhone"] = phone
        
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
    
    
    
    
}

struct OvalToggle: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Button {
            isOn.toggle()
        } label: {
            Image(systemName: isOn ? "largecircle.fill.circle" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.blue)
        }
        .padding(.trailing, 10)
    }
}



struct CreateAccount: View {
    
    @ObservedObject var viewModel = CreatAcocuntViewModel()
    
    
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    @State private var userPhone = ""
    @State private var userName = ""
    @State private var userEmail = ""
    @State private var isMale: Bool = false
    @State private var isWomen: Bool = false
    
    
    var body: some View {
        
        ZStack {
            Color("lightBlue")
                .edgesIgnoringSafeArea(.all)
            
            Image("MainBackground")
                .resizable()
                .frame(width: 390 , height: 584)
                .aspectRatio(contentMode: .fill)
                .padding(.bottom, -120.0)
                .edgesIgnoringSafeArea(.all)
            
            //                    Image("midScreem")
            //                        .frame(width: 390, height: 584)
            //                       // .padding(.top, -160)
            //                        .ignoresSafeArea()
            //                        .aspectRatio(contentMode: .fill)
            //                        //.padding(.bottom, -120.0)
            //                        .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("انشاء حساب")
                    .font(.title)
                    .foregroundStyle(Color("darkBlue"))
                
                
                
                Button {
                    shouldShowImagePicker.toggle()
                } label: {
                    VStack {
                        if let image = self.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 130)
                                .clipShape(Circle())
                                .cornerRadius(80)
                        } else {
                            Image(systemName: "person.fill")
                                .font(.system(size: 80))
                               // .padding()
                                .foregroundColor(Color("midBlue"))
                        }
                    }
                }
                
                Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    .foregroundStyle(Color("lightBlue"))
                    .font(.system(size: 20))
                    .padding(.leading, -68.0)
                    .padding(.top, -35.0)
                    .font(.title)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("الأسم")
                        .frame(width: 329, height: 45, alignment: .trailing)
                        .font(.title2)
                        .foregroundColor(Color("darkBlue"))
                    RoundedRectangle(cornerRadius: 23)
                        .foregroundStyle(Color("lightBlue"))
                        .frame(width: 329, height: 44, alignment: .trailing)
                        .overlay(
                            TextField("", text: $viewModel.userName)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.phonePad)
                                .padding(10)
                        )
                    Text("البريد الإلكتروني")
                        .frame(width: 329, height: 45, alignment: .trailing)
                        .font(.title2)
                        .foregroundColor(Color("darkBlue"))
                    
                    RoundedRectangle(cornerRadius: 23)
                        .foregroundStyle(Color("lightBlue"))
                        .frame(width: 329, height: 44, alignment: .trailing)
                        .overlay(
                            TextField("", text: $viewModel.userEmail)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.phonePad)
                                .padding(10)
                        )
                    Text("رقم الجوال")
                        .frame(width: 329, height: 45, alignment: .trailing)
                        .font(.title2)
                        .foregroundColor(Color("darkBlue"))
                    
                    RoundedRectangle(cornerRadius: 23)
                        .foregroundStyle(Color("lightBlue"))
                        .frame(width: 329, height: 44, alignment: .trailing)
                        .overlay(
                            TextField("", text: $viewModel.userPhone)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.phonePad)
                                .padding(10)
                        )
                    
                    Text("الجنس")
                        .frame(width: 329, height: 45, alignment: .trailing)
                        .font(.title2)
                        .foregroundColor(Color("darkBlue"))
                }
                
                Spacer()
                HStack {
                    
                    // Oval Toggle
                    Text("انثى")
                        .offset(x: -50, y: -50)
                        .font(.title2)
                        .foregroundColor(Color("darkBlue"))
                    OvalToggle(isOn: $isWomen)
                        .offset(x: -50, y: -50)
                    Text("ذكر")
                        .offset(x: 70, y: -50)
                        .font(.title2)
                        .foregroundColor(Color("darkBlue"))
                    
                    OvalToggle(isOn: $isMale)
                        .offset(x: 70, y: -50)
                }
                
                regisButtton
                
                // Update Button
                //                        Button("تسجيل") {
                //                            // Action for the button
                //                        }
                //                        .font(.title2)
                //                        .frame(width: 278, height: 45)
                //                        .foregroundColor(Color("lightBlue"))
                //                        .foregroundColor(.white)
                //                        .background(Color("midBlue"))
                //                        .cornerRadius(23)
                //                        .offset(y: -15)
                //                        .padding(.bottom, 20)
                //                        .padding()
                //                    }
                //                    .padding(.trailing)
                
            }
            
            .navigationViewStyle(StackNavigationViewStyle())
            .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                ImagePicker(image: $image)
                    .ignoresSafeArea()
            }
        }
        
        //
        //    struct ContentView_Previews: PreviewProvider {
        //        static var previews: some View {
        //            CreateAccount()
        //        }
        //    }
        
    }
}
        
    
    


extension CreateAccount {
    
    private var regisButtton: some View {
        Button(action:{
            viewModel.sendButtonPressed()
                
                }) {
                    ZStack{
                        Rectangle()
                            .frame(width: 278 , height: 45)
                            .cornerRadius(23)
                            .foregroundColor(Color("midBlue"))
                        Text("تسجيل")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                    }
                    
                } .offset(y:-40)
            
        }
               }


#Preview {
    CreateAccount()
}




               //
               //        Button("تسجيل") {
               //            // Action for the button
               //        }
               //        .font(.title2)
               //        .frame(width: 278, height: 45)
               //        .foregroundColor(Color("lightBlue"))
               //        .foregroundColor(.white)
               //        .background(Color("midBlue"))
               //        .cornerRadius(23)
               //        .offset(y: -15)
               //        .padding(.bottom, 20)
               //        .padding()
