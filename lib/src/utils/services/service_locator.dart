import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    /*  getIt.registerLazySingleton(() => SearchBloc(getIt()));
    getIt.registerLazySingleton(() => GetSearchDataUseCase(getIt()));
    getIt.registerLazySingleton<BaseSearchRepository>(() => SearchRepository(getIt()));
    getIt.registerLazySingleton<BaseSearchRemoteDataSource>(() => SearchRemoteDataSource());
    /////////////////////////////////////////////////////////////////////////////////////
    getIt.registerLazySingleton(() => MoviesBloc(getIt(), getIt(), getIt(), getIt()));
    getIt.registerLazySingleton(() => MovieDetailsBloc(getIt(), getIt()));
    getIt.registerLazySingleton(() => GetUpComingMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetRecommnditionMovieUseCase(getIt()));
    getIt.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(getIt()));
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

    ////////////////////////////// Tv/ ////////////////////////////////////////////////////
    getIt.registerLazySingleton(() => TvBloc(getIt(), getIt(), getIt(), getIt(), getIt(), getIt()));
    getIt.registerLazySingleton(() => GetTvOnTheAirUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTvPopularUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTvTopRatedUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTvDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetRecommnditionUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTVSessionDetailsUseCase(getIt()));
    getIt.registerLazySingleton<BaseTvRepository>(() => TvRepositry(getIt()));
    getIt.registerLazySingleton<BaseTvRemoteDataSource>(() => TvRemoteDataSource());*/
  }
}
