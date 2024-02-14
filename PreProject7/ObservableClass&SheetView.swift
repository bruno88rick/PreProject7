//
//  ContentView.swift
//  PreProject7
//
//  Created by Bruno Oliveira on 08/02/24.
//

// importing Observation allow us view the hidden code that @Observation really do when we update a class property, inside our swiftUI view.

import Observation
import SwiftUI

/*That @Observable line is a macro, which is Swift's way of quietly rewriting our code to add extra functionality. Now that we've imported the framework it comes from, Xcode can do something really neat: if you right-click on @Observable in your code, you can choose Expand Macro to see exactly what rewriting is happening – Xcode will show you all the hidden code that's being generated.*/

@Observable
class User {
    /*Our two properties are marked @ObservationTracked, which means Swift and SwiftUI are watching them for changes. If you right-click on @ObservationTracked you can expand that macro too – yes, it's a macro inside a macro. This macro has the job of tracking whenever any property is read or written, so that SwiftUI can update only views that absolutely need to be refreshed.*/
    
    /*Our class is made to conform to the Observable protocol. This is important, because some parts of SwiftUI look for this to mean "this class can be watched for changes.*/
    
    var firstName = "Bruno"
    var lastName = "Oliveira"
}

struct SecondView: View {
    
    /*@Envirioment allows us to create properties that store values provided to us externally. Is the user in light mode or dark mode? Have they asked for smaller or larger fonts? What timezone are they on? All these and more are values that come from the environment, and in this instance we’re going to ask the environment to dismiss our view*/
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        NavigationStack {
            Text("My first name is: \(name)")
            .toolbar {
                Button ("Dismiss") {
                    dismiss()
                }
            }
        }
        .padding()
    }
}

struct ObsevableClasses: View {
    @State private var user = User()
    @State private var showingSheet = false
    
    var body: some View {
        VStack (spacing: 20){
            Text("You name is \(user.firstName) and last name is \(user.lastName)")
            TextField("User First name", text: $user.firstName)
            TextField("User last name", text: $user.lastName)
            
            Button ("Tap to show my First name on second View!") {
                showingSheet.toggle()
            }
            //showing second view like a sheet view(run to see, but is a new view presented on toop of our existinng one)
            .sheet(isPresented: $showingSheet) {
                SecondView(name: user.firstName)
            }
            
            
        }.padding()
    }
}

#Preview {
    ObsevableClasses()
}
