import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/home_screen.dart';

class SearchPlaceScreen extends StatefulWidget {
  const SearchPlaceScreen({Key? key}) : super(key: key);

  @override
  State<SearchPlaceScreen> createState() => _SearchPlaceScreenState();
}

class _SearchPlaceScreenState extends State<SearchPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              showSearch(context: context, delegate: CitySearch());
            },
          )
        ],
        backgroundColor: Colors.purple),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start),
        ),
      ),
    );
  }
}

class CitySearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, "");
            } else {
              query = '';
              showSuggestions(context);
            }
          },
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, ""),
      );

  @override
  Widget buildResults(BuildContext context) => FutureBuilder<CurrentWeather>(
        future: Get.find<WeatherController>().getWeatherData(query),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Container(
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Text(
                    'Something went wrong!',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                );
              } else {
                return Scaffold(
                  body: Stack(
                    children: [
                      HomeScreen(),
                      Positioned(
                        bottom: -20,
                        child: Text("Save"),
                      )
                    ],
                  ),
                );
              }
          }
        },
      );

  @override
  Widget buildSuggestions(BuildContext context) => Container(
        color: Colors.black,
        child: FutureBuilder<List<String>>(
          future: Get.find<WeatherController>().searchCities(query),
          builder: (context, snapshot) {
            if (query.isEmpty) return buildNoSuggestions();
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError || snapshot.data!.isEmpty) {
                  return buildNoSuggestions();
                } else {
                  return buildSuggestionsSuccess(snapshot.data!);
                }
            }
          },
        ),
      );

  Widget buildNoSuggestions() => const Center(
        child: Text(
          'No suggestions!',
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      );

  Widget buildSuggestionsSuccess(List<String> suggestions) => ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          final queryText = suggestion.substring(0, query.length);
          final remainingText = suggestion.substring(query.length);

          return ListTile(
            onTap: () {
              query = suggestion;

              // 1. Show Results
              showResults(context);

              // 2. Close Search & Return Result
              // close(context, suggestion);

              // 3. Navigate to Result Page
              //  Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => ResultPage(suggestion),
              //   ),
              // );
            },
            leading: Icon(Icons.location_city),
            // title: Text(suggestion),
            title: RichText(
              text: TextSpan(
                text: queryText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: remainingText,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
