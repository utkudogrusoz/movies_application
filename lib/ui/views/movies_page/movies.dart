import 'package:flutter/material.dart';

import 'package:movies_application/core/models/movie_models/categories_model/category_model.dart';
import 'package:movies_application/core/models/movie_models/movies_models/movie_model.dart';
import 'package:movies_application/core/services/movies_service/movies_by_categories_services.dart';
import 'package:movies_application/ui/widgets/cards/movies_card.dart';
import 'package:movies_application/ui/widgets/components/center_Text_widget.dart';
import 'package:movies_application/ui/widgets/components/center_circular_progress_widget.dart';

class MoviesList extends StatefulWidget {
  final CategoryModel category;

  const MoviesList({Key key, this.category}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  FilmByCategoryService filmByCategoryService = FilmByCategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kategori: ${widget.category.category_name}")),
      body: Center(
        child: FutureBuilder<List<MovieModel>>(
          future: filmByCategoryService
              .filmByCategoryService(int.parse(widget.category.category_id)),
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
                  return buildGridView(snapshot);
                } else {
                  return CenterText(text: "Veri Yok");
                }
            }
          },
        ),
      ),
    );
  }

  GridView buildGridView(AsyncSnapshot<List<MovieModel>> snapshot) {
    return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return MoviesCard(snapshot: snapshot, index: index);
                    });
  }
}

