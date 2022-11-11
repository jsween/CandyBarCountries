//
//  ContentView.swift
//  CandyBarCountries
//
//  Created by Jonathan Sweeney on 11/5/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var countries: FetchedResults<Country>
    
    var body: some View {
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(country.wrappedFullName) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }//: LIST
        }//: VSTACK
        .onAppear() {
            let candy1 = Candy(context: viewContext)
            candy1.name = "Reeses Peanut Butter Cups"
            candy1.origin = Country(context: viewContext)
            candy1.origin?.shortName = "UK"
            candy1.origin?.fullName = "United Kingdom"
            
            let candy2 = Candy(context: viewContext)
            candy2.name = "Kit Kat"
            candy2.origin = Country(context: viewContext)
            candy2.origin?.shortName = "UK"
            candy2.origin?.fullName = "United Kingdom"
            
            let candy3 = Candy(context: viewContext)
            candy3.name = "Twix"
            candy3.origin = Country(context: viewContext)
            candy3.origin?.shortName = "UK"
            candy3.origin?.fullName = "United Kingdom"
            
            let candy4 = Candy(context: viewContext)
            candy4.name = "Toblerone"
            candy4.origin = Country(context: viewContext)
            candy4.origin?.shortName = "CH"
            candy4.origin?.fullName = "Switzerland"
            
            try? viewContext.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
