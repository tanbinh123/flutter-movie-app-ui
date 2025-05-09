import 'package:flutter/material.dart';
import 'package:movie/service/serverMethod.dart';
import './MovieListComponent.dart';
import '../model/MovieDetailModel.dart';
/*-----------------------获取推荐的影片------------------------*/
class RecommendComponent extends StatelessWidget {
  final String classify;
  final String direction;
  final String title;
  const RecommendComponent({Key key,this.classify,this.direction,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRecommendSerivce(classify),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container();
          }else{
            List<MovieDetailModel> movieList = (snapshot.data["data"] as List).cast().map((item){
                return MovieDetailModel.fromJson(item);
            }).toList();
            return MovieListComponent(movieList: movieList,title: title,direction: direction,);
          }
        });
  }
}
/*-----------------------获取推荐的影片------------------------*/
