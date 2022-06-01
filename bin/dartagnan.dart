import 'package:dartagnan/dartagnan.dart' as dartagnan;
import 'package:nyxx/nyxx.dart';

late dartagnan.Bot bot;

void main(List<String> arguments) {
  bot = NyxxFactory.createNyxxWebsocket(
    dartagnan.token,
    GatewayIntents.all,
  )
    ..registerPlugin(Logging())
    ..registerPlugin(CliIntegration())
    ..registerPlugin(IgnoreExceptions())
    ..connect();

  dartagnan.onCommand(bot, 'ping', (event) {
    event.message.channel.sendMessage(MessageBuilder.content('Pong !'));
  });

  dartagnan.onCommand(bot, 'pong', (event) {
    event.message.channel.sendMessage(MessageBuilder.content('Ping !'));
  });
}
