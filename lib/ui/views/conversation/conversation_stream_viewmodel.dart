import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../core/result.dart';
import '../../../domain/entities/message_entity.dart';
import '../../../repositories/conversation_repository.dart';

class ConversationStreamViewmodel
    extends StreamViewModel<List<Result<MessageEntity>>> {
  String? _roomId;
  final _conversationRepository = locator<ConversationRepository>();

  @override
  Stream<List<Result<MessageEntity>>> get stream {
    if (_roomId == null) {
      return const Stream.empty();
    } else {
      return _conversationRepository.connectConversationStream(_roomId!);
    }
  }
}
