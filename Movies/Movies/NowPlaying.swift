//
//  NowPlaying.swift
//  Movies
//
//  Created by CS3714 on 4/19/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import SwiftUI

struct NowPlaying: View {
      @EnvironmentObject var userData: UserData
    var body: some View {
        NavigationView {
            List {
                // Each movie struct has its own unique 'id' used by ForEach
                ForEach(nowplayingList) { amovie in
                    NavigationLink(destination: NowPlayingMovieDetails(movie: amovie)) {
                        MovieItem(movie: amovie)
                    }
                }
            }   // End of List
                .navigationBarTitle(Text("Movies Now Playing in Theatres"), displayMode: .inline) 
        }   // End of NavigationView
    }
}

struct NowPlaying_Previews: PreviewProvider {
    static var previews: some View {
        NowPlaying()
    }
}
