import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/constant/colors.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/router/router_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    //Get.find<WeatherController>().getWeatherData();
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Container(
        margin: const EdgeInsets.only(top: 20, right: 15, left: 15),
        child: RefreshIndicator(
          onRefresh: () async {
            await Get.find<WeatherController>().getCurrentWeatherData();
          },
          child: ListView(children: [
            GetBuilder<WeatherController>(builder: (controller) {
              int temp = controller.currentWeather?.main.temp.round() ?? 1;
              temp -= 273;
              print("temp: $temp");
              return (controller.isLoading)
                  ? Center(child: Container(child: CircularProgressIndicator()))
                  : Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              controller.currentWeather?.name ?? "empty",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteHelper.searchWeather);
                              },
                              child: const Icon(
                                Icons.menu,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 140,
                          width: 150,
                          child: Image.asset(
                            "asset/images/cloudy.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          controller.currentWeather?.weather[0].main ?? "empty",
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$temp°',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cloud, color: Colors.grey),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                                "${controller.currentWeather?.wind.speed} km/h"),
                            SizedBox(
                              width: 25,
                            ),
                            Icon(Icons.cloudy_snowing, color: Colors.grey),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                                "${controller.currentWeather?.main.humidity} %")
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TabBar(
                              indicatorColor: Colors.transparent,
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              controller: _tabController,
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              tabs: [
                                Tab(
                                  text: "Now, 22 Jun",
                                ),
                                Tab(
                                  text: "Sat, 23 Jun",
                                ),
                                Tab(
                                  text: "Sun, 24 Jun",
                                ),
                              ]),
                        ),
                        Container(
                            width: double.infinity,
                            height: 140,
                            child: TabBarView(
                                controller: _tabController,
                                children: [
                                  ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 3,
                                      itemBuilder: (context, index) =>
                                          Container(
                                            margin: EdgeInsets.only(right: 15),
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text("9.00 AM"),
                                                Image.asset(
                                                  "asset/images/cloudy.png",
                                                  width: 60,
                                                  height: 60,
                                                ),
                                                Text(
                                                  "30°",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          )),
                                  ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 3,
                                      itemBuilder: (context, index) =>
                                          Container(
                                            margin: EdgeInsets.only(right: 15),
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text("9.00 AM"),
                                                Image.asset(
                                                  "asset/images/cloudy.png",
                                                  width: 60,
                                                  height: 60,
                                                ),
                                                Text(
                                                  "30°",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          )),
                                  ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 3,
                                      itemBuilder: (context, index) =>
                                          Container(
                                            margin: EdgeInsets.only(right: 15),
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text("9.00 AM"),
                                                Image.asset(
                                                  "asset/images/cloudy.png",
                                                  width: 60,
                                                  height: 60,
                                                ),
                                                Text(
                                                  "30°",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          )),
                                ]))
                      ],
                    );
            }),
          ]),
        ),
      ),
    );
  }
}
