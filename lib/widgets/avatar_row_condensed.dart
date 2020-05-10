import 'package:familiarise/data/sentiment.dart';
import 'package:familiarise/utils/format_last_update_timestamp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double _avatarSize = 90;
const double _sentimentIconSize = 70;

class AvatarRowCondensed extends StatelessWidget {
  final Sentiment avatarSentiment;
  final String name;
  final ImageProvider image;
  final DateTime lastStatusUpdate;
  final DateTime now;

  const AvatarRowCondensed({
    Key key,
    @required this.avatarSentiment,
    @required this.name,
    @required this.image,
    @required this.lastStatusUpdate,
    @required this.now,
  })  : assert(avatarSentiment != null),
        assert(name != null),
        assert(image != null),
        assert(lastStatusUpdate != null),
        assert(now != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            avatarSentiment.colors.startColor,
            avatarSentiment.colors.endColor
          ],
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: _avatarSize,
              height: _avatarSize,
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(_avatarSize / 2),
                ),
                border: Border.all(
                  color: CupertinoColors.white,
                  width: 4.0,
                ),
              ),
            ),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 20,
                ),
                softWrap: true,
              ),
            ),
            Column(
              children: <Widget>[
                Center(
                  child: FaIcon(
                    avatarSentiment.icon,
                    size: _sentimentIconSize,
                    color: CupertinoColors.white,
                  ),
                ),
                Center(
                    child: Text(
                  formatLastUpdateTimestamp(lastStatusUpdate, now),
                  style: const TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 12,
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
