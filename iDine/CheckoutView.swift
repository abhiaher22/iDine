//
//  CheckoutView.swift
//  iDine
//
//  Created by Abhijeet Aher on 1/12/20.
//  Copyright © 2020 Abhijeet Aher. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order : Order
    
    @State private var paymentType = 0
    static let paymentTypes = ["Cash", "credit card", "iDine point"]
    
    @State private var addLoyalitydetails = false
    @State private var loyalityNumber = ""
    @State private var showingPaymentAlert = false

    
    static let tipamounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 1
    var totalPrice : Double{
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipamounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        
        Form{
            Section{
                Picker("How do you want to pay?", selection: $paymentType){
                    ForEach(0 ..< Self.paymentTypes.count){
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyalitydetails.animation()) {
                    Text("Add iDine loyality tag?")
                }
                
                if addLoyalitydetails{
                    TextField("Enter your iDine Id", text: $loyalityNumber)
                }
            }
            
            Section(header: Text("Add a tip?")){
                Picker("Percentage", selection: $tipAmount){
                    ForEach(0 ..< Self.tipamounts.count){
                            Text("\(Self.tipamounts[$0])")
                        }
                    }
            }.pickerStyle(SegmentedPickerStyle())
            
            
            Section(header:Text("TOTAL: $\(totalPrice, specifier: "%.2f")").font(.largeTitle))
            {
                Button("Confirm order"){
                    self.showingPaymentAlert.toggle()
            }
            }
            
        }.navigationBarTitle( Text("Payment"), displayMode: .inline)
            .alert(isPresented: $showingPaymentAlert) { () -> Alert in
                Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice , specifier: "%.2f") - thank you"), dismissButton: .default(Text("Ok")))
        }
    }
    
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
