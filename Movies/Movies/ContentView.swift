//
//  ContentView.swift
//  Movies
//
//  Created by CS3714 on 4/19/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

 
import SwiftUI
 
struct ContentView: View {
 
    var body: some View {
 
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            MyMovies()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("My Movies")
                }
            NowPlaying()
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text("Now Playing")
                }
            MovieSearch()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Movie Search")
                }
            Genre()
            .tabItem {
                Image(systemName: "list.bullet.below.rectangle")
                Text("Genres")
            }        }   // End of TabView
        .font(.headline)
        .imageScale(.medium)
        .font(Font.title.weight(.regular))
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
