

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/utils/MQSize.dart';

const List<String> titles = [
  "Flutter Swiper is awosome",
  "Really nice",
  "Yeap"
];
List<String> images = [
"images/a1.jpg",
"images/a2.jpg",
"images/a3.jpg",
];


class ExampleHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("ExampleHorizontal"),
        ),
        body: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.asset(
              images[index],
              fit: BoxFit.fill,
            );
          },

          autoplay: true,
          itemCount: images.length,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
        ));
  }
}

class ExampleVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("ExampleVertical"),
        ),
        body: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.asset(
              images[index],
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          pagination: new SwiperPagination(alignment: Alignment.centerRight),
          control: new SwiperControl(),
        ));
  }
}

class ExampleFraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text("ExampleFraction"),
        ),
        body: new Column(
          children: <Widget>[
            Expanded(
                child: new Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.asset(
                      images[index],
                      fit: BoxFit.fill,
                    );
                  },
                  autoplay: true,
                  itemCount: images.length,
                  pagination:
                  new SwiperPagination(builder: SwiperPagination.fraction),
                  control: new SwiperControl(),
                )),
            Expanded(
                child: new Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.asset(
                      images[index],
                      fit: BoxFit.fill,
                    );
                  },
                  autoplay: true,
                  itemCount: images.length,
                  scrollDirection: Axis.vertical,
                  pagination: new SwiperPagination(
                      alignment: Alignment.centerRight,
                      builder: SwiperPagination.fraction),
                ))
          ],
        ));
  }
}

class ExampleCustomPagination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Custom Pagination"),
        ),
        body: new Column(
          children: <Widget>[
            new Expanded(
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: images.length,
                pagination: new SwiperPagination(
                    margin: new EdgeInsets.all(0.0),
                    builder: new SwiperCustomPagination(builder:
                        (BuildContext context, SwiperPluginConfig config) {
                      return new ConstrainedBox(
                        child: new Container(
                            color: Colors.white,
                            child: new Text(
                              "${titles[config.activeIndex]} ${config.activeIndex + 1}/${config.itemCount}",
                              style: new TextStyle(fontSize: 20.0),
                            )),
                        constraints: new BoxConstraints.expand(height: 50.0),
                      );
                    })),
                control: new SwiperControl(),
              ),
            ),
            new Expanded(
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: images.length,
                pagination: new SwiperPagination(
                    margin: new EdgeInsets.all(0.0),
                    builder: new SwiperCustomPagination(builder:
                        (BuildContext context, SwiperPluginConfig config) {
                      return new ConstrainedBox(
                        child: new Row(
                          children: <Widget>[
                            new Text(
                              "${titles[config.activeIndex]} ${config.activeIndex + 1}/${config.itemCount}",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            new Expanded(
                              child: new Align(
                                alignment: Alignment.centerRight,
                                child: new DotSwiperPaginationBuilder(
                                    color: Colors.black12,
                                    activeColor: Colors.black,
                                    size: 10.0,
                                    activeSize: 20.0)
                                    .build(context, config),
                              ),
                            )
                          ],
                        ),
                        constraints: new BoxConstraints.expand(height: 50.0),
                      );
                    })),
                control: new SwiperControl(color: Colors.redAccent),
              ),
            )
          ],
        ));
  }
}

class ExamplePhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Phone"),
      ),
      body: new Stack(
        children: <Widget>[
          // ConstrainedBox(
          //   constraints: new BoxConstraints.expand(),
          //   child: new Image.asset(
          //     "images/logo.png",
          //     fit: BoxFit.fill,
          //   ),
          // ),
          new Swiper.children(
            autoplay: false,
            pagination: new SwiperPagination(
              //  margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                builder: new DotSwiperPaginationBuilder(
                    color: colors.primary.withOpacity(.7),
                    activeColor: colors.primary,
                    size: 10.0,
                    activeSize: 15.0)),
            children: images.map((e) =>Image.asset(e,fit: BoxFit.fill,width: MQSize.width,height: 300,)).toList(),
          )
        ],
      ),
    );
  }
}

class ScaffoldWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final List<Widget> actions;

  ScaffoldWidget({this.child, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        actions: actions,
      ),
      body: child,
    );
  }
}