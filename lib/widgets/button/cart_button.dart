import 'package:flutter/cupertino.dart';

import 'touchable_opacity.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      child: TouchableOpacity(
        child: SizedBox(),
        /*
        SvgPicture.asset(
          DIcons.cart,
          width: 32.ws,
          height: 32.ws,
        )*/
        onPressed: () async {
          //Get.toNamed(AppRoutes.MY_CART);
          // Get.toNamed(AppRoutes.OPTION_BOOKING);
          // final storage = Get.find<TravelStorage>();
          // final user = await storage.getUserInfo();
          // final target = TUser(
          //   huraId: 4222124651674397,
          //   phone: "0101223344",
          // );
          // Get.find<PlatformChannel>().openChatConversation(user);
          // Get.find<PlatformChannel>().openChatWithUser(user!, target);
          //Get.snackbar("Thông báo", "Tính năng đang được đấu nối", colorText: getColor().textColorWhite, backgroundColor: getColor().themeColorFF6F15);
        },
      ),
    );
  }
}
