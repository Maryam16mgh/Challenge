//
//  ChatModel.swift
//  playingWithTahada
//
//  Created by Hasna Ahmed on 13/05/1445 AH.
//

import Foundation

struct Chat: Identifiable {
    var id : UUID { person.id }
    let person : Person
    var messages : [Message]
    var hasUnreadMessage = false
}


struct Person: Identifiable {
    let id = UUID()
    let name : String
    let imgString : String
}

struct Message : Identifiable {
    
    enum MessageType{
        case Sent, Received
    }
    
    let id = UUID()
    let date : Date
    let text : String
    let type: MessageType
    
    init(_ text : String , type: MessageType, date: Date) {
        self.date = date
        self.text = text
        self.type = type
    }
    
    init(_ text: String , type: MessageType){
        self.init(text, type: type, date: Date())
    }
}


extension Chat {
    
    static let sampleChat = [Chat (person: Person(name: "خالد محمد", imgString: "img1"),messages:[
        
        Message ("سلام خالد", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
        Message("اهلاٍ و عليكم السلام ، تفضل ", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
        Message ("احتاج مساعدتك في شغله اذا ممكن...", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
        Message ("اكيد حياك ، كيف اقدر اساعدك ؟", type: .Received, date: Date(timeIntervalSinceNow: -86400  * 2)),
        Message ("بسألك في حال قد سجلت بهاكاثون داتا هاك ؟", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
        Message ("لا والله لكن سجلت بهاكاثون مشابه له ، انت مسجل ؟", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
        
        Message ("ايوه و حاب اعرف اكثر عن تجربتك", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
        Message ("بسيطه ان شاء الله ، هي مراحل و بكل مرحله تخصلون مهمه معينه ، و الله يوفقكم يا رب ", type: . Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
        Message("مشكور ما تقصر ، ان شاء الله بتتسهل ", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
        Message ("ولو حاضرين اي وقت ", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
        
//        Message ("OMG so bad ", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
//        Message ("Let me try one", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
//        Message("There are 10 types of people in this world, those who understand binary and those who don't", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
//        Message ("This jokeis sooo old haha", type: .Received, date: Date()),
    ], hasUnreadMessage: true),
                             
                             Chat (person: Person(name: " سارا احمد", imgString: "user"), messages: [
                                Message ("هلا احمد ، كيف المعسكر معاك ؟ امورك تمام ؟", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
                                Message("الحمدلله الامور ماشيه ع اتم ما يكون، و اخلصت اول ابلكيشن و باقي لي بعض التعديلات ، بس مره الكودنق ممتع ", type: . Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
                                Message("اوه ما شاء الله مبروك ، ، يلا بالتوفيق و استمر ", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
                                Message ("ايش فكره تطبيقك؟ اشرح لي اكثر اذا ممكن ", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
                                Message("هو ابلكيشن to do list ،برمجته للمعسكر بالاخص ، لكن حبيت التعامل مع swiftui و مكمل شغال ع ابلكيشنز ثانيه ", type: .Received, date: Date())
                             ]),
                             

                             Chat (person: Person(name: "مجتمع هاكثون dataHack", imgString: "dataHack"), messages: [
                                Message ("اهلا سارا ، كيف امورك مع الكودنق؟", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 10)),
                                Message("الحمدلله تمام ، خلصت معسكر لمده ٣ شهور عن swiftui ، و حاليا اتدرب على hacking with swift", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 10)),
                                Message ("دانة صالح : اوه حلو ، جربته hacking with swift ،و مررره استفدت ، بالتوفيق", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 9)),
                             ]),
                             
                             Chat (person: Person(name: "فهد ماجد", imgString: "img3"), messages: [
                                Message ("سلام خالد ، حاب اشكرك على مساعدتك لي خلال معسكر سويفت ، و اتمنى لك التوفيق ", type: .Sent, date: Date (timeIntervalSinceNow: -86400 * 4)),
                                Message("معك فهد", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
                             ]),
    ]
    
}


//extension Chat {
//    static let sampleChat = [Chat (person: Person(name: "Hakim", imgString: "img1"),messages:[
//
//        Message ("Hey Hakim", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
//        Message("I am just developing an WhatsApp Clone App and it is so hard to create a fake help me out with it?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
//        Message ("Please I need your help", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
//        Message ("Sure how can I help you flo?", type: .Received, date: Date(timeIntervalSinceNow: -86400  * 2)),
//        Message ("Maybe you send me some \"good\" jokes C", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
//        Message ("Sure I can do that. No problem Ma", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
//        Message ("Sure I can do that. No problem Ma", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
//        Message ("What do you call a fish with no eyes?", type: . Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
//        Message("Hmm, Idk", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
//        Message ("A fsh", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
//        Message ("OMG so bad ", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
//        Message ("Let me try one", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
//        Message("There are 10 types of people in this world, those who understand binary and those who don't", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
//        Message ("This jokeis sooo old haha", type: .Received, date: Date()),
//    ], hasUnreadMessage: true),
//
//                             Chat (person: Person(name: "Vladimir W.", imgString: "img6"), messages: [
//                                Message ("Hey Vlad, how is your bootcamp going?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
//                                Message("It's going great flo. I have just finished my first app, but I still have a lot to learn, but coding is so much fun. I love it :)", type: . Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
//                                Message("Hey that sounds great. Congratulations Vlad ", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
//                                Message ("What type of app is it?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
//                                Message("It's a Table App. I have coded it for the bootcamp, so that I get more familiar withSwiftUI.", type: .Received, date: Date()),
//                                Message ("The big question now is if I should ftart a junior dev job or if I should do app development just for fun.", type: .Received, date: Date()),
//                             ]),
//
//                             Chat (person: Person(name: "Andrej", imgString: "img7"), messages: [
//                                Message ("Hey Sensei'", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
//                                Message ("Can you show me a new Meditation exercise? The last one was so helpfull 3", type: .Sent, date: Date (timeIntervalSinceNow: -86400 * 3)),
//                                Message ("No what is that?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
//                                Message ("This technique can increase your energy and help you to feel more alert.", type: . Received),
//                             ], hasUnreadMessage: false),
//
//                             Chat (person: Person(name: "Romesh", imgString: "img9"), messages: [
//                                Message ("Hey Romesh, how is your dev journey going?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
//                                Message("Thanks for asking flo. It is going great. I just completed the HWS course. I have learned so much an now I am starting to building my own app.", type: . Received, date: Date(timeIntervalSinceNow: -86400 * 4)),
//                                Message ("That sounds great. I'm so proud of you, that you completed the course. Most people don't have the endurance to complete it, because the cannot sit with the problem long enough. So you can definetly see this as an archievment3b", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2))
//
//                             ]),
//                             Chat (person: Person(name: "Dirk S.", imgString: "img8"), messages: [
//                                Message ("Hey Dirk, are you from germany?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
//                                Message ("Hey Flo, yes I am.", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
//                                Message ("Ohh thats cool, how is your dev journey going?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
//                                Message ("SwiftUI is just amazing, it makes coding so fast and elegant. I have currently completed the 100 days of SwiftUI course from Paul Hudson. The course was awesome and I learned so much 9", type: .Received, date: Date (timeIntervalSinceNow: -86400 * 2)),
//                                Message ("Nice Dirk, Congratulations for completing the course. Yeah you are right, I also love developing apps in SwiftUI, because you can do so much crazy stuff with just a few lines of code.", type: .Sent, date: Date (timeIntervalSinceNow: -86400 * 1)),
//                                Message ("SwiftUI is a real game changer for IOS Development ", type: .Sent , date: Date(timeIntervalSinceNow: -86400 * 1)),
//
//                             ]),
//                             Chat (person: Person(name: "Sandeep", imgString: "img2"), messages: [
//                                Message ("Hey buddy, what are you doing?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 10)),
//                                Message("I'm just learning SwiftUI. Do you know the awesome online course called Hacking With SwiftUI?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 10)),
//                                Message ("Oh yeah, this course is awesome. I have completed it and I can fully recommend it as well A", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 9)),
//                             ]),
//
//                             Chat (person: Person(name: "Wayne D.", imgString: "img3"), messages: [
//                                Message ("Hey Wayne, I just want to say thank you so much for your support on Patreon A", type: .Sent, date: Date (timeIntervalSinceNow: -86400 * 4)),
//                                Message("I hope you will read this @", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
//                             ]),
//    ]}
        
                             
            
            
        
        
 
