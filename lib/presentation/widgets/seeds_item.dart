import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/constants/strings.dart';
import 'package:la_vie/data/models/seeds.dart';

class SeedItem extends StatelessWidget {
  const SeedItem({Key? key, required this.seed}) : super(key: key);
  final Seed seed;

  @override
  Widget build(BuildContext context) {
    var imagesUrl = baseUrl + seed.imageUrl.toString();
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.white,
          alignment: Alignment.bottomCenter,
          child: Text(
            seed.name.toString(),
            style: const TextStyle(
              height: 1.3,
              fontSize: 16,
              color: Colors.black ,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
            color: Color.fromARGB(255, 255, 255, 255),
            child: imagesUrl == baseUrl
                ? Image.asset('assets/images/Empty.jpg')
                : FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: 'assets/images/Loading.gif',
                    image: imagesUrl.toString(),
                  )),
      ),
    );
  }
}
