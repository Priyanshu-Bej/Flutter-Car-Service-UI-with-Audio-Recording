import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class RecordPlayAudio extends StatefulWidget {
  const RecordPlayAudio({super.key});

  @override
  _RecordPlayAudioState createState() => _RecordPlayAudioState();
}

class _RecordPlayAudioState extends State<RecordPlayAudio> {
  final AudioRecorder _audioRecorder = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isRecording = false, _isPlaying = false, _isPaused = false;
  String? _filePath;
  double _progress = 0.0;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _requestPermission();
    _audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
        _isPaused = state == PlayerState.paused;
      });
    });
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
        _progress = _position.inSeconds / _duration.inSeconds;
      });
    });
    _audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        _duration = newDuration;
      });
    });
  }

  void _requestPermission() async {
    if (!(await _audioRecorder.hasPermission())) {
      _showPermissionDialog();
    }
  }

  Future<void> _toggleRecording() async {
    if (await _audioRecorder.isRecording()) {
      final path = await _audioRecorder.stop();
      _timer?.cancel();
      setState(() {
        _filePath = path;
        _isRecording = false;
        _progress = 0.0;
        _position = Duration.zero;
      });
    } else {
      final tempDir = (await getTemporaryDirectory()).path;
      final path = '$tempDir/my_recording.m4a';
      await _audioRecorder.start(const RecordConfig(), path: path);
      setState(() {
        _filePath = path;
        _isRecording = true;
        _position = Duration.zero;
      });
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _position += const Duration(seconds: 1);
        });
      });
    }
  }

  Future<void> _togglePlayback() async {
    if (_audioPlayer.state == PlayerState.playing) {
      await _audioPlayer.pause();
    } else if (_audioPlayer.state == PlayerState.paused) {
      await _audioPlayer.resume();
    } else if (_filePath != null) {
      await _audioPlayer.play(UrlSource(_filePath!));
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Microphone Permission'),
        content:
            const Text('This app requires microphone access to record audio.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        elevation: 10,
        shadowColor: Colors.grey[600],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Audio Recorder',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildActionButton(
                    context: context,
                    label: _isRecording ? 'Stop Recording' : 'Start Recording',
                    color: _isRecording ? Colors.red : Colors.green,
                    onPressed: _toggleRecording,
                  ),
                  const SizedBox(width: 20),
                  Text(
                      _isRecording
                          ? 'Recording...\n${_formatDuration(_position)}'
                          : 'Ready to record',
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                value: _progress,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              const SizedBox(height: 20),
              if (_filePath != null && !_isRecording)
                _buildActionButton(
                  context: context,
                  label: _isPlaying ? (_isPaused ? 'Resume' : 'Pause') : 'Play',
                  color: _isPlaying ? Colors.orange : Colors.blue,
                  onPressed: _togglePlayback,
                ),
              if (_isPlaying || _isPaused)
                Text(
                    'Playback: ${_formatDuration(_position)} / ${_formatDuration(_duration)}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color, // Ensuring text color is white for visibility
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(label),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    _audioRecorder.dispose();
    _audioPlayer.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
