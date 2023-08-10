import 'package:dio_package/data/models/companies/cars_model.dart';
import 'package:dio_package/data/models/universal_data.dart';
import 'package:dio_package/data/network/api_service.dart';
import 'package:dio_package/ui/home/widgets/list_tile_item.dart';
import 'package:flutter/material.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({super.key});

  @override
  State<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Companies Screen"),
      ),
      body: FutureBuilder(
        future: ApiService().getCompanies(),
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
              List<CarsModel> cars = data.data;
              return ListView(
                children: List.generate(cars.length, (index) => ListTileItem(carsModel: cars[index], carIndex: index,)
                ),
              );
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}