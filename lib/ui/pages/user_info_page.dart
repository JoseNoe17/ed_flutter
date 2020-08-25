import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 200.0, width: 200.0,
              decoration: BoxDecoration(borderRadius:
              BorderRadius.circular(100.0),color: Colors.blue,
                  image: DecorationImage(image:
                  NetworkImage("https://i.pinimg.com/originals/f5/1d/08/f51d08be05919290355ac004cdd5c2d6.png"),
                  fit: BoxFit.cover) )
          ),
          FutureBuilder(
            future:
            DefaultAssetBundle.of(context).loadString("assets/data.jason"),
            builder: (context, result){
              if (result.hasData){
                final data = jsonDecode(result.data);

                return Column(
                  children: <Widget>[
                    Text(
                      data['nombre'],
                        style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      data['telefono'],
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
