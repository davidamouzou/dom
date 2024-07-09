import 'package:dom/data/reciper_appetizers.dart';
import 'package:dom/data/reciper_desserts.dart';
import 'package:dom/model/reciper_model.dart';
import 'package:dom/widgets/cupertino_icon_button.dart';
import 'package:dom/widgets/reciper_card.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _listCategories = ['All', 'Appetizers', 'Dessert', 'Main course'];
  int categoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(height: 68, items: [
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CupertinoTheme.of(context).primaryColor,
              ),
              child: Icon(
                CupertinoIcons.square_stack_3d_down_dottedline,
                color: CupertinoTheme.of(context).barBackgroundColor,
              ),
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_favorites),
            label: "Save",
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Save",
          ),
        ]),
        tabBuilder: (context, index) {
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
                        CupertinoIcons.settings,
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
                        children: [
                          for (int i = 0; i < _listCategories.length; i++)
                            GestureDetector(
                              onTap: () => setState(() {
                                categoryIndex = i;
                              }),
                              child: Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: i == categoryIndex
                                      ? CupertinoTheme.of(context).primaryColor
                                      : null,
                                  border: i == categoryIndex
                                      ? null
                                      : Border.all(width: 0.4),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Text(
                                  _listCategories[i],
                                  style: TextStyle(
                                    color: i == categoryIndex
                                        ? CupertinoTheme.of(context)
                                            .barBackgroundColor
                                        : null,
                                  ),
                                ),
                              ),
                            )
                        ],
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
            ),
          );
        });
  }
}
