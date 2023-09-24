class User {
  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const User.empty()
      : this(
            id: '-1',
            createdAt: '_empty.createdAT',
            name: '_empty.name',
            avatar: '_empty.avatar');

  final String id;
  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object> get props => [id];
}
