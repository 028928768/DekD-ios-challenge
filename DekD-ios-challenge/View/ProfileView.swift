//
//  ProfileView.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 9/1/2567 BE.
//

import SwiftUI
import Mixpanel

struct ProfileView: View {
    var body: some View {

        List {
            // Event1: Sign up
            Button("Sign up") {
                let username = "Simon_UK123"
                let properties: [String: MixpanelType] = ["$first_name": "Simon",
                                                          "$last_name": "Siwell",
                                                          "$name": "Simon Siwell",
                                                          "$email": "SimonSiwell@UK.com",
                                                          "username": username,
                                                          "address": "White Chapel, LN1 1RS, London, UK",
                                                          "account_type": "admin"]
                Mixpanel.mainInstance().identify(distinctId: username)
                Mixpanel.mainInstance().track(event: "Sign up", properties: properties)
                print("Sign up a new user!")
            }
            
            // Event2: Sign in
            Button("Sign in") {
                let properties: [String: MixpanelType] = ["$email": "SimonSiwell@UK.com",
                                                          "last_signedin_date": Date.now]
                Mixpanel.mainInstance().track(event: "Sign in", properties: properties)
                print("Sign in!")
            }
            
            // Event3: Novel viewed
            Button("View Novel") {
                let properties: [String: MixpanelType] = ["novel_id": "hp12JKRW",
                                                          "novel_title": "Harry Potter and the chamber of secret",
                                                          "novel_view_date_time": Date.now]
                Mixpanel.mainInstance().track(event: "Novel Viewed", properties: properties)
                print("Novel Viewed!")
            }
            
            // Event4: Write comment
            Button("Write comment") {
                let properties: [String: MixpanelType] = ["novel_id": "hp12JKRW",
                                                          "message_id": "ms_1nsadkg_bkk",
                                                          "message_desription": "This book dives deeper into Hogwart legacy lore where the secret of Slytheryn house is revealed after century og misery",
                                                          "message_like_number": 120,
                                                          "last_message_update_time": Date.now ]
                
                Mixpanel.mainInstance().track(event: "Comment Written", properties: properties)
                print("Comment writen!")
            }
            
            // Event5: Purchase novel
            Button("Purchase novel") {
                let properties: [String: MixpanelType] = ["novel_id": "hp12JKRW",
                                                          "novel_type": "Sci-fi, Fantasy",
                                                          "novel_purchased_amount": 2,
                                                          "novel_purchased_date_time": Date.now,
                                                          "user_request": "Purchase along with boxset! deliver with care Thank you!"]
                
                Mixpanel.mainInstance().track(event: "Novel Purchased", properties: properties)
                print("purchase novel!")
            }
            
            // Event6:
            Button("Comment Viewed") {
                let properties: [String: MixpanelType] = ["message_id":"ms_1nsadkg_bkk",
                                                          "comment_viewed_date_time": Date.now]
                Mixpanel.mainInstance().track(event: "Comment Viewed", properties: properties)
                print("comment viewed!")
            }
            
            // Event7:
            Button("Comment Liked") {
                let properties: [String: MixpanelType] = ["message_id":"ms_1nsadkg_bkk",
                                                          "comment_liked_date_time": Date.now]
                
                Mixpanel.mainInstance().track(event: "Comment Liked", properties: properties)
                print("comment liked!")
            }
            
            // Event8:
            Button("Add Novel To Cart") {
                let properties: [String: MixpanelType] = ["novel_id": "hp12JKRW",
                                                          "added_to-cart_date_time": Date.now]
                Mixpanel.mainInstance().track(event: "Novel Added To Cart", properties: properties)
                print("add novel to cart sucessfully!")
            }
            
            // Event9:
            Button("Novel List Filtered") {
                let properties: [String: MixpanelType] = ["sorted_type": "Aesc",
                                                          "sorted_date_time": Date.now]
                
                Mixpanel.mainInstance().track(event: "Novel List Filtered", properties: properties)
                print("use filter on novel list!")
            }
            
            // Event10:
            Button("Logout") {
                let properties: [String: MixpanelType] = ["$email": "SimonSiwell@UK.com",
                                                          "logout_session_time": Date.now]
                
                Mixpanel.mainInstance().track(event: "Logout", properties: properties)
                print("logout!")
            }
            
        }
    }
}

#Preview {
    ProfileView()
}
