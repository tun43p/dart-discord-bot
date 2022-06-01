import 'package:dartagnan/dartagnan.dart';
import 'package:nyxx/nyxx.dart';

/// On message received command handler
void onCommand(
  Bot bot,
  String trigger,
  Function(IMessageReceivedEvent event) callback,
) {
  bot.eventsWs.onMessageReceived.listen((event) {
    if (event.message.content == '$prefix$trigger') callback(event);
  });
}
