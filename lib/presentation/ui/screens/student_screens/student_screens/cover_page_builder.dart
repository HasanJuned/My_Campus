import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class StuCoverPageScreen extends StatefulWidget {
  const StuCoverPageScreen({
    required this.courseDepartment,
    required this.courseTitle,
    required this.courseCode,
    required this.teacherName,
    required this.teacherDesignation,
    required this.facultyName,
    required this.studentName,
    required this.studentDepartment,
    required this.studentBatch,
    required this.studentSection,
    required this.studentId,
    required this.topicName,
    required this.submissionDate,
    super.key,
  });
  final String courseDepartment;
  final String courseTitle;
  final String courseCode;
  final String teacherName;
  final String teacherDesignation;
  final String facultyName;
  final String studentName;
  final String studentDepartment;
  final String studentBatch;
  final String studentSection;
  final String studentId;
  final String topicName;
  final String submissionDate;

  @override
  State<StuCoverPageScreen> createState() => _StuCoverPageScreenState();
}

class _StuCoverPageScreenState extends State<StuCoverPageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cover Page'),
        centerTitle: true,
      ),
      body: PdfPreview(
        build: (format) => _createPdf(format),
        allowPrinting: true,
        allowSharing: true,
        initialPageFormat: PdfPageFormat.a4,
        pdfFileName: "cover_page.pdf",
      ),
    );
  }

  Future<Uint8List> _createPdf(PdfPageFormat format) async {
    final pdf = pw.Document(
      version: PdfVersion.pdf_1_5,
    );
    final image =
        await imageFromAssetBundle('assets/images/leading_university_logo.png');
    final marginPageFormat = format.copyWith(
      marginLeft: 20.0,
      marginRight: 20.0,
      marginTop: 20.0,
      marginBottom: 20.0,
    );
    pdf.addPage(
      pw.Page(
        pageFormat: marginPageFormat,
        build: (context) {
          return pw.Padding(
            padding: pw.EdgeInsets.only(left: 60.w, right: 60.w, top: 40.w),
            child: pw.Center(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(
                    height: 150.h,
                    child: pw.Center(child: pw.Image(image)),
                  ),
                  pw.SizedBox(height: 30.h),
                  pw.Center(
                    child: pw.Text(
                      widget.courseDepartment,
                      style: pw.TextStyle(
                        fontSize: 18.sp,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 25.h),
                  pw.RichText(
                    text: pw.TextSpan(
                        text: "Course Title    : ",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 14.sp),
                        children: [
                          pw.TextSpan(
                            text: widget.courseTitle,
                            style: pw.TextStyle(
                                fontSize: 14.sp,
                                fontWeight: pw.FontWeight.normal),
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 10.h),
                  pw.RichText(
                    text: pw.TextSpan(
                        text: "Course Code  : ",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 14.sp),
                        children: [
                          pw.TextSpan(
                            text: widget.courseCode,
                            style: pw.TextStyle(
                                fontSize: 14.sp,
                                fontWeight: pw.FontWeight.normal),
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 10),
                  pw.RichText(
                    text: pw.TextSpan(
                        text: "Title                 : ",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 14.sp),
                        children: [
                          pw.TextSpan(
                            text: widget.topicName,
                            style: pw.TextStyle(
                                fontSize: 14.sp,
                                fontWeight: pw.FontWeight.normal),
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 25),
                  pw.Center(
                    child: pw.Text(
                      'Submitted To',
                      style: pw.TextStyle(
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  pw.Divider(
                      thickness: 2,
                      color: PdfColors.black,
                      indent: 170,
                      endIndent: 170),
                  pw.SizedBox(height: 20),
                  pw.RichText(
                    text: pw.TextSpan(
                        text: "Name             : ",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 14.sp),
                        children: [
                          pw.TextSpan(
                            text: widget.teacherName,
                            style: pw.TextStyle(
                                fontSize: 14.sp,
                                fontWeight: pw.FontWeight.normal),
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 10),
                  pw.RichText(
                    text: pw.TextSpan(
                        text: "Designation  : ",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 14.sp),
                        children: [
                          pw.TextSpan(
                            text: widget.teacherDesignation,
                            style: pw.TextStyle(
                                fontSize: 14.sp,
                                fontWeight: pw.FontWeight.normal),
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 10),
                  pw.RichText(
                    text: pw.TextSpan(
                        text: "Faculty          : ",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 14.sp),
                        children: [
                          pw.TextSpan(
                            text: widget.facultyName,
                            style: pw.TextStyle(
                                fontSize: 14.sp,
                                fontWeight: pw.FontWeight.normal),
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 25),
                  pw.Center(
                    child: pw.Text(
                      'Submitted By',
                      style: pw.TextStyle(
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  pw.Divider(
                      thickness: 2,
                      color: PdfColors.black,
                      indent: 170,
                      endIndent: 170),
                  pw.SizedBox(height: 20),
                  pw.RichText(
                    text: pw.TextSpan(
                        text: "Name            : ",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 14.sp),
                        children: [
                          pw.TextSpan(
                            text: widget.studentName,
                            style: pw.TextStyle(
                                fontSize: 14.sp,
                                fontWeight: pw.FontWeight.normal),
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 10),
                  pw.RichText(
                    text: pw.TextSpan(
                        text: "Department  : ",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 14.sp),
                        children: [
                          pw.TextSpan(
                            text: widget.studentDepartment,
                            style: pw.TextStyle(
                                fontSize: 14.sp,
                                fontWeight: pw.FontWeight.normal),
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 10),
                  pw.RichText(
                    text: pw.TextSpan(
                        text: "Batch            : ",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 14.sp),
                        children: [
                          pw.TextSpan(
                            text: widget.studentBatch,
                            style: pw.TextStyle(
                                fontSize: 14.sp,
                                fontWeight: pw.FontWeight.normal),
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 10),
                  pw.RichText(
                    text: pw.TextSpan(
                        text: "Section         : ",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 14.sp),
                        children: [
                          pw.TextSpan(
                            text: widget.studentSection,
                            style: pw.TextStyle(
                                fontSize: 14.sp,
                                fontWeight: pw.FontWeight.normal),
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 10),
                  pw.RichText(
                    text: pw.TextSpan(
                        text: "ID                   : ",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 14.sp),
                        children: [
                          pw.TextSpan(
                            text: widget.studentId,
                            style: pw.TextStyle(
                                fontSize: 14.sp,
                                fontWeight: pw.FontWeight.normal),
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 25),
                  pw.Center(
                    child: pw.RichText(
                      text: pw.TextSpan(
                          text: "Submission Date: ",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 14.sp),
                          children: [
                            pw.TextSpan(
                              text: widget.submissionDate,
                              style: pw.TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: pw.FontWeight.normal),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );

    return pdf.save();
  }
}
