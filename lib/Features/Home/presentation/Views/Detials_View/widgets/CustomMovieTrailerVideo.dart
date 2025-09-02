import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomMovieTrailerVideo extends StatelessWidget {
  final String youtubeUrl;
  const CustomMovieTrailerVideo({super.key, required this.youtubeUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final videoId = YoutubePlayer.convertUrlToId(youtubeUrl);
        if (videoId == null) return;

        showDialog(
          context: context,
          builder: (context) => Center(
            child: Dialog(
              backgroundColor: Colors.black,
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 100,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                height: 250, // ارتفاع الفيديو
                child: YoutubePlayerDialog(videoId: videoId),
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.amber.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.amber, width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.play_arrow, color: Colors.white, size: 26),
            SizedBox(width: 8),
            Text(
              'Trailer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YoutubePlayerDialog extends StatefulWidget {
  final String videoId;
  const YoutubePlayerDialog({super.key, required this.videoId});

  @override
  State<YoutubePlayerDialog> createState() => _YoutubePlayerDialogState();
}

class _YoutubePlayerDialogState extends State<YoutubePlayerDialog> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              _controller.pause(); // وقف الفيديو قبل إغلاق Dialog
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
