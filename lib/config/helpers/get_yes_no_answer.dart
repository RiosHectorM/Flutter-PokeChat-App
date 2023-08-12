import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNoAnswer {
  final Dio dio = Dio();
  final String pokemon;

  GetYesNoAnswer(this.pokemon);

  Future<Message> getAnswer() async {
    try {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemon');
     return Message(
      text: response.data['name'],
      fromWho: FromWho.hers,
      imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png',
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
