import 'package:flutter/cupertino.dart';

class RecomendationsBlock extends StatefulWidget {
  const RecomendationsBlock({super.key});

  @override
  State<RecomendationsBlock> createState() => _RecomendationsBlockState();
}

class _RecomendationsBlockState extends State<RecomendationsBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 241,
      margin: const EdgeInsets.only(top: 1),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 120,
                  child: Image.asset(
                    'assets/imgs/Kirkjufell-volcano.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Image.asset(
                    'assets/imgs/Kirkjufell-volcano.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 1,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 120,
                  child: Image.asset(
                    'assets/imgs/Kirkjufell-volcano.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Image.asset(
                    'assets/imgs/Kirkjufell-volcano.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 1,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 120,
                  child: Image.asset(
                    'assets/imgs/Kirkjufell-volcano.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Image.asset(
                    'assets/imgs/Kirkjufell-volcano.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
