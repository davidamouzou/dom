import 'package:cached_network_image/cached_network_image.dart';
import 'package:dom/model/reciper_model.dart';
import 'package:dom/widgets/cupertino_icon_button.dart';
import 'package:flutter/cupertino.dart';

class DetailReciper extends StatelessWidget {
  const DetailReciper({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: returnContent(context),
    );
  }

  Widget returnContent(BuildContext context) {
    final reciper = ModalRoute.of(context)!.settings.arguments as Reciper;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height / 2,
                width: MediaQuery.sizeOf(context).width,
                imageUrl: reciper.images[0],
              ),
              Positioned(
                top: 64,
                left: 12,
                right: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoIconButton(
                      onTap: () => Navigator.pop(context),
                      icon: const Icon(
                        CupertinoIcons.back,
                        color: CupertinoColors.black,
                      ),
                    ),
                    const CupertinoIconButton(
                      icon: Icon(
                        CupertinoIcons.square_favorites_alt,
                        color: CupertinoColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reciper.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: reciper.authorPhoto,
                      imageBuilder: (context, imageProvider) => Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: CupertinoColors.black.withOpacity(.1),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: CupertinoColors.black.withOpacity(.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(reciper.authorName)
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                    'Lorem input est une suit de mots sans signification utiliser'
                    'pour la mise en forme d\'une page, le text original sera remplacer lorsqu\'il sera pret'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
