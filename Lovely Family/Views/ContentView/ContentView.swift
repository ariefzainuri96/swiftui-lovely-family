//
//  ContentView.swift
//  Simart UMBY
//
//  Created by фкшуа on 06/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Text("Why not try...").font(.largeTitle.bold())
            
            Spacer()
            
            VStack {
                Circle().fill(viewModel.selectedColor).padding().overlay(
                    Image(systemName:       "figure.\(viewModel.selected.lowercased())").font(.system(size: 144))
                        .foregroundColor(.white)
                )
                
                Text("\(viewModel.selected)").font(.title).foregroundColor(.black)
            }.transition(.slide).id(viewModel.id)
            
            Spacer()
            
            Button("Try again") {
                viewModel.generateRandomSport()
            }.buttonStyle(.borderedProminent)                
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
