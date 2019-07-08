import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 产品数据类
 */
class Product {
  const Product({this.name});
  final String name;
}

/**
 * 卡牌变化回调函数类型
 */
typedef void CartChangedCallback(Product product, bool inCart);

/**
 * 根APP
 */
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tappable List',
      home: Container(
        child: Text(
          'Hello World',
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  ProductItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  /**
   * 获取卡片颜色
   */
  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return TextStyle(
        color: Colors.black54, 
        decoration: TextDecoration.lineThrough,
        backgroundColor: _getColor(context)
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCartChanged(product, inCart);
      },
      child: Container(
        child: Title(
          title: product.name,
          color: Colors.white54,
          child: Text(
            product.name,
            style: _getTextStyle(context),
          ),
        ),
        padding: EdgeInsets.all(15.0),
      ),
    );
  }
}

class ProductsList extends StatefulWidget {
  const ProductsList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  _ProductsListState createState() {
    return _ProductsListState();
  }
}
class _ProductsListState extends State<ProductsList> {

  Set<Product> _products = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart)
        _products.add(product);
      else
        _products.remove(product);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tappable List'
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
      ),
    );
  }
}