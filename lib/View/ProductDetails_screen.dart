// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/Product.dart';
import 'package:mainpage_detailuser_v1/ViewModel/product_view_Model.dart';

class ProductDetailPage extends StatefulWidget {
  final int? id;

  const ProductDetailPage({super.key, required this.id});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFavorite = false;
  int currentImageIndex = 0;

  late String productDescription;
  late List<String> productImages = [];
  late Future<Product> productDetailFuture;

  ProductViewModel productViewModel = ProductViewModel();

  void _nextImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % productImages.length;
    });
  }

  @override
  void initState() {
    super.initState();
    productDetailFuture = productViewModel.fetch_Product_Details(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sản phẩm', style: TextStyle(fontSize: 22)),
      ),
      body: FutureBuilder<Product>(
        future: productDetailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Product productDetail = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            productImages.isNotEmpty
                                ? productImages[currentImageIndex]
                                : '',
                            width: double.infinity,
                            height: 240,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    const Color.fromARGB(255, 236, 232, 232),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_forward,
                                      color: Colors.black, size: 30),
                                  onPressed: _nextImage,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'test: id sản phẩm ${productDetail.iDSP}',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Hãng: NIKE',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'Chất liệu: Nhựa siêu nhẹ',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Đế lót: Siêu nhẹ',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Kiểu dáng: Thể thao',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 100.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.shopping_bag,
                                        color: Colors.white, size: 27),
                                    SizedBox(height: 10),
                                    Text(
                                      '4.500.000',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Mô tả chi tiết sản phẩm',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                          const SizedBox(height: 10),
                          const Text(
                            'Hệ thống Dynamic Air của chúng tôi có 2 bộ ống áp suất kép. Với lượng áp lực chắc nhất ở gót chân và lượng áp lực mềm nhất về phía giữa bàn chân, mức không khí thay đổi trong mỗi bộ để chuyển tiếp mượt mà khi bạn bước đi. Lớp lưới nhiều lớp ở phần trên tạo cảm giác nhẹ và thoáng khí, với họa tiết haptic tạo nên vẻ ngoài có kết cấu. Lớp bọt xốp bao quanh hệ thống đệm tạo cảm giác nâng cao, mềm mại và hỗ trợ độc đáo. Mang lại sự thoải mái từ trên xuống dưới, thiết kế xúc giác này tự hào có độ nảy ở mức hiệu suất để tiếp thêm năng lượng cho mọi chuyển động của bạn.',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No product data available'));
          }
        },
      ),
    );
  }
}
