//
//  UserDefaults&AppStorage.swift
//  PreProject7
//
//  Created by Bruno Oliveira on 09/02/24.
//

import SwiftUI

struct UserDefaults_AppStorage: View {
    
    //Speaking of reading the data back, rather than start with tapCount set to 0 we should instead make it read the value back from UserDefaults like this:
    //@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    //Without UserDefaults
    //@State private var tapCount = 0
    
    /*Sometimes having a default value like 0 is helpful, but other times it can be confusing. With Booleans, for example, you get back false if boolean(forKey:) can’t find the key you asked for, but is that false a value you set yourself, or does it mean there was no value at all?
     
     Second, it takes iOS a little time to write your data to permanent storage – to actually save that change to the device. They don’t write updates immediately because you might make several back to back, so instead they wait some time then write out all the changes at once. How much time is another number we don’t know, but a couple of seconds ought to do it.

     As a result of this, if you tap the button then quickly relaunch the app from Xcode, you’ll find your most recent tap count wasn’t saved. There used to be a way of forcing updates to be written immediately, but at this point it’s worthless – even if the user immediately started the process of terminating your app after making a choice, your defaults data would be written immediately so nothing will be lost.

     Now, I mentioned that SwiftUI provides an @AppStorage property wrapper around UserDefaults, and in simple situations like this one it’s really helpful. What it does is let us effectively ignore UserDefaults entirely, and just use @AppStorage rather than @State, like this:*/
    
    //AppStorage  uses UserDefaults like the other way, and insantly saves the changes (reading and safing changes)
    @AppStorage("tappingCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap to count \(tapCount)") {
            tapCount += 1
            
            //without @AppStorage:
            //UserDefaults.standard.set(tapCount, forKey: "Tap")
            /* We need to use UserDefaults.standard. This is the built-in instance of UserDefaults that is attached to our app, but in more advanced apps you can create your own instances. For example, if you want to share defaults across several app extensions you might create your own UserDefaults instance.
             There is a single set() method that accepts any kind of data – integers, Booleans, strings, and more.
             We attach a string name to this data, in our case it’s the key “Tap”. This key is case-sensitive, just like regular Swift strings, and it’s important – we need to use the same key to read the data back out of UserDefaults. */
        }
    }
}

#Preview {
    UserDefaults_AppStorage()
}
