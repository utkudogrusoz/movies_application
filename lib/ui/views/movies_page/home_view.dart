import 'package:flutter/material.dart';

import 'package:movies_application/core/constants/ui/color_constants.dart';
import 'package:movies_application/core/constants/ui/padding_constants.dart';
import 'package:movies_application/core/constants/url/url_constants.dart';

import 'package:movies_application/core/models/movie_models/categories_model/category_model.dart';

import 'package:movies_application/core/models/movie_models/movies_models/movie_model.dart';
import 'package:movies_application/core/services/movies_service/categories_service.dart';
import 'package:movies_application/core/services/movies_service/movies_service.dart';
import 'package:movies_application/ui/widgets/cards/categories_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<CategoryModel>> category;
  CategoriesService get categoriesService {
    return CategoriesService();
  }

  @override
  void initState() {
    super.initState();
    category = categoriesService.categoriesService();
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double yourHeight = height * 0.10;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.instance.indianKhaki,
        title: Text(
          'Kategoriler',
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: ColorConstants.instance.pickledBluewood),
        ),
      ),
      body: Padding(
        padding: PaddingConstants.instance.padding16,
        child: buildFutureBuilder(yourHeight),
      ),
    );
  }

  FutureBuilder<List<CategoryModel>> buildFutureBuilder(double yourHeight) {
    return FutureBuilder<List<CategoryModel>>(
        future: category,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: yourHeight,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return CategoriesCard(
                            index: index, snapshot: snapshot);
                      }),
                ),
              ],
            );
          } else {
            return buildCenterCircular();
          }
        },
      );
  }

  Center buildCenterCircular() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
