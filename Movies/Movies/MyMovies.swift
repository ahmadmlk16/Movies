//
//  MyMovies.swift
//  Movies
//
//  Created by CS3714 on 4/19/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import SwiftUI
 
struct MyMovies: View {
   
    // Subscribe to changes in UserData
    @EnvironmentObject var userData: UserData
   
    var body: some View {
        NavigationView {
            List {
                // Each movie struct has its own unique 'id' used by ForEach
                ForEach(userData.moviesList) { amovie in
                    NavigationLink(destination: MovieDetails(movie: amovie)) {
                        MovieItem(movie: amovie)
                    }
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
               
            }   // End of List
            .navigationBarTitle(Text("Movies I Like"), displayMode: .inline)
           
            // Place the Edit button on left of the navigation bar
            .navigationBarItems(leading: EditButton())
           
        }   // End of NavigationView
    }
   
    /*
     -------------------------------
     MARK: - Delete Selected movie
     -------------------------------
     */
    /*
     IndexSet:  A collection of unique integer values that represent the indexes of elements in another collection.
     first:     The first integer in self, or nil if self is empty.
     */
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            userData.moviesList.remove(at: first)
        }
        // Set the global variable point to the changed list
        movieStructList = userData.moviesList
    }
   
    /*
     -----------------------------
     MARK: - Move Selected movie
     -----------------------------
     */
    func move(from source: IndexSet, to destination: Int) {
 
        userData.moviesList.move(fromOffsets: source, toOffset: destination)
       
        // Set the global variable point to the changed list
        movieStructList = userData.moviesList
    }
}
 
 
struct MyFavoritesList_Previews: PreviewProvider {
    static var previews: some View {
        MyMovies()
            .environmentObject(UserData())
    }
}
 
 
