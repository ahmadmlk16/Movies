//
//  StarItem.swift
//  Stars
//
//  Created by Mohsin on 4/20/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import SwiftUI
 
struct StarItem: View {
    // Input Parameter
    let star: Star
   
    var body: some View {
        HStack {
            getImageFromUrl(url: "http://image.tmdb.org/t/p/w500/\(star.image)")
                .resizable()
                .frame(width: 70, height: 105)
            VStack(alignment: .leading){
                Text(star.name)
                Text("playing")
                Text(star.character)
            }
        }
            .font(.system(size: 14))   // End of HStack
    }
   

 
 
struct StarItem_Previews: PreviewProvider {
    static var previews: some View {
        StarItem(star: foundStarsList[0])
    }
}
}
 
 
