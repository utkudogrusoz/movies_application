import 'package:flutter/material.dart';
import 'package:movies_application/core/constants/ui/padding_constants.dart';
import 'package:movies_application/core/constants/url/url_constants.dart';
import 'package:movies_application/core/models/movie_models/movies_models/movie_model.dart';
import 'package:movies_application/ui/views/movies_page/movie_detail.dart';
import 'package:movies_application/ui/widgets/components/center_circular_progress_widget.dart';

class MoviesCard extends StatefulWidget {
  final AsyncSnapshot<List<MovieModel>> snapshot;
  final int index;

  const MoviesCard({Key key, @required this.snapshot, @required this.index})
      : super(key: key);

  @override
  _MoviesCardState createState() => _MoviesCardState();
}

class _MoviesCardState extends State<MoviesCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetail(
                      movieInfo: widget.snapshot.data[widget.index],
                    )));
      },
      child: buildCardMovies(widget.snapshot, widget.index),
    );
  }

  Container buildCardMovies(
      AsyncSnapshot<List<MovieModel>> snapshot, int index) {
    return Container(
      padding: PaddingConstants.instance.padding8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: Container(
              child: buildImage(snapshot, index),
            ),
          ),
          Expanded(flex: 1, child: Text(snapshot.data[index].movie_name))
        ],
      ),
    );
  }

  Image buildImage(AsyncSnapshot<List<MovieModel>> snapshot, int index) {
    return Image.network(
              UrlConstants.IMAGE_URL +
                  snapshot.data[index].movie_image,
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
