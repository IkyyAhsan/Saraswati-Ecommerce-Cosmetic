import 'package:flutter/material.dart';
import 'package:saraswati_application_project/features/personalization/models/user_model.dart';
import 'package:saraswati_application_project/features/shop/models/banner_model.dart';
import 'package:saraswati_application_project/features/shop/models/brand_model.dart';
import 'package:saraswati_application_project/features/shop/models/category_model.dart';
import 'package:saraswati_application_project/features/shop/models/product_model.dart';
import 'package:saraswati_application_project/routes/routes.dart';
import 'package:saraswati_application_project/utils/constants/image_strings.dart';

import 'package:saraswati_application_project/features/shop/models/banner_model.dart';
import 'package:saraswati_application_project/routes/routes.dart';
import 'package:saraswati_application_project/utils/constants/image_strings.dart';
import 'package:saraswati_application_project/features/shop/models/category_model.dart';
import 'package:saraswati_application_project/utils/constants/image_strings.dart';

class TDummyData{
  /// - Banners
  static final Set<BannerModel> banners = {
    BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.order, active: true),
    BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: true),
    BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.search, active: true),
    BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.settings, active: true),
  };

//   /// --User
//   static final UserModel user = UserModel(
//     id: '0001SC', 
//     firstName: 'Rizky Ahsan', 
//     lastName: 'Syarif', 
//     username: 'Iki', 
//     email: 'mrizkysyarif124@gmail.com', 
//     phoneNumber: '082248696800', 
//     profilePicture: TImages.user,
//     addresses: [
//       AddressModel(
//         id: '1',
//         name: 'Rizky Ahsan Syarif',
//         phoneNumber: '082248696800',
//         street: 'Jalan Sukapura No. 1',
//         city: 'Kab. Bandung',
//         state: 'Jawa Barat',
//         postalCode: '40267',
//         country: 'Indonesia',
//       ),
//       AddressModel(
//         id: '6',
//         name: 'Kemal Aziz',
//         phoneNumber: '089514002674',
//         street: 'Jalan Sukabirus',
//         city: 'Kab. Bandung',
//         state: 'Jawa Barat',
//         postalCode: '40267',
//         country: 'Indonesia',
//       ),
      
//     ]
//     );

//   /// -- Cart
//   static final CartModel cart = CartModel(
//     cartId: '001',
//     items: [
//       CartItemModel(
//         productId: '001',
//         variationId: '1',
//         quantity: 1,
//         title: products[0].title,
//         image: products[0].thumbnail,
//         brandName: products[0].brand!.name,
//         price: products[0].productVariations![0].price,
//         selectedVariation: products[0].productVariations![0].attributeValues,
//       ),
//       CartItemModel(
//         productId: '002',
//         variationId: '1',
//         quantity: 1,
//         title: products[1].title,
//         image: products[1].thumbnail,
//         brandName: products[1].brand!.name,
//         price: products[1].productVariations![1].price,
//         selectedVariation: products[1].productVariations![1].attributeValues,
//       ),
//     ]
//   );

//   /// -- Order
//   static final List<OrderModel> orders = [
//     OrderModel(
//       id: 'PN0001',
//       status: OrderStatus.processing,
//       items: cart.items,
//       totalAmount: 126.000,
//       orderDate: DateTime(2023, 12, 31),
//       deliveryDate: DateTime(2024, 01, 03)),
//     OrderModel(
//       id: 'PN0002',
//       status: OrderStatus.processing,
//       items: cart.items,
//       totalAmount: 565.000,
//       orderDate: DateTime(2023, 12, 31),
//       deliveryDate: DateTime(2024, 01, 03)),
//   ];



