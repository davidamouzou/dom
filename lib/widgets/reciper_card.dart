import 'package:cached_network_image/cached_network_image.dart';
import 'package:dom/model/reciper_model.dart';
import 'package:flutter/cupertino.dart';

class ReciperCard extends StatelessWidget {
  final Reciper reciper;
  const ReciperCard({super.key, required this.reciper});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          'detail_reciper',
          arguments: reciper,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: reciper.images[0],
              imageBuilder: (context, imageProvider) => Container(
                width: MediaQuery.sizeOf(context).width / 1.4,
                height: MediaQuery.sizeOf(context).width / 1.8,
                decoration: BoxDecoration(
                  color: CupertinoColors.black.withOpacity(.1),
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                width: MediaQuery.sizeOf(context).width / 1.5,
                height: MediaQuery.sizeOf(context).width / 1.8,
                decoration: BoxDecoration(
                  color: CupertinoColors.black.withOpacity(.1),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              reciper.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
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
            )
          ],
        ),
      ),
    );
  }
}
