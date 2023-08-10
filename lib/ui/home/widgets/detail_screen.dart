import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio_package/data/models/companies/car_model.dart';
import 'package:flutter/material.dart';
import '../../../data/models/universal_data.dart';
import '../../../data/network/api_service.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.carIndex}) : super(key: key);
  final int carIndex;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.orange.shade900),
      ),

      body: FutureBuilder(
        future: ApiService().getCar(carIndex: widget.carIndex),
        builder: (BuildContext context, AsyncSnapshot<UniversalData> snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: const TextStyle(fontSize: 18),
                ),
              );
            }else if(snapshot.hasData){
              UniversalData data = snapshot.data!;
              CarModel carModel = data.data;
              return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          carModel.carModel,
                          style: const TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0,),
                        Text(
                          carModel.averagePrice.toString(),
                          style: const TextStyle(color: Colors.black54,),
                        ),
                        const SizedBox(height: 20.0,),
                        CarouselSlider.builder(
                            itemCount: carModel.carPics.length,
                            itemBuilder: (context, index, id) => Hero(
                              tag: "${widget.carIndex+1}",
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: CachedNetworkImage(
                                  imageUrl: carModel.carPics[index],
                                  placeholder: (context, url) => Container(
                                    height: 150,
                                      width: 150,
                                      margin: const EdgeInsets.all(20),
                                      child: const CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => const Center(child: Text("404",style: TextStyle(
                                    fontSize: 25,
                                  ),)),
                                ),
                              ),
                            ),
                            options: CarouselOptions(
                              aspectRatio: 16 / 9,
                              enableInfiniteScroll: false,
                              enlargeCenterPage: true,
                            )),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Text(carModel.description)
                      ],
                    ),
                  );
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}