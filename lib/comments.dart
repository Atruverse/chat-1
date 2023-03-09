// import 'package:atroverse/core/Global/Widgets/back_button.dart';
// import 'package:atroverse/core/Global/Widgets/global_loading.dart';
// import 'package:atroverse/core/Global/Widgets/title.dart';
// import 'package:atroverse/core/base/library.dart';
// import 'package:atroverse/features/Music/Controllers/comment.dart';
// import 'package:atroverse/features/Music/Widgets/comment.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class Comments extends BaseView<CommentController> {
//   const Comments({super.key});

//   @override
//   Widget body(BuildContext context) {
//     return controller.isPageLoading.value
//         ? const GlobalLoadingWidget()
//         : Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               automaticallyImplyLeading: false,
//               title: Row(
//                 children: [GlobalBackButton(), GlobalTitle(text: 'Comments')],
//               ),
//             ),

//             /// The whole page is wrapped within a <code>NotificationListener</code>
//             /// to listen for scroll notifications in order to load more data if needed.
//             body: NotificationListener(
//               onNotification: (ScrollNotification notification) {
//                 if (notification is ScrollUpdateNotification) {
//                   if (controller.scrollController.position.pixels >
//                           controller.scrollController.position.maxScrollExtent -
//                               30 &&
//                       !controller.isPageLoadingMore.value) {
//                     controller.loadComments();
//                   }
//                 }
//                 return true;
//               },
//               child: RefreshIndicator(
//                 onRefresh: () async {
//                   controller.loadComments(refresh: true);
//                 },
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         bottom: 100, right: 30, left: 30, top: 30),
//                     child: ListView(
//                       controller: controller.scrollController,
//                       children: [
//                         SizedBox(
//                           width: Get.width,
//                           child: ListView.builder(
//                               physics: const NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: controller.comments.length,
//                               itemBuilder: (context, index) {
//                                 if (controller.comments[index].isReply) {
//                                   return ReplyComment(
//                                     dateData: controller.timeDifference(
//                                         controller
//                                             .comments[index].creationDate),
//                                     content: controller.comments[index].content,
//                                     image: controller
//                                         .comments[index].commenterImage,
//                                     username: controller
//                                         .comments[index].commenterUsername,
//                                   );
//                                 } else {
//                                   return ParentComment(
//                                     dateData: controller.timeDifference(
//                                         controller
//                                             .comments[index].creationDate),
//                                     id: controller.comments[index].id,
//                                     index: index,
//                                     onTap: controller.replay,
//                                     content: controller.comments[index].content,
//                                     image: controller
//                                         .comments[index].commenterImage,
//                                     username: controller
//                                         .comments[index].commenterUsername,
//                                   );
//                                 }
//                               }),
//                         ),
//                         Visibility(
//                           visible: controller.isPageLoadingMore.value,
//                           child: Center(
//                             child: GlobalLoadingWidget(
//                               size: 50.r,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             bottomSheet: Container(
//               margin: const EdgeInsets.only(bottom: 20),
//               color: Colors.white,
//               child: SizedBox(
//                 width: Get.width,
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 25,
//                         backgroundColor: Colors.grey,
//                         child: CircleAvatar(
//                           radius: 24,
//                           backgroundColor: Colors.grey[100],
//                           backgroundImage:
//                               NetworkImage(controller.userProfileImage),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: Container(
//                           padding: const EdgeInsets.only(right: 16),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30),
//                             color: Colors.transparent,
//                             border: Border.all(
//                               color: Colors.grey,
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: TextField(
//                                   controller: controller.commentFieldController,
//                                   minLines: 1,
//                                   maxLines: 3,
//                                   cursorColor: Colors.blue,
//                                   decoration: const InputDecoration(
//                                     contentPadding: EdgeInsets.symmetric(
//                                         horizontal: 16, vertical: 8),
//                                     hintText: 'Say something',
//                                     border: InputBorder.none,
//                                   ),
//                                   onChanged: (value) {
//                                     if (value.isNotEmpty) {
//                                       controller.flag.value = true;
//                                     } else {
//                                       controller.flag.value = false;
//                                     }
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Obx(
//                         () => controller.flag.value
//                             ? InkWell(
//                                 onTap: () {
//                                   controller.sendComment();
//                                 },
//                                 child: const CircleAvatar(
//                                   radius: 24,
//                                   backgroundColor: Colors.blue,
//                                   child: Icon(
//                                     Icons.send_rounded,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               )
//                             : const SizedBox(
//                                 width: 0,
//                               ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//   }
// }
