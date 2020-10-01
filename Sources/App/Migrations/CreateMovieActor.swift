//
//  File.swift
//  
//
//  Created by Hoang Trong Kien on 8/31/20.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateMovieActor: Migration {
  
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    database.schema("movie_actors") // table name
      .id()
      .field("movie_id", .uuid, .required, .references("movies", "id"))  // column name
      .field("actor_id", .uuid, .required, .references("actors", "id"))
      .create()
  }
  
  // undo
  func revert(on database: Database) -> EventLoopFuture<Void> {
    database.schema("movie_actors").delete() // drop the table
  }
}
