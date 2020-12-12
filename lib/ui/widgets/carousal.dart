import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:yemenwe/api/urls.dart';
import 'package:yemenwe/ui/colors/colors.dart';
import 'package:yemenwe/models/Slide.dart';
import 'package:yemenwe/ui/styles/Styles.dart';
import 'package:yemenwe/utils/MQSize.dart';



class Carousal  {




  List<String> images = [

  ];

   List<String> titles = [

  ];




  horizantal({List<SlideImg> slides=const[]}){


    var height=220.0;

    return new Column(
      children: <Widget>[
        new Expanded(
          child: new Swiper(

            itemBuilder: (BuildContext context, int index) {
              return new CachedNetworkImage(

                imageUrl:urls.images+  slides[index].img,
                fit: BoxFit.fill,
              );
            },
            autoplay: true,

            itemCount: slides.length,
            pagination: new SwiperPagination(

                margin: new EdgeInsets.all(0.0),
                builder: new SwiperCustomPagination(builder:
                    (BuildContext context, SwiperPluginConfig config) {
                  return Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              height: height,

                              padding: EdgeInsets.all(10),
                              color: colors.blueDark  .withOpacity(.3),
                              child: new Text(
                                "${slides[config.activeIndex].description} ",textAlign: TextAlign.center,
                                style: Styles().TitleTextStyle16White,
                              ),
                            ),
                          ),
                        ],
                      ));
                })),
            control: new SwiperControl(
              color: Colors.white
              ,
            ),
          ),
        ),
      ],
    );

  }


  phone( List<String> images,{BuildContext context}){


    return Swiper.children(
      autoplay: false,
      pagination: new SwiperPagination(
        //  margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
        margin: EdgeInsets.zero,
        alignment: Alignment.bottomCenter,
          builder: new DotSwiperPaginationBuilder(

              color: colors.primary.withOpacity(.7),
              activeColor: colors.primary,
              size: 10.0,
              activeSize: 15.0)),
      children: images.map((e) =>GestureDetector(

          onTap: (){


            Navigator.of(context).push(new PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return new Material(
                      color: Colors.black38,
                      child: new Container(
                        padding: const EdgeInsets.all(30.0),
                        child: new InkWell(
                          child: new Hero(
                            child: new CachedNetworkImage(
                              imageUrl: e,fit: BoxFit.fill,width: MQSize.width,height: 300,
                              placeholder: (context, e) => SpinKitFadingCircle(),


                            ),
                            tag: e,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ));
                }));

          },
          child: CachedNetworkImage( imageUrl: e,fit: BoxFit.fill,width: MQSize.width,height: 300,))).toList(),
    );

  }



}
