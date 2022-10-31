import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:jenzinema/app/config.dart';
import 'package:jenzinema/common/models/movie.dart';
import 'package:jenzinema/source/remote/models/movies_data_response.dart';

void main() async {
  await setUpTestHive();
  Hive.registerAdapter(MovieAdapter());

  var testPageRaw = {
    "page": 1,
    "results": [
      {
        "adult": false,
        "backdrop_path": "/aTovumsNlDjof7YVoU5nW2RHaYn.jpg",
        "genre_ids": [27, 53, 10749],
        "id": 616820,
        "original_language": "en",
        "original_title": "Halloween Ends",
        "overview":
            "Four years after the events of Halloween in 2018, Laurie has decided to liberate herself from fear and rage and embrace life. But when a young man is accused of killing a boy he was babysitting, it ignites a cascade of violence and terror that will force Laurie to finally confront the evil she can’t control, once and for all.",
        "popularity": 3931.896,
        "poster_path": "/3uDwqxbr0j34rJVJMOW6o8Upw5W.jpg",
        "release_date": "2022-10-12",
        "title": "Halloween Ends",
        "video": false,
        "vote_average": 6.8,
        "vote_count": 494
      },
      {
        "adult": false,
        "backdrop_path": "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
        "genre_ids": [28, 14, 12],
        "id": 436270,
        "original_language": "en",
        "original_title": "Black Adam",
        "overview":
            "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
        "popularity": 3666.165,
        "poster_path": "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
        "release_date": "2022-10-19",
        "title": "Black Adam",
        "video": false,
        "vote_average": 7.5,
        "vote_count": 187
      },
    ],
  };

  var page = MoviesDataResponse.fromJson(testPageRaw);
  test("Writing page to db", () async {
    var box = await Hive.openBox<List<Movie>>(Config.dbPages);
    box.put(page.page, page.movies);
    expect(box.length, 1);
  });

  test("Fetching page from db", () async {
    var box = await Hive.openBox<List<Movie>>(Config.dbPages);
    box.put(page.page, page.movies);
    var retrievedPageByNumber = box.get(page.page);
    expect(retrievedPageByNumber?.length, page.movies.length);
  });

  await tearDownTestHive();
}
