//
//  CastMembers.swift
//  Movies
//
//  Created by Mohsin on 4/20/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import SwiftUI

struct CastMembers: View {
    var body: some View {

            List {
                // Each movie struct has its own unique 'id' used by ForEach
                ForEach(foundStarsList) { astar in
                    StarItem(star: astar)

               
            }   // End of List
        }
    }
}

struct CastMembers_Previews: PreviewProvider {
    static var previews: some View {
        CastMembers()
    }
}
