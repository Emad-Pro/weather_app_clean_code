import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:weather_app_clean_code/src/utils/services/service_locator.dart';

import 'package:weather_app_clean_code/src/weather/presentation/controller/bloc/weather_bloc.dart';

Widget getWeatherData() => BlocProvider(
      create: ((context) {
        return getIt<WeatherBloc>()..add(GetPositionLongLatEvent());
      }),
      child: BlocConsumer<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return ConditionalBuilder(
                condition: state.positionLateLong != null,
                builder: (context) {
                  return weatherContent(
                      late: state.positionLateLong!.latitude,
                      long: state.positionLateLong!.longitude);
                },
                fallback: (contex) {
                  return Center(
                    child: SafeArea(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 12,
                        ),
                        Text("يتم تحميل معلومات الموقع برجاء الانتظار"),
                      ],
                    )),
                  );
                });
          },
          listener: (context, state) {}),
    );

Widget weatherContent({required double late, required double long}) => BlocProvider(
      create: (context) => getIt<WeatherBloc>()
        ..add(GetDataWeatherWithLanLatEvent(late: late, long: long))
        ..add(GetWeatherForCastEvent(long: long, late: late)),
      child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
              condition: state.weatherData != null && state.weatherForCastData != null,
              builder: (context) {
                final weather = state.weatherData;
                return SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipPath(
                          clipper: OvalBottomBorderClipper(),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            color: Colors.indigo,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${weather!.cityName}, ${weather.sys.country.toLowerCase()}",
                                          style: GoogleFonts.lato(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          DateFormat("EEE, d LLL").format(DateTime.now()),
                                          style: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        icon: const Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {})
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                                  child: Column(children: [
                                    Transform.scale(
                                      scale: 1.6,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (weather.main.temp - 273).toStringAsFixed(1),
                                          style: GoogleFonts.lato(
                                            fontSize: 65,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "°C",
                                          style: GoogleFonts.lato(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      weather.description.description.toUpperCase(),
                                      style: GoogleFonts.lato(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Feels like ${(weather.main.feelsLike - 273).toStringAsFixed(1)}°C",
                                      style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.indigo,
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.white),
                                          padding: const EdgeInsets.all(10.0),
                                          child: const Icon(
                                            Ionicons.eye,
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text("Visibility",
                                            style: GoogleFonts.lato(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text(
                                          "${weather.visibility.toStringAsFixed(0)} km",
                                          style: GoogleFonts.lato(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.indigo,
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.white),
                                          padding: const EdgeInsets.all(10.0),
                                          child: const Icon(
                                            Ionicons.water,
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text("Humidity",
                                            style: GoogleFonts.lato(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text(
                                          "${weather.main.humidity}%",
                                          style: GoogleFonts.lato(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.indigo,
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.white),
                                          padding: const EdgeInsets.all(10.0),
                                          child: const Icon(
                                            Icons.wind_power,
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text("Wind Speed",
                                            style: GoogleFonts.lato(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text(
                                          "${weather.wind.speed.floor()} km/hr",
                                          style: GoogleFonts.lato(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                        ClipPath(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(color: Colors.indigo),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "More Weather Data".toUpperCase(),
                              style: GoogleFonts.alumniSans(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.weatherForCastData!.weatherForCast.length,
                              itemBuilder: (context, index) {
                                final list = state.weatherForCastData!.weatherForCast[index];
                                return Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30),
                                                color: Colors.indigo,
                                              ),
                                              padding: const EdgeInsets.all(15),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(3.0),
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(50),
                                                            color: Colors.white),
                                                        padding: const EdgeInsets.all(10.0),
                                                        child: Text(DateFormat("yyyy-MM-dd hh:mm")
                                                            .format(DateTime.parse(list.dtTxt)))),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(3.0),
                                                    child:
                                                        Text(list.weather.description.toUpperCase(),
                                                            style: GoogleFonts.lato(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white,
                                                            )),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.all(3.0),
                                                      child: Image(
                                                          width: 70,
                                                          height: 70,
                                                          image: NetworkImage(
                                                              'http://openweathermap.org/img/wn/${list.weather.icon}.png',
                                                              scale: 0.1))),
                                                  Padding(
                                                      padding: const EdgeInsets.all(3.0),
                                                      child: Row(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              const Icon(
                                                                Icons.wind_power,
                                                                color: Colors.green,
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                '${list.wind.speed.toStringAsFixed(0)} /km',
                                                                style: const TextStyle(
                                                                  color: Colors.white,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Column(
                                                            children: [
                                                              const Icon(
                                                                Icons.water_drop_outlined,
                                                                color: Colors.white,
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  '${list.main.humidity.toStringAsFixed(0)} %',
                                                                  style: const TextStyle(
                                                                    color: Colors.white,
                                                                  ))
                                                            ],
                                                          )
                                                        ],
                                                      )),
                                                  Padding(
                                                    padding: const EdgeInsets.all(3.0),
                                                    child: Text(
                                                      "${(list.main.temp - 273).toStringAsFixed(1)} °C",
                                                      style: GoogleFonts.lato(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ))
                                        ]));
                              }),
                        )
                      ],
                    ),
                  ),
                );
              },
              fallback: (context) {
                return const Center(child: CircularProgressIndicator());
              });
        },
      ),
    );
