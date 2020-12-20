class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Tim',
  imageUrl: 'assets/tim.jpg',
  isOnline: true,
);

// USERS
final User Chris = User(
  id: 1,
  name: 'Chris',
  imageUrl: 'assets/chris.jpeg',
  isOnline: true,
);
final User John = User(
  id: 2,
  name: 'John',
  imageUrl: 'assets/john.jpg',
  isOnline: true,
);
final User Susan = User(
  id: 3,
  name: 'Susan',
  imageUrl: 'assets/susan.jpg',
  isOnline: false,
);
