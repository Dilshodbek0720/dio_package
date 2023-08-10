import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/companies/cars_model.dart';
import 'detail_screen.dart';

class ListTileItem extends StatefulWidget {
  const ListTileItem({Key? key, required this.carsModel, required this.carIndex})
      : super(key: key);
  final CarsModel carsModel;
  final int carIndex;
  @override
  State<ListTileItem> createState() => _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailsScreen(
            carIndex: widget.carIndex + 1,
          );
        }));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(12.0),
        height: 110,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(26.0),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10,),
            Flexible(
              flex: 3,
              child: Hero(
                tag: "${widget.carIndex + 1}",
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.carsModel.logo,
                    placeholder: (context, url) => const SizedBox(
                      height: 100,
                        width: 100,
                        child: CupertinoActivityIndicator()),
                    errorWidget: (context, url, error) => const Center(
                      child: Text(
                        "404",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30.0,),
            Flexible(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8,),
                    Text(
                      widget.carsModel.car_model.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0,),
                    Text(
                      widget.carsModel.average_price.toString(),
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0,),
                    Text(widget.carsModel.established_year.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black54,
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
