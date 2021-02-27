import 'package:flutter/material.dart';
import 'package:movies_application/core/constants/ui/color_constants.dart';

import 'package:movies_application/core/constants/url/url_constants.dart';
import 'package:movies_application/core/models/movie_models/movies_models/movie_model.dart';
import 'package:movies_application/core/services/movies_service/movies_service.dart';
import 'package:movies_application/ui/widgets/components/center_Text_widget.dart';
import 'package:movies_application/ui/widgets/components/center_circular_progress_widget.dart';
import 'package:movies_application/ui/widgets/components/text_component.dart';

class MovieDetail extends StatefulWidget {
  final MovieModel movieInfo;
  const MovieDetail({Key key, @required this.movieInfo}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  Future<List<MovieModel>> movie;

  MoviesServices moviesServices = MoviesServices();
  @override
  void initState() {
    super.initState();
    movie = moviesServices.movieService();
  }
                                                                                              
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double yourWidth = width * 0.40;
    double yourHeight = height * 0.40;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movieInfo.movie_name),
      ),
      body: Container(
        child: FutureBuilder(
          future: movie,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CenterCircularProgressIndicator();

              case ConnectionState.active:
                return CenterCircularProgressIndicator();

              case ConnectionState.none:
                return CenterText(text: "Bağlantı Hatası ");

              case ConnectionState.done:
                if (snapshot.hasData) {
                  //BURADA KALDIIIIIIIIIIIIIIIIN BURDAN DEVAM ET
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: yourHeight,
                            child: buildImage(snapshot, widget.movieInfo)),
                        PaddingText(
                            text: widget.movieInfo.movie_name,
                            color: ColorConstants.instance.pickledBluewood),
                        PaddingText(
                            text: widget.movieInfo.director.director_name,
                            color: ColorConstants.instance.pickledBluewood),
                        PaddingText(
                            text: widget.movieInfo.category.category_name,
                            color: ColorConstants.instance.pickledBluewood),
                        PaddingText(
                            text: widget.movieInfo.movie_year,
                            color: ColorConstants.instance.pickledBluewood),
                      ],
                    ),
                  );
                } else {
                  return CenterText(text: "Veri Yok");
                }
            }
          },
        ),
      ),
    );
  }

  Image buildImage(AsyncSnapshot snapshot, MovieModel movieInfo) {
    return Image.network(
      UrlConstants.IMAGE_URL + movieInfo.movie_image,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return CenterCircularProgressIndicator();
        }
      },
    );
  }
}
