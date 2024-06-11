import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';

import '../../../main_store/main_state.dart';
import '../../../res/colors_app.dart';
import '../../../view_model/purchases_state.dart';

class SubscriptionCard extends StatelessWidget {
  late PurchasesState purchasesState;
  int index;

  SubscriptionCard(this.index);

  @override
  Widget build(BuildContext context) {
    purchasesState = Provider.of<MainState>(context).purchasesState;
    ProductDetails productDetails = purchasesState.subscriptions[index];
    TextTheme theme = Theme.of(context).textTheme;
    // TODO: implement build
    return Observer(
        builder: (_) => InkWell(
            onTap: () {
              purchasesState.addCurrentSubs(index);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: blue.withOpacity(0.1),
                  border: Border.all(
                    color: purchasesState.currentIndexSubs.value == index
                        ? blue
                        : Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.symmetric(vertical: 8),
              width: double.maxFinite,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productDetails.title,
                        style: theme.titleSmall!.copyWith(color: blue),
                      ),
                      Text(
                        "Obten la ${productDetails.title} por ${productDetails.price}",
                        style: theme.bodyMedium!.copyWith(color: blue),
                      ),
                    ],
                  )),
            )));
  }
}
