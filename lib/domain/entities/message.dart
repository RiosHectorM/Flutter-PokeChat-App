enum FromWho {me, hers}

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  final String? height;
  final String? weight;
  final String? attack;
  final String? defense;
  final String? speed;
  final String? hp;

  Message({
    required this.text, 
    this.imageUrl, 
    this.height, 
    this.weight, 
    this.attack, 
    this.defense, 
    this.speed, 
    this.hp,
    required this.fromWho}
  );
}