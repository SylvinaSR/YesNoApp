import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://i.pinimg.com/736x/1f/4d/bb/1f4dbb5212e5be4c2a244fdcec5601d3.jpg',
            ),
          ),
        ),
        title: Text('Yuji <3'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

//SafeArea: Area segura, de esta forma el contenido no toma el espacio de la isla dinamica y area de botones inferior
//Expanded: Expande el widget a todo el espacio disponible

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Esto va a estar pendiente de los cambios, es la instancia de nuestro ChatProvider
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.his)
                      ? HisMessageBubble(text: message.text,)
                      : MyMessageBubble(text: message.text);
                },
              ),
            ),
            MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value),),
          ],
        ),
      ),
    );
  }
}
