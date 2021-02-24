import 'package:flutter/material.dart';
import 'package:movies_application/core/constants/ui/border_constants.dart';

import 'package:movies_application/core/constants/ui/color_constants.dart';
import 'package:movies_application/core/constants/ui/padding_constants.dart';
import 'package:movies_application/core/models/movie_models/categories_model/category_model.dart';
import 'package:movies_application/ui/views/movies_page/movies.dart';

class CategoriesCard extends StatefulWidget {
  final int index;
  final AsyncSnapshot<List<CategoryModel>> snapshot;

  const CategoriesCard({Key key, @required this.index, @required this.snapshot})
      : super(key: key);
  @override
  _CategoriesCardState createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    double yourWidth = width * 0.40;
    double yourHeight = height * 0.10;
    return GestureDetector(onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MoviesList(
                      category: widget.snapshot.data[widget.index],
                    )));
      },
          child: Card(
      shape: BorderConstants.instance.border16,
      color: ColorConstants.instance.tusk,
      margin: PaddingConstants.instance.padding16,
      child: buildCategories(widget.snapshot, widget.index, context)),
    );
  }

  Padding buildCategories(AsyncSnapshot<List<CategoryModel>> snapshot,
      int index, BuildContext context) {
    return buildTextTitle(snapshot, index, context);                            
  }

  Padding buildTextTitle(AsyncSnapshot<List<CategoryModel>> snapshot, int index,
      BuildContext context) {
    return Padding(
      padding: PaddingConstants.instance.padding8,
      child: Center(
        child: Text(
          snapshot.data[index].category_name,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: ColorConstants.instance.aquaDeep),
        ),
      ),
    );
  }

  
}

/* Text buildTextTitle(AsyncSnapshot<List<CategoryModel>> snapshot, int index,
      BuildContext context) {
    return Text(
      snapshot.data[index].category_name,
      style: Theme.of(context)
          .textTheme
          .headline6
          .copyWith(color: ColorConstants.instance.aquaDeep),
    );
  } */


  /* ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MoviesList(
                      category: snapshot.data[index],
                    )));
      },
      title: buildTextTitle(snapshot, index, context),
    ); */