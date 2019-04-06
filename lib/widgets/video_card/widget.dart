import 'package:dogetv_flutter/models/video.dart';
import 'package:dogetv_flutter/widgets/video_cover/widget.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  final bool heroEnable;

  const VideoCard({Key key, @required this.video, this.heroEnable = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(0),
              // elevation: 5,
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: VideoCover(
                        path: video.cover,
                        heroTag: heroEnable ? video.id : null),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        padding: EdgeInsets.all(2),
                        color: Colors.black.withAlpha(70),
                        child: Text(
                          video.state,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
            video.name,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ]);
  }
}
