//
//  MoviesSearched.swift
//  Movies
//
//  Created by Mohsin on 4/20/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import SwiftUI

struct MoviesSearched: View {
      @EnvironmentObject var userData: UserData
    var body: some View {

            List {
                // Each movie struct has its own unique 'id' used by ForEach
                ForEach(searchMoviesList) { amovie in
                    NavigationLink(destination: NowPlayingMovieDetails(movie: amovie)) {
                        MovieItem(movie: amovie)
                    }
                }
            }   // End of List
                .navigationBarTitle(Text("Found Movies"), displayMode: .inline)

    }
}

struct MoviesSearched_Previews: PreviewProvider {
    static var previews: some View {
        MoviesSearched()
    }
}
