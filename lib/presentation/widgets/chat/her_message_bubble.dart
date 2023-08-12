import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    
    if (message.text == 'Pokemon not Found'){
      return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 5),
        _ImageBubble( message.imageUrl! ),
        const SizedBox(height: 10),
        SizedBox(
            width: size.width * 0.8,
            child: Column(            
            children: [
              Container(
                color: Colors.black,                
                child: Padding(                
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Center(
                    child: Text(
                      message.text.toUpperCase(),                    
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
      ]);
  }
    

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 5),
        _ImageBubble( message.imageUrl! ),
        const SizedBox(height: 10),
        Container(
            decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
            width: size.width * 0.8,
            child: Column(            
            children: [
              Container(
                color: Colors.black,                
                child: Padding(                
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    message.text.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.colorize, color: Colors.white, size: 40,),
                      Text(message.attack.toString(), style: const TextStyle(color: Colors.white, fontSize: 20,)),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.health_and_safety, color: Colors.white, size: 40,),
                      Text(message.attack.toString(), style: const TextStyle(color: Colors.white, fontSize: 20,)),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.favorite, color: Colors.white, size: 40,),
                      Text(message.attack.toString(), style: const TextStyle(color: Colors.white, fontSize: 20,))
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.height, color: Colors.white, size: 40,),
                      Text(message.attack.toString(), style: const TextStyle(color: Colors.white, fontSize: 20,)),
                    ],
                  ),
                Column(
                  children: [
                    const Icon(Icons.scale, color: Colors.white, size: 40,),
                    Text(message.attack.toString(), style: const TextStyle(color: Colors.white, fontSize: 20,)),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.speed, color: Colors.white, size: 40,),
                    Text(message.attack.toString(), style: const TextStyle(color: Colors.white, fontSize: 20,)),
                  ],
                ),
                ],
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble( this.imageUrl );

  @override
  Widget build(BuildContext context) {    

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),        
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: 220,
          
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 220,
              child: const Text('Searching Pokemon'),
            );
          },
        ));
  }
}