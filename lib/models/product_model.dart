import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
      ];

  static List<Product> products = [
    const Product(
      name: 'Soft drink #1',
      category: 'Soft drinks',
      imageUrl:
          'https://media.istockphoto.com/id/455647401/photo/green-beverage.jpg?s=612x612&w=0&k=20&c=rplcUla55EWVAm421W7hFLbKTwGHvckuLtaRe6hdjIA=',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Soft drink #2',
      category: 'Soft drinks',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/0/05/Orangejuice.jpg',
      price: 2.45,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Soft drink #3',
      category: 'Soft drinks',
      imageUrl:
          'https://www.alphafoodie.com/wp-content/uploads/2021/08/Strawberry-Juice-Square.jpg',
      price: 1.95,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: 'Smoothie #1',
      category: 'Smoothies',
      imageUrl:
          'https://t3.ftcdn.net/jpg/02/22/63/26/360_F_222632665_uNJoVxYegcH8BoQuTnubluaOiU04sCNd.jpg',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Smoothie #1',
      category: 'Smoothies',
      imageUrl:
          'https://media.istockphoto.com/id/455647401/photo/green-beverage.jpg?s=612x612&w=0&k=20&c=rplcUla55EWVAm421W7hFLbKTwGHvckuLtaRe6hdjIA=',
      price: 2.99,
      isRecommended: false,
      isPopular: false,
    ),
  ];
}
