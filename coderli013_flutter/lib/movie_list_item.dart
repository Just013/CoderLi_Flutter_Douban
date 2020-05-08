import 'package:coderli013_flutter/model/movieModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieListItem extends StatelessWidget {
  final Subject model;

  //构造方法
  MovieListItem({Key key, this.model});
  //Button的点击事件
//  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child: MovieListItemCell(model: this.model));
  }
}

class MovieListItemCell extends StatelessWidget {
  final Subject model;

  const MovieListItemCell({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
//      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //子组件在主轴的排列方式为两端对齐
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  Image.network(
                    '${model.images.small}',
                    height: 90,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(0)),
                      child: Text('${model.rating.average}',
                          style: TextStyle(
                              fontSize: 9,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              )),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: new EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${model.title}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('  (${model.year})',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                        ],
                      ),
                      Text('${model.durations[0]}',
                          style: TextStyle(fontSize: 10))
                    ],
                  ),
                ),
                Container(
                  padding: new EdgeInsets.only(left: 8.0),
                  child: Text('${model.originalTitle}'),
                ),
                Container(
                  padding: new EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: dealGenres(model.genres)),
                      Text('收藏数:${dealCount(model.collectCount)}',
                          style: TextStyle(
                              fontSize: 10, color: Colors.deepOrangeAccent))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String dealCount(num) {
    if (num < 1000) {
      return num.toString();
    } else if (num > 1000 && num < 10000) {
      return (num / 1000).toStringAsFixed(1) + 'k';
    } else if (num > 10000) {
      return (num / 10000).toStringAsFixed(1) + 'w';
    }
  }

  List<Widget> dealGenres(List<String> genres) {
    List<Widget> list = [];
    genres.forEach((value) {
      list.add(Container(
          margin: const EdgeInsets.only(right: 5),
          padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(3)),
//          color: Colors.blue,
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.white),
          )));
    });
    return list;
  }
}
