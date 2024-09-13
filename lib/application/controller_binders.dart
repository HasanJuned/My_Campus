import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_availability_checking_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_profile_details_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_announcement_listen_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_available_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_creating_sub_grp_batch_sec_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_main_bottom_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_signin_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_password_change_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_verify_otp_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_signup_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_verify_email_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_announcement_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_my_todo_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_resource_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_show_group_batch_section_course_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/group_chatting_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/auth_state_holders/stu_availability_checking_controller.dart';
import 'package:my_campus/presentation/state_holders/routine_time_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/auth_state_holders/stu_password_change_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/auth_state_holders/stu_signin_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/auth_state_holders/stu_signup_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/auth_state_holders/stu_verify_email_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/auth_state_holders/stu_verify_otp_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/available_course_batch_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/batch_all_announcement_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/batch_announcement_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/stu_announcement_listen_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/stu_enrolled_course_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/stu_main_bottom_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/stu_my_todo_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/stu_resources_controller.dart';
import 'package:my_campus/presentation/ui/widgets/date.dart';

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    //Get.put(FacRegistrationController());
    Get.put(FacAvailabilityCheckingController());
    Get.put(FacSignInController());
    Get.put(FacSignUpController());
    Get.put(FacVerifyEmailController());
    Get.put(FacVerifyOTPController());
    Get.put(FacPasswordChangeController());
    Get.put(FacAnnouncementController());
    Get.put(FacCreatingSubGrpBatchSecController());
    Get.put(FacShowGroupBatchSectionCourseController());
    Get.put(FacMainBottomNavController());
    Get.put(GroupChattingController());
    Get.put(FacResourceController());
    Get.put(FacMyTodoController());
    Get.put(FacAnnouncementListenController());
    Get.put(FacProfileDetailsController());
    Get.put(FacAvailableController());

    Get.put(StuAvailabilityCheckingController());
    Get.put(StuSignInController());
    Get.put(StuSignUpController());
    Get.put(StuVerifyEmailController());
    Get.put(StuVerifyOTPController());
    Get.put(StuPasswordChangeController());
    Get.put(AvailableCourseBatchController());
    Get.put(StuEnrolledCourseController());
    Get.put(StuMainBottomNavController());
    Get.put(BatchAnnouncementController());
    Get.put(BatchAllAnnouncementController());
    Get.put(StuMyTodoController());
    Get.put(RoutineTimeController());
    Get.put(DateController());
    Get.put(StuResourcesController());
    Get.put(StuAnnouncementListenController());
  }
}
