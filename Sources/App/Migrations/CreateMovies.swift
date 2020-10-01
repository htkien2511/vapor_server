//
//  File.swift
//  
//
//  Created by Hoang Trong Kien on 8/26/20.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateMovies: Migration {
  
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    database.schema("movies") // table name
      .id()
      .field("title", .string)  // column name
      .create()
  }
  
  // undo
  func revert(on database: Database) -> EventLoopFuture<Void> {
    database.schema("movies").delete() // drop the table
  }
}
