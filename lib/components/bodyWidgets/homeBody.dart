// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/View/ProductDetails_screen.dart';
import 'package:mainpage_detailuser_v1/ViewModel/Category_View_Model.dart';
import 'package:mainpage_detailuser_v1/ViewModel/product_view_Model.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  CategoryViewModel categoryViewModel = CategoryViewModel();
  ProductViewModel productViewModel = ProductViewModel();

  @override
  void initState() {
    super.initState();
    categoryViewModel.fetch_List_Category();
  }

  int selectedCategoryIndex = -1;
  String selectedCategoryName = 'Sản phẩm';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ChangeNotifierProvider(
            create: (context) => categoryViewModel,
            child: Column(
              children: [
                productTitle(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: categoryListView(),
                ),
                Expanded(
                  child: ChangeNotifierProvider(
                    create: (context) => productViewModel,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: productListView(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 80,
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
                    productViewModel.fetch_Product_Details(category.iDLoai);
                  });

                  if (category.iDLoai == 0) {
                    productViewModel.fetch_Product_Card_List();
                  } else {
                    productViewModel.fetch_Product_Details(category.iDLoai);
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Animation transfer delay: 0,5s -⁠ ฅ^•ﻌ•^ฅ
                    AnimatedContainer(
                      duration: const Duration(
                          milliseconds: 200), // Recommended:  0,3 - 0,5

                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(2),

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
                              "http://backendflutter2024.somee.com/public/imgs/${product.imgUrl.toString()}",
                              width: 120,
                              height: 120, errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            })
                          : Text(
                              "http://backendflutter2024.somee.com/public/imgs/${product.imgUrl.toString()}",
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



// // ignore: must_be_immutable
// class HomeBody extends StatefulWidget {
//   late Product? product;

//   HomeBody({super.key, this.product});

//   @override
//   _HomeBodyState createState() => _HomeBodyState();
// }

// class _HomeBodyState extends State<HomeBody> {
//   //static const String iconAddress = "lib/public/icons/category/";

//   //
//   ProductViewModel productViewModel = ProductViewModel();
//   CategoryViewModel categoryViewModel = CategoryViewModel();

//   @override
//   void initState() {
//     super.initState();
//     productViewModel.fetch_Product_Card_List();
//     categoryViewModel.fetch_List_Category();
//   }

//   // select item: (default)
//   int selectedCategortItem = 0;
//   int selectProductItem = 0;
//   //demo:
//   int price = 10;
//   String unit = 'Đ';

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//         child: ChangeNotifierProvider(
//         create: (context) => categoryViewModel,
//         child:
//         Column(
//           children: [
//             productTitle(),
//             categoryListView(),
//           ],
//         ),
//         )),
//         Expanded(
//           child: ChangeNotifierProvider(
//           create: (context) => productViewModel,
//           child: productListView(),
//         )),
//       ],
//     );
//   }

// /*
//       ****************** widgets start ******************
// */

// // Title page:
//   Widget productTitle() {
//     String selectedCategory = 'Sản phẩm'; // default
//     return Consumer<CategoryViewModel>(
//       builder: (context, viewModel, child) {
//         // => chưa có repon từ endpoit >>> loading.gif
//         if (viewModel.categorys.isEmpty) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         // show product info:
//         else {
//           return GridView.builder(
//             // update: GridView.Count => GridView.builder
//             // Use: (hướng dẫn sử zụn)
//             itemCount: viewModel.categorys.length, // số lượng items
//             // build gird: items positions
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, // col (2 cột như trên figma nhóa !)
//               childAspectRatio: 4 /
//                   5, // chiều rộng dài của mỗi item (để đại i, theo ông bà mách bảo :3 !!)
//             ),
//             itemBuilder: (context, index) {
//               // Get: product
//               final Categorys = viewModel.categorys[index];
//               return Container(
//                       margin: const EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 0),
//                       padding: const EdgeInsets.all(5),
//                       child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                       const Align(
//             alignment: Alignment.topLeft,
//             child: Text(
//               'èn choai nêu prồ đúch',
//               style: TextStyle(
//                 color: Color(0xFF152354),
//                 fontSize: 30,
//               ),
//               textAlign: TextAlign.left,
//             ),
//           ),
//                       Align(
//             alignment: Alignment.topLeft,
//             child: Text(
//               selectedCategory, // Hiển thị nội dung đã thay đổi dựa trên icon được chọn
//               style: const TextStyle(
//                 color: Color(0xFF152354),
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.left,
//             ),
//           ),
//         ],
//       ),
//     );
//             },
//           );
//         }
//       },
//     );
//   }

// // Category Items:
//   Widget categoryListView() {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 2),
//       height: 80,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categorys.length,
//         itemBuilder: (BuildContext context, int index) {
//           return 
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedCategortItem = index;
//               });
//             },
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Animation transfer delay: 0,5s -⁠ ฅ^•ﻌ•^ฅ
//                 AnimatedContainer(
//                   duration: const Duration(
//                       milliseconds: 200), // Recommended:  0,3 - 0,5

//                   padding: const EdgeInsets.all(5),
//                   margin: const EdgeInsets.all(2),

//                   width: 100,
//                   height: 100,

//                   decoration: BoxDecoration(
//                     color: selectedCategortItem == index
//                         ? const Color(0xFF69BDFC)
//                         : const Color(0xFFD9D9D9),
//                     shape: BoxShape.circle,
//                   ),

//                   child: Center(
//                     child: Image.asset(
//                       category[index].logo,
//                       width: 60,
//                       height: 60,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );

//         },
//       ),
//     );
//   }

// // Products Items:
//   Widget productListView() {
//     return Consumer<ProductViewModel>(
//       builder: (context, viewModel, child) {
//         // => chưa có repon từ endpoit >>> loading.gif
//         if (viewModel.productCards.isEmpty) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         // show product info:
//         else {
//           return GridView.builder(
//             // update: GridView.Count => GridView.builder
//             // Use: (hướng dẫn sử zụn)
//             itemCount: viewModel.productCards.length, // số lượng items
//             // build gird: items positions
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, // col (2 cột như trên figma nhóa !)
//               childAspectRatio: 4 /
//                   5, // chiều rộng dài của mỗi item (để đại i, theo ông bà mách bảo :3 !!)
//             ),
//             itemBuilder: (context, index) {
//               // Get: product
//               final product = viewModel.productCards[index];
//               return GestureDetector(
//                 onTap: () {
//                   // To do: Click >>> page details hê hê
//                   final List<String> Urls = [
//                     // // Category(id, Name, location + Logo) - ฅ^•ﻌ•^ฅ
//                     // product.imgUrl.toString()
//                   ];
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ProductDetailPage(
//                           key: ValueKey('product_detail_page_$index'),
//                           productName: product.tenSP.toString(),
//                           productDescription: "hê hê",
//                           productImages: Urls,
//                           ProductDetail: product.iDSP.toString()),
//                     ),
//                   );
//                 },
//                 child: Card(
//                   child: Column(
//                     children: [
//                       // Img product:
//                       product.imgUrl != null
//                           ? Image.network(
//                                "http://backendflutter2024.somee.com/public/imgs/${product.imgUrl.toString()}",
//                               width: 120,
//                               height: 120, errorBuilder: (BuildContext context,
//                                   Object exception, StackTrace? stackTrace) {
//                               return const Center(
//                                   child: CircularProgressIndicator());
//                             })
//                           :  Text(
//                               "http://backendflutter2024.somee.com/public/imgs/${product.imgUrl.toString()}",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                       // Name Product:
//                       Text(
//                         product.tenSP ?? "sp này hôk có tên á",
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       // Price Product:
//                       Text(
//                         'Giá: ${product.giaBan} $unit',
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }

// /*
//       ****************** widgets end ******************
// */
// }
