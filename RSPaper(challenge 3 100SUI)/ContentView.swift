//
//  ContentView.swift
//  RSPaper(challenge 3 100SUI)
//
//  Created by Artem on 19.07.2023.
//

import SwiftUI




struct ContentView: View {
    let cases = ["Rock","Scissors","Paper"]
 
//    @State var gameCase = "Rock"
    @State var isWin: Int = Bool.random() ? 1 : -1
    @State var score = 0
    @State var round = 0
    @State var selection = "Rock"
    @State var userSystemName = "rock.fill"
    @State var showAlert = false
    @State var correctAnswer = Int.random(in: 0...2)
 
    var body: some View {
        VStack {
           
            Text("Your score:\(score)/\(round)")
                .font(.largeTitle)
                .padding()
                .italic()
            Spacer()
          MyImageView(imageName: chooseUserPic(selection: cases[correctAnswer]))

            Text("You need to \(isWin == 1 ? "Win" : "Loose")")
                .font(.title)
                .foregroundColor(.pink)
            
            Spacer()
             Text("Your turn!")
                .font(.largeTitle)
                .italic()
            
          
            
            MyImageView(imageName: chooseUserPic(selection: selection))
                       
                    Picker (
                        selection: $selection,
                        label: Text("Picker"),
                            content: {
                                ForEach(0..<3) {
                            index in
                            Text(cases [index])
                                .tag(cases[index])
                        }
                    })
                    .pickerStyle(.segmented)
                    .background(Color.yellow)
                    .padding()
                    
            
            Button("Play") {
                play()
            }
            .buttonStyle(.borderedProminent)
            .offset(y: 30)
            .padding()
            Group{
                Text("Is Win: \(isWin)")
                    .padding()
                Text("Selection is: \(selection)")
                    .padding()
                Text("Game case is: \(cases[correctAnswer])")
            }
        }
        .padding()
        .alert("Game over!", isPresented: $showAlert) {
            Button("Reset", action: reset)
        } message: {
            Text("Your score is \(score)")
        }
      
    }
    
    
    func reset() {
        score = 0
        round = 0
        correctAnswer = Int.random(in: 0...2)
    }
    
    func play() {
        round += 1
        
        if selection == cases[correctAnswer] {
            score -= 1
        }
    
            if cases[correctAnswer] == "Rock" {
                if selection == "Paper" {
                    score += 1*isWin
                }
                if selection == "Scissors"{
                    score -= 1*isWin
                }
        }
        
        if cases[correctAnswer] == "Paper" {
            if selection == "Scissors" {
                score += 1*isWin
            }
            if selection == "Rock"{
                score -= 1*isWin
            }
    }
        
        if cases[correctAnswer] == "Scissorsr" {
            if selection == "Rock" {
                score += 1*isWin
            }
            if selection == "Paper"{
                score -= 1*isWin
            }
        }
        if round >= 3 {
            showAlert = true
        }
        correctAnswer = Int.random(in: 0...2)
        isWin = Bool.random() ? 1 : -1
        return
    }
    func chooseUserPic(selection: String)-> String {
        switch selection {
        case "Paper": return "newspaper.fill"
        case "Rock": return "mountain.2"
        default: return "scissors"
        }
    }
}


struct MyImageView: View {
    
    let imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 100)
            .imageScale(.large)
            .foregroundColor(.accentColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

