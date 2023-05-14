import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        imageUrl,
      ];

  static List<Category> categories = [
    const Category(
        name: 'Soft Drink',
        imageUrl:
            'https://media.istockphoto.com/id/533575209/photo/soft-drink-being-poured-into-glass.jpg?s=612x612&w=0&k=20&c=OPfGgxIkH_6j-ozfWol5RxypTAIZSmkR3NL-qsJ7_Qk='),
    const Category(
        name: 'Water',
        imageUrl:
            'https://domf5oio6qrcr.cloudfront.net/medialibrary/7909/conversions/b8a1309a-ba53-48c7-bca3-9c36aab2338a-thumb.jpg'),
    const Category(
        name: 'Smoothies',
        imageUrl:
            'https://www.thespruceeats.com/thmb/DTkCRqNWiK8HmlAANacYhMLhN9E=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/strawberry-breakfast-smoothie-recipe-2097149-hero-02-5c1d4b2a46e0fb00014bf2ec.jpg')
  ];
}
