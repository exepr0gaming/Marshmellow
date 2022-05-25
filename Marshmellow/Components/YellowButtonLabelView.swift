//
//  YellowButtonView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 19.05.2022.
//

import SwiftUI

struct YellowButtonLabelView: View {
	
	var buttonText: String
	
    var body: some View {
			
				Text(buttonText)
					.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 20, color: .black)
					
			
			.frame(height: 70)
			.frame(maxWidth: .infinity)
			.background(Color.cYellow)
			.cornerRadius(22)
			.shadow(color: Color.cYellow.opacity(0.35), radius: 17, x: 0, y: 4)
    }
}

struct YellowButtonView_Previews: PreviewProvider {
    static var previews: some View {
			YellowButtonLabelView(buttonText: "Next")
    }
}
