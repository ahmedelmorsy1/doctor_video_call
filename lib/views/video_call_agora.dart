import 'package:doctor2/components/barrel_file.dart';


class VideoCallAgora extends ChangeNotifier {
  

  Future<void> initAgora() async {
    await [Permission.microphone, Permission.camera].request();
    engine = createAgoraRtcEngine();
    await engine.initialize(const RtcEngineContext(
        appId: appId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting));
    engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint('local user ${connection.localUid} joined');
          
            localUserJoined = true;
            notifyListeners();
          
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint('remote user $remoteUid Joined');
          
            remoteUId = remoteUid;
          notifyListeners();
        },
        onUserOffline: (connection, remoteUid, reason) {
          debugPrint('remote user $remoteUid left channel');
          
            remoteUId = null;
          notifyListeners();
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );
    await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await engine.enableVideo();
    await engine.startPreview();

    await engine.joinChannel(
        token: tempToken,
        channelId: channelName,
        uid: 0,
        options: const ChannelMediaOptions());
  }
}