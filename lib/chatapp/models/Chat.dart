class Chat {
  final String name,lastMessage,image,time;
  final bool isActive;

  Chat({
    this.name ='',
    this.lastMessage='',
    this.image='',
    this.time='',
    this.isActive=false
  });
}

List chatsData =[
  Chat(
    name: "Eslam Medhat",
    lastMessage: "Hope you are doing well...",
    image: "assets/user.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Imad Eddine",
    lastMessage: "Hello Eslam, I am Imad.",
    image: "assets/user_2.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Ibrahim Jaffer",
    lastMessage: "Do you have any updates ?!",
    image: "assets/user_3.png",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "Manar Alghanim",
    lastMessage: "Thanks",
    image: "assets/user_4.png",
    time: "6m ago",
    isActive: true,
  ),
  Chat(
    name: "Abdulrahman Almunaiee",
    lastMessage: "You are welcome..",
    image: "assets/user_5.png",
    time: "7m ago",
    isActive: true,
  ),
  Chat(
    name: "Aqeel Ali",
    lastMessage: "Welcome everyone",
    image: "assets/user.png",
    time: "10m ago",
    isActive: false,
  ),
  Chat(
    name: "Renad Zuhayri",
    lastMessage: "Hope you are doing well...",
    image: "assets/user_2.png",
    time: "15m ago",
    isActive: true,
  ),
  Chat(
    name: "Beshoy Mark",
    lastMessage: "I Hope you are okay",
    image: "assets/user_3.png",
    time: "20m ago",
    isActive: false,
  ),
];