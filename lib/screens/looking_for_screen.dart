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
  int count = 0;
  late LookingForProvider lookingForProvider;
  bool selected = false;

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
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Card(
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
                                      onPressed: () {
                                        setState(() {
                                          selected = !selected;
                                        });
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.grey.shade900),
                                      ),
                                      child: const Text(
                                        "Containsa",
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
          SizedBox(
            height: 100,
            child: Card(
              child: Stack(
                children: [
                  Positioned(
                    right: 10.0,
                    top: 10.0,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            count++;
                            if (count > 3) count = 0;
                            print("count = $count");
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade900),
                        ),
                        child: const Text(
                          "Contains",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                  ),
                  Positioned(
                    top: 24,
                    right: 120,
                    child: RatingBar.builder(
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
                  ),
                  // AnimatedAlign(
                  //   alignment: Alignment.centerLeft,
                  //   duration: Duration(seconds: 1),
                  //   curve: Curves.fastOutSlowIn,
                  //   child: Text("Fixed"),
                  // ),
                  AnimatedAlign(
                    duration: const Duration(seconds: 1),
                    alignment:
                        selected ? Alignment.center : Alignment.centerLeft,
                    curve: Curves.fastOutSlowIn,
                    child: const Text(
                      "776677",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  const Positioned(
                    left: 10,
                    child: Divider(
                        color: Colors.black38, height: 16, thickness: 2),
                  ),
                ],
              ),
            ),
          ),
          IndexedStack(
            index: count,
            children: [
              Container(
                height: 150,
                color: Colors.green,
              ),
              Container(
                height: 100,
                color: Colors.blue,
              ),
              Container(
                height: 50,
                color: Colors.red,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
