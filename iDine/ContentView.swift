//
//  ContentView.swift
//  iDine
//
//  Created by Abhijeet Aher on 1/11/20.
//  Copyright © 2020 Abhijeet Aher. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView{
            List{
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            NavigationLink(destination:  ItemDetails(item: item)) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }.navigationBarTitle("Menu")
            .listStyle(PlainListStyle())
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
