import 'package:get_it/get_it.dart';
import 'package:weather_app_clean_code/src/weather/data/dataSource/locale/weatherLocaleDataSource.dart';
import 'package:weather_app_clean_code/src/weather/data/dataSource/remote/WeatherRemoteDataSource.dart';
import 'package:weather_app_clean_code/src/weather/data/repository/weatherRepository.dart';
import 'package:weather_app_clean_code/src/weather/domain/repository/baseWeatherRepository.dart';
import 'package:weather_app_clean_code/src/weather/domain/useCase/getDataWeatherWithLanLatUseCase.dart';
import 'package:weather_app_clean_code/src/weather/domain/useCase/getPermissionLocation.dart';
import 'package:weather_app_clean_code/src/weather/domain/useCase/getPositionLongLateUseCase.dart';
import 'package:weather_app_clean_code/src/weather/presentation/controller/bloc/weather_bloc.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerLazySingleton<BaseLocaleDataSource>(() => LocaleDataSource());
    getIt.registerLazySingleton<BaseWeatherRemoteDataSource>(() => WeatherRemoteDataSource());

    getIt.registerLazySingleton<BaseWeatherRepository>(() => WeatherRepository(getIt(), getIt()));
    getIt.registerLazySingleton(() => GetDataWeatherWithLanLatUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPositionLongLateUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPermissionLocationUseCase(getIt()));
    getIt.registerLazySingleton(() => WeatherBloc(
        getDataWeatherWithLanLatUseCase: getIt(),
        getPositionLongLateUseCase: getIt(),
        getPermissionLocationUseCase: getIt()));
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
