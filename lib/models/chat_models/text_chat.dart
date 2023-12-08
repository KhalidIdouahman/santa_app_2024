class ChatText {
  final String chatQuestion;
  final String chatResponse;
  // this to detemine who send this message is it from the question list or response.
  final bool isMe;

  const ChatText({required this.chatQuestion, required this.chatResponse , this.isMe = true});
}
