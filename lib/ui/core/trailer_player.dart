import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reelhub/ui/core/custom_icon.dart';
import 'package:reelhub/utils/constants/icon_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:reelhub/data/models/trailer/trailer_model.dart';

class TrailerPlayer extends StatefulWidget {
  final Trailer trailer;

  const TrailerPlayer(this.trailer, {super.key});

  @override
  State<TrailerPlayer> createState() => _TrailerPlayerState();
}

class _TrailerPlayerState extends State<TrailerPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) return;

    _controller = YoutubePlayerController(
      initialVideoId: widget.trailer.key,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: true,
      ),
    );
  }

  Future<void> _launchYoutube() async {
    final url = Uri.parse(widget.trailer.youtubeUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  void deactivate() {
    if (Platform.isAndroid) return super.deactivate();

    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    if (!Platform.isAndroid) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return GestureDetector(
        onTap: _launchYoutube,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              widget.trailer.youtubeThumbnail,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 56,
              height: 56,
              child: CustomIcon(path: CustomIcons.play, color: Colors.white),
            ),
          ],
        ),
      );
    }

    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: false,
      onEnded: (metaData) {
        _controller.seekTo(Duration.zero);
        _controller.pause();
      },
      bottomActions: [
        CurrentPosition(),
        ProgressBar(
          isExpanded: true,
          colors: ProgressBarColors(
            backgroundColor: Colors.white,
            playedColor: Colors.red,
            bufferedColor: Colors.grey,
            handleColor: Colors.red,
          ),
        ),
        RemainingDuration(),
      ],
    );
  }
}
