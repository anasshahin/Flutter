import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/View/Screens/AdminDashboard/view/Edits/Product/edit_product.dart';
import 'package:sdk_09_2021_e_commerce/View/Screens/Auth/forgot_email_and_password.dart';
import 'package:sdk_09_2021_e_commerce/View/Screens/Home/InnerPages/cart_view.dart';
import 'package:sdk_09_2021_e_commerce/View/Screens/Pymanet/online/credit_card_page.dart';
import 'package:sdk_09_2021_e_commerce/View/Screens/Pymanet/online/payment_success_page.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/address_model.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/order_item.dart';
import 'package:sdk_09_2021_e_commerce/core/Model/payment_success_model.dart';
import 'route_constant.dart';
import 'package:sdk_09_2021_e_commerce/lib_organizer.dart';

class MyRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initRoute:
        {
          return _route(SplashScreen());
        }

      case loginRoute:
        {
          return _route(LoginScreen());
        }

      case forgetPasswordRoute:
        {
          return _route(ForgotPasswordScreen());
        }

      case signUpRoute:
        {
          return _route(RegisterScreen());
        }

      case homeRoute:
        {
          return _route(HomeScreen());
        }
      case cartRoute:
        {
          return _route(Scaffold(
            body: CartView(),
          ));
        }
      case shippingAddress:
        {
          return _route(ShippingAddress());
        }
      case orderHistory:
        {
          return _route(OrderHistory());
        }
      case orderDetails:
        {
          return _route(OrderDetails());
        }

      case productDetailRoute:
        {
          final arg = settings.arguments as ProductModel;
          return _route(ProductDetailView(
            model: arg,
          ));
        }

      case deliveryCheckoutRoute:
        {
          return _route(CheckoutDeliveryScreen());
        }

      case addressCheckoutRoute:
        {
          return _route(const CheckoutAddressScreen());
        }

      case summeryCheckoutRoute:
        {
          final arg = settings.arguments as AddressModel;
          return _route(CheckoutSummeryScreen(
            model: arg,
          ));
        }

      case adminPanelRoute:
        {
          return _route(const AdminDashboard());
        }

      case categoryDetailsRoute:
        {
          final arg = settings.arguments as CategoryDetailModel;
          return _route(CategoryDetailsView(
            categoryName: arg.categoryName,
            productList: arg.productList,
          ));
        }

      // Admin Panel inner Routes
      case adminCategoryMainRoute:
        {
          return _route(CategoriesMainScreen());
        }

      case adminCategoryAddRoute:
        {
          return _route(AddCategoriesScreen());
        }

      case adminCategoryEditRoute:
        {
          final arg = settings.arguments as CategoryModel;
          return _route(EditCategoriesScreen(
            model: arg,
          ));
        }

      case adminProductMainRoute:
        {
          return _route(ProductMainScreen());
        }

      case onlinePayment:
        {
          final arg = settings.arguments as double;
          return _route(CreditCardPage(
            amount: arg,
          ));
        }

      case cashPayment:{
        final arg = settings.arguments as OrderItem;
        return _route(Container());
      }

      case paymentSuccess:{
        final arg = settings.arguments as PaymentSuccessModel;
        return _route(PaymentSuccessPage(model: arg,));
      }

      case adminProductAddRoute:
        {
          return _route(AddProductsScreen());
        }

      case adminProductEditRoute:
        {
          final arg = settings.arguments as ProductModel;
          return _route(EditProductsScreen(
            model: arg,
          ));
        }

      case adminUserMainRoute:
        {
          return _route(UsersMainScreen());
        }

      default:
        {
          final arg = settings.name as String;
          return _route(UndefineRoute(routeName: arg));
        }
    }
  }

  static MaterialPageRoute _route(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}

class UndefineRoute extends StatelessWidget {
  const UndefineRoute({Key? key, required this.routeName}) : super(key: key);
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This $routeName is Undefine Route',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.grey.shade700),
        ),
      ),
    );
  }
}
