class ApiConstance {
  // for all i will not specified the category the same for the country
  // for the search i will use everything and specify the keywords
  // the user can enter anything and will eb pass the q parameter
  // look at this query "${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 25)))}"));
  // after clearing my head i will make the code better a t least i will add a use case and some ui to push jed babah
  static const String baseUrl = "https://newsapi.org/v2";
  static const String apiKey = "5b587be94a2c4070ac7eb4f6b375a8bb";
  static const String recommended =
      "$baseUrl/everything?q=recommended%20OR%20trending&sortBy=popularity&pageSize=10&apiKey=$apiKey";
  static const String breaking =
      "https://newsapi.org/v2/top-headlines?category=general&pageSize=10&apiKey=$apiKey";

  /// the top headlines filtered by country category and sources 3
  /// and the everyhing can filtered by the language keywords data and sorting 4
  /// the sort by can be with the recent and popularity
  ///
  ///
  /// jatni idee ta3 f search ndir hadou swala7 ta3 by popularity nad recent and country so on...
  ///
  /// i think the breaking news will be everything by pupularity
  ///
  /// and hte discover will be by the recent one
}
