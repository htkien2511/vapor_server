//
//  File.swift
//  
//
//  Created by Hoang Trong Kien on 8/31/20.
//

import Foundation
import Fluent
import Vapor

final class MovieActor: Model {
  
  static let schema = "movie_actors"  // table name
  
  @ID(key: .id)
  var id: UUID?
  
  @Parent(key: "movie_id")
  var movie: Movie
  
  @Parent(key: "actor_id")
  var actor: Actor
  
  init() {}
  
  init(movieId: UUID, actorId: UUID) {
    self.$movie.id = movieId
    self.$actor.id = actorId
  }
}

