import 'dart:io';

import 'package:dimplom/model/course/enrolled_course_model.dart';
import 'package:dimplom/model/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../components/tools_card.dart';

class LearningCourseScreen extends StatefulWidget {
  final EnrolledCourseModel? courseId;
  final String? initURL;
  const LearningCourseScreen({Key? key, this.courseId, this.initURL})
      : super(key: key);

  @override
  State<LearningCourseScreen> createState() => _LearningCourseScreenState();
}

class _LearningCourseScreenState extends State<LearningCourseScreen> {
  YoutubePlayerController? ytController;
  WebViewController? slideController;
  WebViewController? quizController;
  int sectionIndex = 0;
  int materialIndex = 0;
  int reportsIndex = 0;
  bool isLoading = true;
  String widgetType = '';
  bool isToolsVisible = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    Provider.of<ProfileViewModel>(context, listen: false)
        .getEnrolledById(widget.courseId!.id!)
        .whenComplete(() {
      setState(() {});
    });
    playYT();
    setState(() {
      isLoading = false;
    });
  }

  void playYT() {
    ytController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.courseId!.course!
          .sections![sectionIndex].materials![materialIndex].url!)!,
      flags: const YoutubePlayerFlags(
        useHybridComposition: false,
      ),
    );
  }

  @override
  void deactivate() {
    ytController!.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    ytController!.dispose();
    super.dispose();
  }

  checkProgress() {
    final enrolledData = Provider.of<ProfileViewModel>(context, listen: false);
    if (enrolledData.enrolledCourseData.progress != 100) {
      EasyLoading.showInfo(
        'Kamu Ada Diakhir Materi! Selesaikan Materi Yang Terlewat!',
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        '/successCourse',
        arguments: widget.courseId,
      );
    }
  }

  getMaterialType() {
    String materialType = widget.courseId!.course!.sections![sectionIndex]
        .materials![materialIndex].materialType!;
    if (materialType == 'video') {
      widgetType = '';
      isToolsVisible = true;
      ytController!.load(
        YoutubePlayer.convertUrlToId(widget.courseId!.course!
            .sections![sectionIndex].materials![materialIndex].url!)!,
      );
      setState(() {});
    }
    if (materialType == 'slide') {
      widgetType = 'slide';
      isToolsVisible = true;
      setState(() {});
    }
    if (materialType == 'quiz') {
      widgetType = 'quiz';
      isToolsVisible = false;
      setState(() {});
    }
  }

  nextVideo() {
    int materialLength =
        widget.courseId!.course!.sections![sectionIndex].materials!.length;
    int sectionLength = widget.courseId!.course!.sections!.length;

    if (materialIndex != materialLength - 1) {
      materialIndex++;
      reportsIndex++;
    } else if (sectionIndex != sectionLength - 1) {
      sectionIndex++;
      reportsIndex++;
      materialIndex = 0;
      playYT();
      setState(() {});
    } else {
      checkProgress();
    }
  }

  prevVideo() {
    int materialLength =
        widget.courseId!.course!.sections![sectionIndex].materials!.length;
    int sectionLength = widget.courseId!.course!.sections!.length;

    if (materialIndex != 0) {
      materialIndex--;
      reportsIndex--;
      getMaterialType();
      ytController!.load(
        YoutubePlayer.convertUrlToId(widget.courseId!.course!
            .sections![sectionIndex].materials![materialIndex].url!)!,
      );
      setState(() {});
    } else if (materialIndex == 0 && sectionIndex != 0) {
      sectionIndex--;
      materialIndex = materialLength - 1;
      reportsIndex--;
      getMaterialType();
      setState(() {});
    } else {
      return;
    }
  }

  slideView() {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.courseId!.course!.sections![sectionIndex]
            .materials![materialIndex].url!,
        onWebViewCreated: (controller) {
          controller = slideController!;
        },
      ),
    );
  }

  quizView() {
    String quizUrl = widget.courseId!.course!.sections![sectionIndex]
        .materials![materialIndex].url!;
    return Material(
      child: SizedBox(
        height: 450,
        width: double.infinity,
        child: WebView(
          userAgent: 'fake',
          gestureNavigationEnabled: true,
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: quizUrl,
          onWebViewCreated: (controller) {
            controller = quizController!;
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final enrolledData = Provider.of<ProfileViewModel>(context);
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: ytController!),
      builder: (context, player) {
        return Scaffold(
          endDrawer: Drawer(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: enrolledData
                              .enrolledCourseData.course?.sections?.length ??
                          0,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(enrolledData.enrolledCourseData.course!
                                .sections![index].sectionName!),
                            const SizedBox(height: 8),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: enrolledData.enrolledCourseData.course
                                      ?.sections?[index].materials?.length ??
                                  0,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 8),
                              itemBuilder: (context, subIndex) {
                                return ListTile(
                                  onTap: () {
                                    setState(() {
                                      sectionIndex = index;
                                      materialIndex = subIndex;
                                      final reportList = enrolledData
                                          .enrolledCourseData.reports;
                                      reportsIndex = reportList!.indexWhere(
                                        (i) =>
                                            i.material!.id ==
                                            widget
                                                .courseId!
                                                .course!
                                                .sections![sectionIndex]
                                                .materials![materialIndex]
                                                .id,
                                      );
                                      getMaterialType();
                                    });
                                  },
                                  tileColor: Colors.grey[200],
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  leading: enrolledData
                                              .enrolledCourseData
                                              .course!
                                              .sections![index]
                                              .materials![subIndex]
                                              .materialType ==
                                          'slide'
                                      ? const Icon(Icons.slideshow_rounded)
                                      : enrolledData
                                                  .enrolledCourseData
                                                  .course!
                                                  .sections![index]
                                                  .materials![subIndex]
                                                  .materialType ==
                                              'quiz'
                                          ? const Icon(
                                              Icons.history_edu_rounded)
                                          : const Icon(
                                              Icons.play_circle_filled_rounded),
                                  title: Text(
                                    enrolledData
                                        .enrolledCourseData
                                        .course!
                                        .sections![index]
                                        .materials![subIndex]
                                        .materialName!,
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(62, 158, 158, 158),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.chevron_left_outlined,
                      color: Color(0xFF126E64)),
                ),
              ),
            ),
            centerTitle: true,
            title: Text(
              widget.courseId!.course!.courseName!,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(62, 158, 158, 158),
                  child: Builder(builder: (context) {
                    return IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: const Icon(Icons.menu, color: Color(0xFF126E64)),
                    );
                  }),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isLoading)
                  widgetType == ''
                      ? player
                      : widgetType == 'slide'
                          ? slideView()
                          : widgetType == 'quiz'
                              ? quizView()
                              : widgetType = '',
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.courseId!.course!.sections![sectionIndex]
                            .materials![materialIndex].materialName!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          prevVideo();
                          getMaterialType();
                        },
                        child: const Text('Previous'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          nextVideo();
                          getMaterialType();
                        },
                        child: const Text('Next Video'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Consumer<ProfileViewModel>(
                          builder: (context, progress, child) {
                        if (progress.isLoadingData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return OutlinedButton.icon(
                            onPressed: () async {
                              await progress.updateCourseProgress(
                                widget.courseId!.id!,
                                widget.courseId!.reports![reportsIndex]
                                    .material!.id,
                              );
                              await Provider.of<ProfileViewModel>(context,
                                      listen: false)
                                  .getEnrolledById(widget.courseId!.id!);
                              setState(() {});
                            },
                            icon: enrolledData.enrolledCourseData
                                    .reports![reportsIndex].isCompleted!
                                ? const Icon(Icons.check_box)
                                : const Icon(Icons.check_box_outline_blank),
                            label: const Text('Complete'),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          );
                        }
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Visibility(
                  visible: isToolsVisible,
                  child: Row(
                    children: const [
                      Text(
                        'Tools Course',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isToolsVisible,
                  child: SizedBox(
                    width: double.infinity,
                    height: 290,
                    child: Consumer<ProfileViewModel>(
                      builder: (context, data, child) {
                        if (data.isLoadingData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount:
                                data.enrolledCourseData.course?.tools?.length ??
                                    0,
                            itemBuilder: (context, index) {
                              return ToolsCard(
                                toolsName: data.enrolledCourseData.course
                                    ?.tools![index].toolsName,
                                imgUrl: data.enrolledCourseData.course
                                    ?.tools![index].toolsIcon,
                                toolUrl: data.enrolledCourseData.course
                                    ?.tools?[index].url,
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
