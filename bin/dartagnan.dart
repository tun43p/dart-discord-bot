import 'package:dartagnan/dartagnan.dart' as dartagnan;
import 'package:nyxx/nyxx.dart';

late dartagnan.Bot bot;

Future<void> main(List<String> arguments) async {
  bot = NyxxFactory.createNyxxWebsocket(
    dartagnan.token,
    GatewayIntents.all,
  )
    ..registerPlugin(Logging())
    ..registerPlugin(CliIntegration())
    ..registerPlugin(IgnoreExceptions());

  await bot.connect();

  dartagnan.onCommand(bot, 'ping', (IMessageReceivedEvent event) async {
    await event.message.channel.sendMessage(MessageBuilder.content('Pong !'));
  });

  dartagnan.onCommand(bot, 'pong', (IMessageReceivedEvent event) async {
    await event.message.channel.sendMessage(MessageBuilder.content('Ping !'));
  });
}
