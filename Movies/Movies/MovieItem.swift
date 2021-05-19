//
//  MovieItem.swift
//  Movies
//
//  Created by Mohsin on 4/20/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import SwiftUI
 
struct MovieItem: View {
    // Input Parameter
    let movie: Movie
   
    var body: some View {
        HStack {
            getImageFromUrl(url: "http://image.tmdb.org/t/p/w500/\(movie.posterFileName)")
            .resizable()
            .frame(width: 70, height: 105)
            VStack(alignment: .leading){
                Text(movie.title)
                HStack{
                    Image("IMDb")
                    .resizable()
                    .frame(width: 20, height: 20)
                    Text(movie.imdbRating)
                }
                Text(movie.actors)
                HStack{
                    Text(movie.mpaaRating)
                    Text("\(movie.runtime) mins")
                    Text(movie.releaseDate)
                }
            }
           
        }
            .font(.system(size: 14))   // End of HStack
    }
   

 
 
struct MovieItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieItem(movie: movieStructList[0])
    }
}
}
 
 
