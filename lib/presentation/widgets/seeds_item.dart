import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/constants/strings.dart';
import 'package:la_vie/data/models/seeds.dart';
import 'package:la_vie/data/models/products.dart';

// class SeedItem extends StatelessWidget {
//   const SeedItem({Key? key, required this.seed}) : super(key: key);
//   final Seed seed;

//   @override
//   Widget build(BuildContext context) {
//     var imagesUrl = baseUrl + seed.imageUrl.toString();
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//       padding: const EdgeInsetsDirectional.all(4),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: GridTile(
//         footer: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           color: Colors.white,
//           alignment: Alignment.bottomCenter,
//           child: Text(
//             seed.name.toString(),
//             style: const TextStyle(
//               height: 1.3,
//               fontSize: 16,
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//             overflow: TextOverflow.ellipsis,
//             maxLines: 2,
//             textAlign: TextAlign.center,
//           ),
//         ),
//         child: Container(
//             color: Color.fromARGB(255, 255, 255, 255),
//             child: imagesUrl == baseUrl
//                 ? Image.asset('assets/images/Empty.jpg')
//                 : FadeInImage.assetNetwork(
//                     width: double.infinity,
//                     height: double.infinity,
//                     placeholder: 'assets/images/Loading.gif',
//                     image: imagesUrl.toString(),
//                   )),
//       ),
//     );
//   }
// }

class SeedItem extends StatelessWidget {
  const SeedItem({Key? key, required this.seed}) : super(key: key);
  final Seed seed;

  @override
  Widget build(BuildContext context) {
    var imagesUrl = baseUrl + seed.imageUrl.toString();
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black12,
          style: BorderStyle.solid,
          width: 0.3,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Center(
              child: imagesUrl == baseUrl
                  ? Image.asset('assets/images/Empty.jpg')
                  : Image.network(
                      imagesUrl.toString(),
                      scale: 5,
                    ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            seed.name.toString(),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.left,
          ),
          Text(
            '${seed.description}',
            style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto'),
            overflow: TextOverflow.fade,
            maxLines: 3,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text(
                'Add To Cart',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
