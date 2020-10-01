import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) throws {
  // uncomment to serve files from /Public folder
  // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
  
  app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "", database: "moviesdb"), as: .psql)
  
  app.migrations.add(CreateMovies())
  app.migrations.add(CreateReviews())
  app.migrations.add(CreateActor())
  app.migrations.add(CreateMovieActor())
  app.migrations.add(AddPosterColumnToMovies())
  
  // register routes
  try routes(app)
}
