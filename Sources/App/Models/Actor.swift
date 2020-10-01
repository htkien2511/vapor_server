//
//  File.swift
//  
//
//  Created by Hoang Trong Kien on 8/31/20.
//

import Foundation
import Fluent
import Vapor

final class Actor: Model, Content {
  
  static let schema = "actors"  // table name
  
  @ID(key: .id)
  var id: UUID?
  
  @Field(key: "name")
  var name: String
  
  @Siblings(through: MovieActor.self, from: \.$actor, to: \.$movie)
  var movies: [Movie]
  
  init() {}
  
  init(id: UUID? = nil, name: String) {
    self.id = id
    self.name = name
  }
}
