import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../provider/looking_for_provider.dart';

class LookingForScreen extends StatefulWidget {
  const LookingForScreen({super.key});

  @override
  State<LookingForScreen> createState() => _LookingForScreenState();
}

class _LookingForScreenState extends State<LookingForScreen> {
  late LookingForProvider lookingForProvider;

  @override
  void initState() {
    super.initState();
    lookingForProvider = LookingForProvider();
    lookingForProvider =
        Provider.of<LookingForProvider>(context, listen: false);
    lookingForProvider.getList("1");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LookingForProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Peoples Looking For"),
        ),
        body: Container(
          color: Colors.grey.shade50,
          height: 130,
          child: Card(
            elevation: 4,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "776677",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RatingBar.builder(
                                  itemSize: 20,
                                  glow: true,
                                  initialRating: 2.5,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  // itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.grey.shade900),
                                      ),
                                      child: const Text(
                                        "Contains",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                      color: Colors.black38, height: 16, thickness: 2),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.flag),
                          Text("India"),
                        ],
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text("Fixed")),
                    ],
                  ),
                  const Divider(
                      color: Colors.black38, height: 16, thickness: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
