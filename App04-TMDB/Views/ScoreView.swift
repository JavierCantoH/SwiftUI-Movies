//
//  ScoreView.swift
//  App04-TMDB
//
//  Created by Luis Javier Canto Hurtado on 28/10/21.
//

import SwiftUI

import SwiftUI

struct ScoreView: View {
    
    var score: Double
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: 60, height: 60)
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.55)
                .foregroundColor(Color.black)
                .frame(width: 70, height: 70)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(score / 10, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(ScoreColor(score: score))
                .rotationEffect(Angle(degrees: 270.0))
                .frame(width: 70, height: 70)
                .animation(.linear)
            Text(String(format: "%.0f %%", min(score*10, 100.0)))
                .font(.body)
                .foregroundColor(.white)
                .bold()
        }
    }
    
    func ScoreColor(score: Double) -> Color {
        if score > 7.5 {
            return Color.green
        } else {
            if score > 6 && score <= 8 {
                return Color.yellow
            } else {
                return Color.red
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 8.1)
    }
}
