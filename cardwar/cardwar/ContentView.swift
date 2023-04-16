//
//  ContentView.swift
//  cardwar
//
//  Created by Ankur on 22/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var playercard="card13"
    @State var cpucard="card7"
    @State var playerscore=0
    @State var cpuscore=0
    
    var body: some View {
        
        ZStack{
            
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playercard)
                    Spacer()
                    Image(cpucard)
                    Spacer()
                }
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }
                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        
                        Text(String(playerscore))
                            .font(.largeTitle)
                        
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuscore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }.foregroundColor(.white)
                
                Button {
                    reset()
                } label: {
                    Image("reset")
                        .resizable()
                        .frame(width: 100,height: 50)
                }
            }
        }
    }
    func deal(){
        //        card switching
        var playercardnum = Int.random(in: 2...14)
        playercard="card"+String(Int(playercardnum))
        
        var cpucardnum = Int.random(in: 2...14)
        cpucard="card"+String(Int(cpucardnum))
        //        points
        if playercardnum > cpucardnum{
            playerscore+=1
        }
        if playercardnum < cpucardnum{
            cpuscore+=1
        }
        
    }
    func reset(){
        cpuscore=0
        playerscore=0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
