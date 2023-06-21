import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final bool isRecommended;
  @HiveField(6)
  final bool isPopular;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
      ];

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      id: snap['id'],
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
    );
    return product;
  }

  static List<Product> products = [
    const Product(
      id: '1',
      name: 'Soft drink #1',
      category: 'Soft drinks',
      imageUrl:
          'https://media.istockphoto.com/id/455647401/photo/green-beverage.jpg?s=612x612&w=0&k=20&c=rplcUla55EWVAm421W7hFLbKTwGHvckuLtaRe6hdjIA=',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: '2',
      name: 'Soft drink #2',
      category: 'Soft drinks',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/0/05/Orangejuice.jpg',
      price: 2.45,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: '3',
      name: 'Soft drink #3',
      category: 'Soft drinks',
      imageUrl:
          'https://www.alphafoodie.com/wp-content/uploads/2021/08/Strawberry-Juice-Square.jpg',
      price: 1.95,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      id: '3',
      name: 'Smoothie #1',
      category: 'Smoothies',
      imageUrl:
          'https://t3.ftcdn.net/jpg/02/22/63/26/360_F_222632665_uNJoVxYegcH8BoQuTnubluaOiU04sCNd.jpg',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: '4',
      name: 'Smoothie #2',
      category: 'Smoothies',
      imageUrl:
          'https://media.istockphoto.com/id/455647401/photo/green-beverage.jpg?s=612x612&w=0&k=20&c=rplcUla55EWVAm421W7hFLbKTwGHvckuLtaRe6hdjIA=',
      price: 2.99,
      isRecommended: false,
      isPopular: false,
    ),
  ];
}
