import Vapor

func routes(_ app: Application) throws {
  
  let moviesController = MoviesController()
  let reviewsController = ReviewsController()
  
  // http://127.0.0.1:8080/movies POST
  app.post("movies", use: moviesController.create)
  
  // http://127.0.0.1:8080/movies GET
  app.get("movies", use: moviesController.all)
  
  // http://127.0.0.1:8080/movies/:movieId DELETE
  app.delete("movies", ":movieId", use: moviesController.delete)
  
  // http://127.0.0.1:8080/reviews POST
  app.post("reviews", use: reviewsController.create)
  
  // http://127.0.0.1:8080/movies/:movieId/reviews GET
  app.get("movies", ":movieId", "reviews", use: reviewsController.getByMovieId)
}
