//
//  File.swift
//  
//
//  Created by Hoang Trong Kien on 9/26/20.
//

import Foundation
import Vapor

final class MoviesController {
  
  func create(_ req: Request) throws -> EventLoopFuture<Movie> {
    let movie = try req.content.decode(Movie.self)
    return movie.create(on: req.db).map { movie }
  }
  
  func all(_ req: Request) throws -> EventLoopFuture<[Movie]> {
    Movie.query(on: req.db).all()
  }
}
