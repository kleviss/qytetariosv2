import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart'; // pub to load html tags from json api
import 'package:flutter_html/style.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:qytetarios/wordpress_client.dart';

import 'catWidgets.dart';
import 'hawalnir-date-convertor.dart';

class HawalnirPost extends StatelessWidget {
  HawalnirPost({Key key, @required var this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    debugPrint(post.id.toString());

    return new Scaffold(

      body: new Padding(
          padding: EdgeInsets.all(16.0),
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Hero(tag: 'hero${post.id}', child: hawalImage(post)),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        child: hawalBtnBar(),
                      ),
                    ],
                  ),
                  hawalTitle(post),
                  // Row(
                  //   children: <Widget>[
                  //     Expanded(
                  //       child: hawalAuthor(post),
                  //     ),
                  //     // Expanded(
                  //     //   child: hawalDate(post),
                  //     // ),
                  //   ],
                  // ),
                  Divider(),
                  contentRendered(post),
                ],
              ),
            ],
          )),
    );
  }

  Widget mainImage(Post post) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/placeholder.png',
      image: post.featuredMediaUrl == 0
          ? 'src/images/placeholder.png'
          : post.featuredMediaUrl,
    );
  }

  Widget titleRendered(Post post) {
    return Html(
      data: "post.title",
      style: {
        "html": Style(fontSize: FontSize(20.0),
            // fontWeight: FontWeight.bold,
            // fontStyle: FontStyle.italic
        ),
      },
      shrinkWrap: true,
    );
  }

  Widget contentRendered(Post post) {
    return Html(
      data: (post.content).toString(),
      style: {
        "html": Style(fontSize: FontSize(18.0),
            //fontWeight: FontWeight.bold,
            //fontStyle: FontStyle.italic),
        ),
      "img": Style(
        //
        //   margin: EdgeInsets.all(4),
        //   border: Border.all(width: 1),
        //   height: 520,
        // alignment: Alignment.center, // This is needed








      )},
      onImageTap: (src) {
      // Display the image in large form.
        print(src);
        return FullScreenWidget(
          child: Hero(
            tag: "customTag",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                src,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );

    },
      shrinkWrap: true,
    );
  }

  Widget authorEmbedded(Post post) {
    return Text(
      "author: " + post.author,
      textAlign: TextAlign.right,
    );
  }

  Widget dateMain(Post post) {
    return Text(
      dateConvertor(post.date.toString()),
      textAlign: TextAlign.left,
    );
  }
}
