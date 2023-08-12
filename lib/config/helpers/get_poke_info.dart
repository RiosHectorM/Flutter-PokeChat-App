import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetPokeInfo {
  final Dio dio = Dio();

  Future<Message> getPoke(String poke) async {
    try {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon/$poke');
     return Message(
      text: response.data['name'],
      fromWho: FromWho.hers,
      imageUrl: response.data['sprites']['other']['home']['front_default'],
      height: response.data['height'].toString(),
      weight: response.data['weight'].toString(),
      attack: response.data['stats'][1]['base_stat'].toString(),
      defense: response.data['stats'][2]['base_stat'].toString(),
      speed: response.data['stats'][5]['base_stat'].toString(),
      hp: response.data['stats'][0]['base_stat'].toString(),
    );  
    } catch (e) {
      return Message(
      text: 'Pokemon not Found',
      fromWho: FromWho.hers,
      imageUrl: 'https://i.pinimg.com/originals/c9/01/03/c901035a8cd3745d6e47fafe6ad048d9.gif',
      );
    }
    
  }


}