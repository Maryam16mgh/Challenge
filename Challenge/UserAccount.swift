//
//  UserAccount.swift
//  Challenge
//
//  Created by Maryam Mohammad on 22/05/1445 AH.
//

import SwiftUI

struct UserAccount: View {
    
    
    
    @State var shouldShowImagePicker = false
        @State var image: UIImage?
    // Sample user data
    @State private var phoneNumber = ""
    @State private var interests = ""
    var body: some View {
      //  NavigationView {
            ZStack {
                // Overlay with color
                Color("lightBlue")
                .edgesIgnoringSafeArea(.all)
                
                // Background
                Image("midScreem")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.bottom, -120.0)
                    .frame(width: 361, height: 550.0)
                    .edgesIgnoringSafeArea(.all)
                
                
                
                
                VStack {
//                    Button { }
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .foregroundStyle(Color("midBlue"))
                        .padding(.leading, 350.0)
                    
                    
                
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
                                    .padding()
                                    .foregroundColor(Color("midBlue"))
                            }
                        }
                    }
                    
                    // User Name
                    Text("خالد احمد")
                        .foregroundColor(Color("darkBlue"))
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                        .foregroundStyle(Color("midBlue"))
                        .font(.system(size: 20))
                        .padding(.leading, -68.0)
                        .padding (.top, -35.0)
                        .font(.title)
                    
                    
                    
                    // Bio
                    Text("MKHA@#hka.com")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                    
                    // Interests TextEditor
                    HStack(alignment: .top){
                        Text ("اهتماماتي ")
                            .foregroundColor(Color("darkBlue"))
                            .multilineTextAlignment(.trailing)
                            .padding(.leading, 90)
                            .padding(.trailing, -200.0)
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: 329, height: 200
                                   , alignment: .trailing)
                            .cornerRadius(23)
                            .foregroundColor(Color("lightBlue"))
                        
                        TextField("اهتماماتي" , text: $interests)
                            .frame(width:300)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.phonePad)
                            .padding(10)
                            .padding(.bottom, 120.0)
                        
                    }
                    // Phone Number TextField
                    VStack(alignment: .leading, spacing: 10)
                    {
                        Text("رقم الجوال")
                            .foregroundColor(Color("darkBlue"))
                            .padding(.leading,250)
                        RoundedRectangle(cornerRadius: 23)
                            .foregroundStyle(Color("lightBlue"))
                            .frame(width: 329, height: 44 , alignment: .trailing)
                            .overlay(
                                TextField("0512345678" , text: $phoneNumber)
                                    .multilineTextAlignment(.trailing)
                                    .keyboardType(.phonePad)
                                    .padding(10)
                            )  }
                    
                    Spacer()
                    
                    
                    // Update Button
                    Button(action:{
                      
                            
                            }) {
                                ZStack{
                                    Rectangle()
                                        .frame(width: 278 , height: 45)
                                        .cornerRadius(23)
                                        .foregroundColor(Color("midBlue"))
                                    Text("تحديث")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                    
                                }
                                
                                .offset(y:-40)        }
                    //.padding(.top , 10)
               
                
            }
            
            .navigationViewStyle(StackNavigationViewStyle())
                  .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                      ImagePicker(image: $image)
                          .ignoresSafeArea()
            }
        }
        
    }
    
    // Create a preview for testing in Xcode

//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView()
//        }
//    }

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

    
    // Extension to convert hex color to SwiftUI Color
 
        }




#Preview {
    UserAccount()
}
