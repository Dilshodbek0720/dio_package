import 'package:dio_package/data/models/countries/countries.dart';
import 'package:dio_package/data/models/universal_data.dart';
import 'package:dio_package/data/network/api_service.dart';
import 'package:flutter/material.dart';
import '../../data/models/countries/data.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Countries Screen"),
      ),
      body: FutureBuilder(
        future: ApiService().getData(),
        builder: (BuildContext context, AsyncSnapshot<UniversalData> snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return Center(
                child: Text('${snapshot.error} occurred', style: const TextStyle(fontSize: 18)),
              );
            }else if(snapshot.hasData){
              UniversalData data = snapshot.data!;
              Data dataModel = data.data;
              List<Countries> countries = dataModel.countries;
              return ListView(
                children: List.generate(countries.length, (index) => ListTile(
                  onTap: (){ },
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(countries[index].emoji, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20),),
                  ),
                  title: Text("${countries[index].name},  ${countries[index].capital}", maxLines: 1, overflow: TextOverflow.ellipsis,),
                  subtitle: Text("Phone: +${countries[index].phone}"),
                  trailing: Text(countries[index].currency),
                )),
              );
            }else{
              return const Center(child: CircularProgressIndicator());
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