//
//  Apollo.swift
//  GraphQL_Tut
//
//  Created by Sukumar Anup Sukumaran on 29/05/2022.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://birthday-api.hasura.app/v1/graphql")!)
}
