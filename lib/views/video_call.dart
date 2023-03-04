

import '../components/barrel_file.dart';

const String appId = '7a177150b17c40458085aad0a9240ca8';
const String channelName = 'dochelp';
const String tempToken =
    '007eJxTYDBe7ztntoGQp4986XnX7zpHdH84rz2toD5hyia5QuWMacEKDOaJhubmhqYGSYbmySYGJqYWBhamiYkpBomWRiYGyYkWps2LkhsCGRnSJGQZGRkgEMRnZ0jJT85IzSlgYAAAzTwdEg';

late RtcEngine engine;
int? remoteUId;
bool localUserJoined = false;

class VideoCall extends StatefulWidget {
  const VideoCall({Key? key}) : super(key: key);

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  @override
  void initState() {
    super.initState();
    VideoCallAgora().initAgora();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Call'),
      ),
      body: Stack(
        children: [
          Center(
            child: remoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,height: 150,
              child: Center(
                  child: localUserJoined
                      ? AgoraVideoView(
                          controller: VideoViewController(
                          rtcEngine: engine,
                          canvas: const VideoCanvas(uid: 0),
                        ))
                      : const CircularProgressIndicator()),
            ),
          )
        ],
      ),
    );
  }
}