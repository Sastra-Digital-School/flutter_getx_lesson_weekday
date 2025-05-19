import 'package:flutter_neumorphic/flutter_neumorphic.dart';

enum Side { TOP, FRONT, BACK, LEFTF, LEFTB, RIGHTF, RIGHTB }

class CustomNeumorphicRadio extends StatefulWidget {
  final void Function(int)? onChangedRound;
  final void Function(int)? onChangedTFB;

  const CustomNeumorphicRadio({
    super.key,
    this.onChangedTFB,
    this.onChangedRound,
  });

  @override
  State<CustomNeumorphicRadio> createState() => _CustomNeumorphicRadioState();
}

class _CustomNeumorphicRadioState extends State<CustomNeumorphicRadio> {
  Side side = Side.TOP;

  List<Side> sideTFB = [Side.FRONT, Side.TOP, Side.BACK];
  List<Side> sideList = [Side.LEFTF, Side.LEFTB, Side.RIGHTF, Side.RIGHTB];

  List<String> iconList = [
    'assets/car_item_icon/front.png',
    'assets/car_item_icon/top.png',
    'assets/car_item_icon/back.png',
  ];
  List<String> iconCarDoorList = [
    'assets/car_item_icon/car_door_back_left.png',
    'assets/car_item_icon/car_door_front_left.png',
    'assets/car_item_icon/car_door_front.png',
    'assets/car_item_icon/car_door_back.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      padding: const EdgeInsets.all(16),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        color: Colors.grey.shade300,
      ),
      child: Column(
        spacing: 10,
        children: [
          Row(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              sideTFB.length,
              (index) => NeumorphicRadio(
                groupValue: side,
                value: sideTFB[index],
                padding: const EdgeInsets.all(32),
                style: NeumorphicRadioStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                  unselectedColor: Colors.grey.shade300,
                ),
                child: Image.asset(iconList[index], height: 28),
                onChanged: (value) {
                  setState(() {
                    side = value!;
                  });
                  widget.onChangedTFB!(index);
                },
              ),
            ),
          ),
          Row(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              sideList.length,
              (index) => NeumorphicRadio(
                groupValue: side,
                padding: const EdgeInsets.all(16),
                style: NeumorphicRadioStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                  unselectedColor: Colors.grey.shade300,
                ),
                value: sideList[index],
                child: Image.asset(iconCarDoorList[index], height: 28),
                onChanged: (value) {
                  setState(() {
                    side = value!;
                  });
                  widget.onChangedRound!(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
