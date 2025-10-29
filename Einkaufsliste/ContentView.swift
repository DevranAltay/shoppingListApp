//
//  ContentView.swift
//  Einkaufsliste
//
//  Created by Devran Altay on 21.03.25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shoppingList = [""]
    @State private var newItem = ""
    init() {
        if let savedListe = UserDefaults.standard.array(forKey: "ShoppingListStorarge") as? [String], !savedListe.isEmpty {
            _shoppingList = State(initialValue: savedListe)
        } else {
            _shoppingList = State(initialValue: [])
        }
    }

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .padding()
                        .shadow(radius: 15)
                    VStack {
                        NavigationView {
                            List {
                                ForEach(shoppingList, id: \.self) { einkaufsartikel in
                                    Text(einkaufsartikel)
                                }
                                .onDelete { offsets in
                                    shoppingList.remove(atOffsets: offsets)
                                    UserDefaults.standard.set(shoppingList, forKey: "ShoppingListStorarge")
                                }
                            }
                            .navigationTitle("Shopping List 🛒")
                            
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))

                        HStack {
                            TextField("New Item", text: $newItem)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Button(action: {
                                shoppingList.append(newItem)
                                newItem = ""
                                UserDefaults.standard.set(shoppingList, forKey: "ShoppingListStorarge")
                            }) {
                                Text("Add")
                                    .bold()
                            }
                        }
                        .padding()
                    }
                    .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
