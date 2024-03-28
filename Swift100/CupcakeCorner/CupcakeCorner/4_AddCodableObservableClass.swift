//
//  5_AddCodableObservableClass.swift
//  CupcakeCorner
//
//  Created by liqiang on 2024/3/28.
//

import SwiftUI

/**
 
 @ObservationIgnored private let _$observationRegistrar = Observation.ObservationRegistrar()

 internal nonisolated func access<Member>(
     keyPath: KeyPath<User, Member>
 ) {
   _$observationRegistrar.access(self, keyPath: keyPath)
 }

 internal nonisolated func withMutation<Member, MutationResult>(
   keyPath: KeyPath<User, Member>,
   _ mutation: () throws -> MutationResult
 ) rethrows -> MutationResult {
   try _$observationRegistrar.withMutation(of: self, keyPath: keyPath, mutation)
 }
 
 */

@Observable
class Users:Codable {
    enum  CodingKeys:String,CodingKey {
        case _name = "name"
    }
    var name = "Taylor"
}
struct AddCodableObservableClass: View {
    var body: some View {
        Button("Encode Taylor",action: encodeTaylor)
    }
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(Users())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    AddCodableObservableClass()
}
