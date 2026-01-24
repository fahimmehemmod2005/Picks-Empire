import 'package:fdahunter/app/routes/route_name.dart';
import 'package:fdahunter/app/widgets/main_button.dart';
import 'package:fdahunter/app/widgets/my_scaffold.dart';
import 'package:fdahunter/app/widgets/widget_header.dart';
import 'package:fdahunter/core/constant/app_color.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:fdahunter/core/constant/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/features_list.dart';
import '../widgets/payment_method.dart';
import '../widgets/promo_code_field.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final _promoCode = TextEditingController();
  @override
  void dispose() {
    _promoCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetHeader(
                title: "Confirmation",
                width: 80.w,
                moreButton: true,
                onTap: () {},
              ),
              AppSizeBox.height20,
              FeaturesList(),
              AppSizeBox.height20,
              Text(
                "Choose Payment Method",
                style: AppTextStyles.size18w700(color: Colors.white),
              ),
              AppSizeBox.height20,
              PaymentMethod(),
              AppSizeBox.height20,
              PromoCodeField(
                controller: _promoCode,
                applyTap: () {
                  print('Promo Code: ${_promoCode.text.toString().trim()}');
                },
              ),
              AppSizeBox.height20,
              Text(
                "Payment Details",
                style: AppTextStyles.size18w700(color: Colors.white),
              ),
              AppSizeBox.height20,
              Text(
                "Payment Details",
                style: AppTextStyles.size16w700(color: Colors.white),
              ),
              AppSizeBox.height10,
              _buildRow(type: 'Price',amount: '\$119.98'),
              AppSizeBox.height5,
              _buildRow(type: 'Tax',amount: '\$1.5'),
              AppSizeBox.height5,
              _buildRow(type: 'App fee',amount: '\$1'),
              AppSizeBox.height5,
               Divider(color: AppColor.label,),
              AppSizeBox.height5,
              _buildRow(type: 'Total',amount: '\$122.48'),
              AppSizeBox.height30,
              MainButton(
                label: 'Pay Now',
                onTap: (){
                  Navigator.pushNamed(context, RouteName.successPaymentScreen);
                },
              ),
              AppSizeBox.height10,
            ],
          ),
        ),
      ),
    );
  }

  Row _buildRow({String? type, String? amount}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(type ?? "",style: TextStyle(color: Colors.white),),
        Text(amount ?? "",style: TextStyle(color: Colors.white),)
      ],
    );
  }
}
