//
//  OrderView.swift
//  iDine
//
//  Created by Abhijeet Aher on 1/12/20.
//  Copyright © 2020 Abhijeet Aher. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items) { item in
                        HStack{
                        Text(item.name)
                        Spacer()
                        Text("$\(item.price)")
                    }
                    }.onDelete(perform: deleteItem)
            }
            
            Section{
                NavigationLink(destination: CheckoutView()) {
                    Text("Place Order")
                }.disabled(self.order.items.isEmpty)
            }
        }
            .navigationBarTitle("Order")
              .listStyle(PlainListStyle())
        }
    }
    
    func deleteItem(at offset: IndexSet){
        self.order.items.remove(at: offset.first!)
    }
}


struct OrderView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
