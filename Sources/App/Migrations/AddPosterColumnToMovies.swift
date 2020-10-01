//
//  File.swift
//  
//
//  Created by Hoang Trong Kien on 9/26/20.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct AddPosterColumnToMovies: Migration {
  
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    database.schema("movies")
      .field("poster", .string)
      .update()
  }
  
  func revert(on database: Database) -> EventLoopFuture<Void> {
    database.schema("movies")
      .deleteField("poster")
      .delete()
  }
}
