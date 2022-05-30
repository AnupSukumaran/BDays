//
//  Network.swift
//  GraphQL_Tut
//
//  Created by Sukumar Anup Sukumaran on 29/05/2022.
//

import Foundation
import Apollo

enum Results<T> {
    case success(T)
    case failure(errorStr: String, model:T? = nil)
}

class Network {
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://birthday-api.hasura.app/v1/graphql")!)
    
    func callBirthdaysAPI(comp: @escaping (Results<[BirthdaysQuery.Data.Person]>) -> ()) {
        Network.shared.apollo.fetch(query: BirthdaysQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                comp(.success(graphQLResult.data?.person ?? []))
                
                
            case .failure(let error):
                comp(.failure(errorStr: error.localizedDescription))
            }
        }
    }
    
}