/// -- List of all Categories
  final List<CategoryModel> categories = [
  CategoryModel(id: '1', image: TImages.makeupIcon, name: 'Makeup', isFeatured: true),
  CategoryModel(id: '2', image: TImages.skincareIcon, name: 'Skincares', isFeatured: true),
  CategoryModel(id: '3', image: TImages.fragranceIcon, name: 'Fragrances', isFeatured: true),
  CategoryModel(id: '4', image: TImages.toolsIcon, name: 'Makeup tools', isFeatured: true),
  CategoryModel(id: '5', image: TImages.mensGroomingIcon, name: 'Mens Groomings', isFeatured: true),
  CategoryModel(id: '6', image: TImages.giftSetIcon, name: 'Gift Sets', isFeatured: true),
  CategoryModel(id: '7', image: TImages.indonesianProductIcon, name: 'Indonesia Products', isFeatured: true),
  CategoryModel(id: '8', image: TImages.travelSizeIcon, name: 'Travel Sizes', isFeatured: true),
  CategoryModel(id: '9', image: TImages.hairCareIcon, name: 'Hair Cares', isFeatured: true),
  ];

  /// -- List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(id: '1', name: 'Wardah', image: TImages.wardahLogo, productsCount: 255, isFeatured: true),
    BrandModel(id: '2', name: 'Emina', image: TImages.eminaLogo, productsCount: 216, isFeatured: true),
    BrandModel(id: '3', name: 'Sariayu', image: TImages.sariayuLogo, productsCount: 255, isFeatured: true),
    BrandModel(id: '4', name: 'Skintific', image: TImages.skintificLogo, productsCount: 54, isFeatured: true),
    BrandModel(id: '5', name: 'The Body Shop', image: TImages.theBodyShopLogo, productsCount: 125, isFeatured: true),
    BrandModel(id: '6', name: 'Maybelline', image: TImages.maybellineLogo, productsCount: 174, isFeatured: true),
    BrandModel(id: '7', name: 'NYX Proffesional', image: TImages.nyxLogo, productsCount: 255, isFeatured: true),
    BrandModel(id: '8', name: 'Loreal', image: TImages.lorealLogo, productsCount: 255, isFeatured: true),
    BrandModel(id: '9', name: 'Revlon', image: TImages.revlonLogo, productsCount: 255, isFeatured: true),
    BrandModel(id: '10', name: 'Dior', image: TImages.diorLogo, productsCount: 255, isFeatured: true),
    BrandModel(id: '11', name: 'Make Over', image: TImages.makeOverLogo, productsCount: 255, isFeatured: true),
  ];

//   /// -- List of all Brand Categories
//   static final List<BrandCategoryModel> brandCategory = [
//     BrandCategoriesModel(brandId: '1', categoryId: '1'),
//     BrandCategoriesModel(brandId: '2', categoryId: '1'),
//     BrandCategoriesModel(brandId: '3', categoryId: '2'),
//     BrandCategoriesModel(brandId: '4', categoryId: '2'),
//     BrandCategoriesModel(brandId: '3', categoryId: '2'),
//     BrandCategoriesModel(brandId: '2', categoryId: '3'),
//     BrandCategoriesModel(brandId: '1', categoryId: '3'),
//   ];

//   // -- List of all Product Categories
//   static final List<ProductCategoryModel> productCategories = [
//     ProductCategoryModel(productId: '001', categoryId: '1'),
//     ProductCategoryModel(productId: '001', categoryId: '2'),
//     ProductCategoryModel(productId: '002', categoryId: '1'),
//     ProductCategoryModel(productId: '002', categoryId: '4'),
//     ProductCategoryModel(productId: '003', categoryId: '3'),
//     ProductCategoryModel(productId: '003', categoryId: '6'),
//     ProductCategoryModel(productId: '004', categoryId: '5'),
//   ];

//   // -- List of all Product
//   static final List<ProductModel> products = [
//     ProductModel(
//       id: '001', 
//       title: 'Wardah Colorfit Velvet Matte Lip Ink', 
//       stock: 56, 
//       price: 135, 
//       thumbnail: TImages.productImage1, 
//       productType: productType,
//       description: 'Wardah Colorfit Velvet Matte Lip Ink',
//       brand: BrandModel(id: '1', name: 'Wardah', image: TImages.wardahLogo, productsCount: 255, isFeatured: true),
//       images: [TImages.productImage1, TImages.productImage1, TImages.productImage1, TImages.productImage1],
//       salePrice: 66.000,
//       sku: 'WRD3153',
//       categoryId: '1',
//       ProductAttributeModel(name: 'Color', values: ['01 Brown Dreamer', '02 Joyful Orange', '03 Rose Ballerina', '04 Pink Sweetheart']),
//       ),
//     ProductModel(
//       id: '002', 
//       title: 'Wardah Colorfit Velvet Matte Lip Ink', 
//       stock: 56, 
//       price: 135, 
//       thumbnail: TImages.productImage1, 
//       productType: productType,
//       description: 'Wardah Colorfit Velvet Matte Lip Ink',
//       brand: BrandModel(id: '1', name: 'Wardah', image: TImages.wardahLogo, productsCount: 255, isFeatured: true),
//       images: [TImages.productImage1, TImages.productImage1, TImages.productImage1, TImages.productImage1],
//       salePrice: 66.000,
//       sku: 'WRD3153',
//       categoryId: '1',
//       ProductAttributeModel(name: 'Color', values: ['01 Brown Dreamer', '02 Joyful Orange', '03 Rose Ballerina', '04 Pink Sweetheart']),
//       ),
//   ];




}