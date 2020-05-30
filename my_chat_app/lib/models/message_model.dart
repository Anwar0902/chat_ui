import 'user_model.dart';
class Message {
  final User sender;
  final String text;
  final String time;
  final bool isLiked;
  final bool unread;

  Message({this.sender, this.text, this.time, this.isLiked, this.unread});
}

// current_user
final User currentUser = new User(id: 0, name: "anwar", imageUrl: 'assets/images/greg.jpg');

// otherUsers
final User one = new User(id: 1, name: "saurabh", imageUrl: 'assets/images/james.jpg');
final User two = new User(id: 2, name: "rohit", imageUrl: 'assets/images/john.jpg');
final User three = new User(id: 3, name: "manish", imageUrl: 'assets/images/olivia.jpg');
final User four = new User(id:4, name: "vineet", imageUrl: 'assets/images/sam.jpg');
final User five = new User(id: 5, name: "nitish", imageUrl: 'assets/images/sophia.jpg');
final User six = new User(id: 6, name: "nasim", imageUrl: 'assets/images/steven.jpg');

final List<User> favorites = [one, two, three, four, five, six];

final List<Message> chats = [
  Message(sender: one, time: '5:30 PM', text: 'Hey, how\'s it going? What did you do today?', isLiked: false, unread: true),
  Message(sender: three, time: '9:34 PM', text: 'Hey, how\'s it going? What did you do today?', isLiked: false, unread: true),
  Message(sender: five, time: '6:10 PM', text: 'Hey, how\'s it going? What did you do today?', isLiked: false, unread: false),
  Message(sender: two, time: '5:15 PM', text: 'Hey, how\'s it going? What did you do today?', isLiked: false, unread: true),
  Message(sender: six, time: '4:20 PM', text: 'Hey, how\'s it going? What did you do today?', isLiked: false, unread: false),
];

final List<Message> messages = [
  Message(
    sender: one,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: one,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: one,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: one,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: one,
    time: '1:30 PM',
    text: 'I am very Hungry.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '1:00 PM',
    text: 'what\' plan for today.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '12:30 PM',
    text: 'hey how are u. ?',
    isLiked: true,
    unread: true,
  ),
];