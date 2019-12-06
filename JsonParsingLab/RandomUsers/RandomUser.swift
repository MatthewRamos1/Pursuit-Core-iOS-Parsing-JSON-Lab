//
//  RandomUser.swift
//  JsonParsingLab
//
//  Created by Matthew Ramos on 12/6/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import Foundation

struct RandomUserData: Decodable {
    let results: [RandomUser]
}

struct RandomUser: Decodable {
    let name: Name
    let email: String
    let location: Location
    let phone: String
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Location: Decodable {
    let street: Street
    let city: String
    let state: String
    let country: String
}

struct Street: Decodable {
    let number: Int
    let name: String
}

extension RandomUserData {
    static func getUsers(data: Data) -> [RandomUser] {
        var randomUsers = [RandomUser]()
        do {
            let randomUserData = try JSONDecoder().decode(RandomUserData.self, from: data)
            randomUsers = randomUserData.results
        } catch {
            fatalError("Can't parse data \(error)")
        }
        return randomUsers
}
}
