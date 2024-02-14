//
//  DeletingWithOnDelete.swift
//  PreProject7
//
//  Created by Bruno Oliveira on 09/02/24.
//

import SwiftUI

struct DeletingWithOnDelete: View {
    @State private var number = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(number, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
            }
            Button("Add Row") {
                number.append(currentNumber)
                currentNumber += 1
            }
            //we can add an Edit/Done button to the navigation bar, that lets users delete several rows more easily.
            .toolbar {
                EditButton()
            }
        }
    }
    /*the onDelete() modifier only exists on ForEach, so if we want users to delete items from a list we must put the items inside a ForEach. This does mean a small amount of extra code for the times when we have only dynamic rows, but on the flip side it means it’s easier to create lists where only some rows can be deleted.
     
     In order to make onDelete() work, we need to implement a method that will receive a single parameter of type IndexSet. This is a bit like a set of integers, except it’s sorted, and it’s just telling us the positions of all the items in the ForEach that should be removed.

     Because our ForEach was created entirely from a single array, we can actually just pass that index set straight to our numbers array – it has a special remove(atOffsets:) method that accepts an index set.*/
    
    func removeRows(at offsets: IndexSet) {
        number.remove(atOffsets: offsets)
    }
    
}

#Preview {
    DeletingWithOnDelete()
}
