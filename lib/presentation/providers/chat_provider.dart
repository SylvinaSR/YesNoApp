import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

/**
 * ChangeNotifier es una clase nativa de la librería base que sirve para gestionar el estado de tu aplicación. 
 * Funciona como un sistema de suscripción: 
 * almacena datos y avisa automáticamente a los widgets (pantallas) que estén escuchando para que se reconstruyan cada vez que esos datos cambian
 */

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola amor', fromWho: FromWho.mine),
    Message(text: 'Regresando del trabajo', fromWho: FromWho.mine),
    Message(text: 'Hi', fromWho: FromWho.his)
  ];

  Future<void> sendMessage(String text) async {
    //Implementation
  }
}
