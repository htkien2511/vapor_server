import Vapor

func routes(_ app: Application) throws {
  
  let moviesController = MoviesController()
  
  // http://127.0.0.1:8080/movies POST
  app.post("movies", use: moviesController.create)
  
  // http://127.0.0.1:8080/movies GET
  app.get("movies", use: moviesController.all)
}
