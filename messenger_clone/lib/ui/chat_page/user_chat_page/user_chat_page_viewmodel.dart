import 'dart:developer';

import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:messenger_clone/widgets/chat_bubble/chat_bubble.dart';
import 'package:stacked/stacked.dart';
import 'package:socket_io_client/socket_io_client.dart';

class UserChatPageViewModel extends BaseViewModel{

  final _appRouter = locator<AppRouter>();

 String name = "";
 String imageUrl = "";
 UserChatPageViewModel({required this.name, required this.imageUrl});

 String msg = "";

 String uri = "https://messengerclonebyrana.herokuapp.com/";

 late Socket socket;

  initChatPage() async {
    setBusy(true);
    socket = io(uri, <String, dynamic>{
      "transports": ['websocket'],
      "autoConnect": true,
    });
    socket.connect();
    socket.onConnect((data) => log(socket.id.toString()));
    setBusy(false);
    socket.emit("user", {
      "name": "hello",
      "id":'hothi',
    });
    socket.on('dis', (data) => log(data.toString()));
    socket.on('users', (data) => log(data.toString()));
    log(socket.connected.toString());
    socket.on("msg", (data) {
      chats.add(ChatBubble(msg: data['msg'], received: true,),);
      notifyListeners();
    });


  }
  printData(){
    socket.emit('print', );
  }

  sendQuery(){
    socket.query = "load";
  }

  popPage() async {
   await _appRouter.pop();
  }
  List<ChatBubble> chats = [
    ChatBubble(msg: user_chat[0]['msg'], received: user_chat[0]['received'],),
    ChatBubble(msg: user_chat[1]['msg'], received: user_chat[1]['received'],),
    ChatBubble(msg: user_chat[2]['msg'], received: user_chat[2]['received'],),
    ChatBubble(msg: user_chat[3]['msg'], received: user_chat[3]['received'],),
    ChatBubble(msg: user_chat[4]['msg'], received: user_chat[4]['received'],),
    ChatBubble(msg: user_chat[5]['msg'], received: user_chat[5]['received'],),
    ChatBubble(msg: user_chat[6]['msg'], received: user_chat[6]['received'],),
  ];

  sendMessage(){
    if(msg.isEmpty){

    }else {
      chats.add(ChatBubble(msg: msg, received: false,));
      var data = {
        "msg": msg,
        "received" : false,
        "id": socket.id,
      };
      socket.emit('msg', data);
      notifyListeners();
    }
  }
  static final List user_chat = [
    {
      "received": true,
      "msg" : "hello",
    },
    {
      "received": false,
      "msg": "hello",
    },
    {
      "received": true,
      "msg": "I am selected for the annual quiz competition",
    },
    {
      "received": true,
      "msg": "My mom is really happy",
    },
    {
      "received": false,
      "msg": "Oh great! I am really happy for you. When is it?",
    },
    {
      "received": true,
      "msg": "Next week. You should come!",
    },
    {"received": false,
     "msg": "of course I'll be there."},
  ];

}