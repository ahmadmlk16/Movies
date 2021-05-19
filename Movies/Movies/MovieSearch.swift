//
//  MovieSearch.swift
//  Movies
//
//  Created by CS3714 on 4/19/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import SwiftUI
 
struct MovieSearch: View {
   
    @State private var searchFieldValue = ""
    @State private var searchFieldEmpty = false
    @State private var searchCompleted = false
   
    var body: some View {
        NavigationView {
            Form {
                Section(header:
                    Text("Enter movie title to search")
                        .padding(.top, 100)   // Put padding here to preserve form's background color
                ) {
                    HStack {
                        TextField("Enter movie title to search", text: $searchFieldValue)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            /*
                             Keyboard Types: .decimalPad, .default, .emailAddress,
                             .namePhonePad, .numberPad, .numbersAndPunctuation
                            */
                            .keyboardType(.default)
 
                            // Options: .allCharacters, .none, .sentences, .words
                            .autocapitalization(.allCharacters)
 
                            // Turn off auto correction
                            .disableAutocorrection(true)
                       
                        Button(action: {
                            self.searchFieldValue = ""
                            self.searchFieldEmpty = false
                            self.searchCompleted = false
                        }) {
                            Image(systemName: "multiply.circle")
                                .imageScale(.medium)
                                .font(Font.title.weight(.regular))
                        }
                    }   // End of HStack
                    .alert(isPresented: $searchFieldEmpty, content: { self.emptyAlert })
                }
                Section(header: Text("Search Movies")) {
                    HStack {
                        Button(action: {
                            // Remove spaces, if any, at the beginning and at the end of the entered search query string
                            let queryTrimmed = self.searchFieldValue.trimmingCharacters(in: .whitespacesAndNewlines)
                           
                            if (queryTrimmed.isEmpty) {
                                self.searchFieldEmpty = true
                            } else {
                                self.searchApi()
                                self.searchCompleted = true
                            }
                        }) {
                            Text(self.searchCompleted ? "Search Completed" : "Search")
                        }
                        .frame(width: UIScreen.main.bounds.width - 40, height: 36, alignment: .center)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(Color.black, lineWidth: 1)
                        )
                    }   // End of HStack
                }
                if searchCompleted {
                    Section(header: Text("List Movies Found")) {
                        NavigationLink(destination: showSearchResults) {
                            Image(systemName: "list.bullet")
                                .imageScale(.medium)
                                .font(Font.title.weight(.regular))
                        }
                    }
                }
 
            }   // End of Form
            .navigationBarTitle(Text("Search a Movies"), displayMode: .inline)
          
        }   // End of NavigationView
    }   // End of body
   
    func searchApi() {
 
        // public func obtainCompanyDataFromApi is given in CompanyDataFromApi.swift
        let search = self.searchFieldValue.replacingOccurrences(of: " ", with: "+")
      
        searchMovies(apiQueryUrl: search)
    }
   
    var showSearchResults: some View {
       
       
        if (searchMoviesList.count == 0) {
            return AnyView(notFoundMessage)
        }
 
        return AnyView(MoviesSearched())
    }
   
    var emptyAlert: Alert {
        Alert(title: Text("Search Field is Empty!"),
           message: Text("Please enter a movie title to search for!"),
           dismissButton: .default(Text("OK")))
    }
 
    var notFoundMessage: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .imageScale(.large)
                .font(Font.title.weight(.medium))
                .foregroundColor(.red)
            Text("No Data Returned from API!")
                .font(.body)    // Needed for the text to wrap around
                .multilineTextAlignment(.center)
            Text("No movie found for the movie title you entered!")
            .font(.body)    // Needed for the text to wrap around
            .multilineTextAlignment(.center)
        }
    }
   
}
 
struct MovieSearch_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearch()
    }
}
