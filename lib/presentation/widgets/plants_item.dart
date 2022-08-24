import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/constants/strings.dart';
import 'package:la_vie/data/models/plants.dart';
import 'package:la_vie/data/models/plants.dart';

class PlantItem extends StatelessWidget {
  const PlantItem({Key? key, required this.plant}) : super(key: key);
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    var imagesUrl = baseUrl + plant.imageUrl.toString();
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
            plant.name.toString(),
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
            '${plant.description}',
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
            height: 8,
          ),
          Text(
            'water Capacity: ${plant.waterCapacity}',
            style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto'),
            overflow: TextOverflow.fade,
            maxLines: 3,
            textAlign: TextAlign.left,
          ),
          Text(
            'Sunlight: ${plant.sunLight}',
            style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto'),
            overflow: TextOverflow.fade,
            maxLines: 3,
            textAlign: TextAlign.left,
          ),
          Text(
            'Temp: ${plant.temperature}',
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
