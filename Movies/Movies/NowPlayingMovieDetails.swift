//
//  NowPlayingMovieDetails.swift
//  Movies
//
//  Created by Mohsin on 4/20/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import SwiftUI
 
struct NowPlayingMovieDetails: View {
    // Input Parameter
    let movie: Movie
     @EnvironmentObject var userData: UserData
    
     @State private var showAddedMessage = false
   
    var body: some View {
        // A Form cannot have more than 10 Sections.
        // Group the Sections if more than 10.
        Form {
            Group {
                Section(header: Text("Movie Title")) {
                    Text(movie.title)
                }
                Section(header: Text("Movie Poster")) {
                 getImageFromUrl(url: "http://image.tmdb.org/t/p/w500/\(movie.posterFileName)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Section(header: Text("Movie YouTube Video Trailer")) {
                    NavigationLink(destination: WebView(url: "http://www.youtube.com/embed/\(movie.youTubeTrailerId)")) {
                                           Image("YT")
                        .resizable()
                        .frame(width: 30, height: 25)
                                       }
                }
                Section(header: Text("Movie Overview")) {
                    Text(movie.overview)
                }
                Section(header: Text("Show Movie Cast Members")) {
                    NavigationLink(destination: StarsList) {
                         Image(systemName: "rectangle.stack.person.crop")
                        .resizable()
                             .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                       
                    }
                }
                
                Section(header: Text("Add this Movie to My Movies list")) {
                                   Button(action: {
                                       // Append the country found to userData.countriesList
                                    self.userData.moviesList.append(self.movie)
                
                                       // Set the global variable point to the changed list
                                    movieStructList = self.userData.moviesList
                         
                                      
                                       self.showAddedMessage = true
                                   }) {
                                       Image(systemName: "plus")
                                           .imageScale(.medium)
                                           .font(Font.title.weight(.regular))
                                   }
                               }
            }
            Group {
                Section(header: Text("Movie Runtime")) {
                    Text("\(movie.runtime/60) hours \(movie.runtime%60) mins")
                }
                Section(header: Text("Movie Genres")) {
                    Text(movie.genres)
                }
                Section(header: Text("Movie Release Date")) {
                    Text(movie.releaseDate)
                }
                Section(header: Text("Movie Director")) {
                    Text(verbatim: movie.director)
                }
                Section(header: Text("Movie Top Actors")) {
                    Text(movie.actors)
                }
                Section(header: Text("Movie MPAA Rating")) {
                    Text(movie.mpaaRating)
                }
                Section(header: Text("Movie IMDb Rating")) {
                    Text(movie.imdbRating)
                }
            }
 
        }   // End of Form
            .navigationBarTitle(Text(movie.title), displayMode: .inline)
            .alert(isPresented: $showAddedMessage, content: { self.alert })
        .font(.system(size: 14))
    }

    var StarsList : some View{
        
        getStarsDataFromApi(apiQueryUrl: String(movie.tmdbID))
        return CastMembers()
    }
    
    var alert: Alert {
           Alert(title: Text("Movie Added!"),
                 message: Text("This movie is added to your My Movies list."),
                 dismissButton: .default(Text("OK")) )
       }

    
}
 
 
struct NowPlayingMovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingMovieDetails(movie: movieStructList[0])
    }
}
 
