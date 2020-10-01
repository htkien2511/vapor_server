//
//  File.swift
//  
//
//  Created by Hoang Trong Kien on 8/31/20.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateReviews: Migration {
  
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    database.schema("reviews") // table name
      .id()
      .field("title", .string)  // column name
      .field("body", .string)
      .field("movie_id", .uuid, .references("movies", "id"))
      .create()
  }
  
  // undo
  func revert(on database: Database) -> EventLoopFuture<Void> {
    database.schema("reviews").delete() // drop the table
  }
}
