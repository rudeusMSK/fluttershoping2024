import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Services/API/backendImages_Url.dart';
import 'package:mainpage_detailuser_v1/View/productDetails_screen.dart';
import 'package:mainpage_detailuser_v1/ViewModel/Category_View_Model.dart';
import 'package:mainpage_detailuser_v1/ViewModel/product_view_Model.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/countdown_body.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/slider_body.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  HomeBodyState createState() => HomeBodyState();
}

class HomeBodyState extends State<HomeBody> {
  CategoryViewModel categoryViewModel = CategoryViewModel();
  ProductViewModel productViewModel = ProductViewModel();

  @override
  void initState() {
    categoryViewModel.fetchListCategory();
    productViewModel.fetchProductCardList(0);
    productViewModel.fetchTimeSaler();
    super.initState();
  }

  int selectedCategoryIndex = -1;
  String selectedCategoryName = 'Sản phẩm';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ChangeNotifierProvider(
            create: (context) => categoryViewModel,
            child: Column(
              children: [
                productTitle(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: categoryListView(),
                ),
                AttendanceScreen(
                    hh: productViewModel.timeSale.hh.toString(),
                    mm: productViewModel.timeSale.mm.toString(),
                    ss: productViewModel.timeSale.ss.toString()),
                const EnlargeStrategyZoomDemo(),
                ChangeNotifierProvider(
                  create: (context) => productViewModel,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height -
                          250, // Adjust the height as needed
                      child: productListView(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Products title:
  Widget productTitle() {
    return Consumer<CategoryViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.categorys.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              selectedCategoryName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          );
        }
      },
    );
  }

// Category Items :
  Widget categoryListView() {
    return Consumer<CategoryViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          //margin: const EdgeInsets.symmetric(vertical: 10),
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.categorys.length,
            itemBuilder: (context, index) {
              final category = viewModel.categorys[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategoryIndex = index;
                    selectedCategoryName = category.tenLoai ?? 'Sản phẩm';
                    productViewModel.fetchProductCardList(category.iDLoai ?? 0);
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Animation transfer delay: 0,5s -⁠ ฅ^•ﻌ•^ฅ
                    AnimatedContainer(
                      duration: const Duration(
                          milliseconds: 200), // Recommended:  0,3 - 0,5

                      //padding: const EdgeInsets.all(2),
                      //margin: const EdgeInsets.all(1),

                      width: 100,
                      height: 100,

                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == index
                            ? const Color(0xFF69BDFC)
                            : const Color(0xFFD9D9D9),
                        shape: BoxShape.circle,
                      ),

                      child: Center(
                        child: Text(
                          category.tenLoai.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                          ) ,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

// Products Items:
  Widget productListView() {
    return Consumer<ProductViewModel>(
      builder: (context, viewModel, child) {
        // => chưa có repon từ endpoit >>> loading.gif
        if (viewModel.productCards.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        // show product info:
        else {
          return GridView.builder(
            // update: GridView.Count => GridView.builder
            // Use: (hướng dẫn sử zụn)
            itemCount: viewModel.productCards.length, // số lượng items
            // build gird: items positions
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // col (2 cột như trên figma nhóa !)
              childAspectRatio: 4 /
                  5, // chiều rộng dài của mỗi item (để đại i, theo ông bà mách bảo :3 !!)
            ),
            itemBuilder: (context, index) {
              // Get: product
              final product = viewModel.productCards[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        key: ValueKey('product_detail_page_$index'),
                        id: product.iDSP,
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    children: [

                      // Img product:
                      product.imgUrl != null
                          ? Image.network(
                              // link Src + {*.png, *.jpg}
                              ImageUrls.imageSrc + product.imgUrl.toString(),
                              width: 120,
                              height: 120, errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            })
                          : Text(
                              ImageUrls.imageSrc + product.imgUrl.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),

                      // Name Product:
                      Text(
                        product.tenSP ?? "sp này hôk có tên á",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      
                      // Price Product:
                      Text(
                        'Giá: ${product.giaBan} Đ',
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
