import 'package:dom/data/reciper_appetizers.dart';
import 'package:dom/data/reciper_desserts.dart';
import 'package:dom/model/reciper_model.dart';
import 'package:dom/widgets/cupertino_icon_button.dart';
import 'package:dom/widgets/reciper_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _listCategories = ['All', 'Appetizers', 'Dessert', 'Main course'];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.white,
          border: Border.all(
            width: 0,
            color: CupertinoColors.white,
          ),
          leading: const SizedBox(
            width: 64,
            child: Row(
              children: [
                CupertinoIconButton(
                  icon: Icon(
                    CupertinoIcons.back,
                    size: 20,
                    color: CupertinoColors.black,
                  ),
                )
              ],
            ),
          ),
          trailing: const SizedBox(
            width: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoIconButton(
                  icon: Icon(
                    Icons.more_horiz_outlined,
                    size: 20,
                    color: CupertinoColors.black,
                  ),
                )
              ],
            ),
          ),
          middle: const Text("Reciper are generated"),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Sweet corn and sugar recipe",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _listCategories
                        .map((e) => Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.4),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Text(e),
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Dessert",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: dessertReciper
                        .map(
                          (json) => ReciperCard(
                            reciper: Reciper.fromJson(json),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Appetizers",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: appatizersReciper
                        .map(
                          (json) => ReciperCard(
                            reciper: Reciper.fromJson(json),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
