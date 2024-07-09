class ChatMessage {
  final String sender;
  final String profileImage;
  final String location;
  final String sendDate;
  final String message;
  final String? imageUri;

  ChatMessage({
    required this.sender,
    required this.profileImage,
    required this.location,
    required this.sendDate,
    required this.message,
    this.imageUri,
  });
}

// 샘플 데이터
List<ChatMessage> chatMessageList = [
  ChatMessage(
    sender: '당근이,',
    profileImage: 'https://picsum.photos/id/870/200/100?grayscale',
    location: '역북동',
    sendDate: '1일전',
    message: 'developer 님,근처에 다양한 물품들이 아주 많이있습니다.',
  ),
  ChatMessage(
    sender: 'Flutter',
    profileImage: 'https://picsum.photos/id/880/200/100?grayscale',
    sendDate: '2일전',
    message: '안녕하세요 지금 다 예약 상태 인가요?',
    imageUri: 'https://picsum.photos/id/890/200/100?grayscale',
    location: '',
  ),
  ChatMessage(
    sender: 'hi',
    profileImage: 'https://picsum.photos/id/880/200/100?grayscale',
    sendDate: '1일전',
    message: '안녕하세요 제가 사고 싶습니다!',
    imageUri: 'https://picsum.photos/id/890/200/100?grayscale',
    location: '',
  )
];
