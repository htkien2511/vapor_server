//
//  File.swift
//  
//
//  Created by Hoang Trong Kien on 8/31/20.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateActor: Migration {
  
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    database.schema("actors") // table name
      .id()
      .field("name", .string)  // column name
      .create()
  }
  
  // undo
  func revert(on database: Database) -> EventLoopFuture<Void> {
    database.schema("actors").delete() // drop the table
  }
}
