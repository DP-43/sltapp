import 'package:slt/l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:slt/screens/complaint_portal_page.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:slt/providers/complaint_provider.dart';
import 'package:slt/providers/cases_provider.dart';

class SubmitComplaintPage4 extends StatefulWidget {
  const SubmitComplaintPage4({super.key});

  @override
  State<SubmitComplaintPage4> createState() => _SubmitComplaintPage4State();
}

class _SubmitComplaintPage4State extends State<SubmitComplaintPage4> {
  
  final ImagePicker _picker = ImagePicker();
  final AudioRecorder _audioRecorder = AudioRecorder();
  bool _isRecording = false;

  @override
  void dispose() {
    _audioRecorder.dispose();
    super.dispose();
  }

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.pickFiles(
      
      allowMultiple: true,
      type: FileType.any,
    );
    if (!mounted) return; 
     if (result != null) {
       for (var path in result.paths) {
      if (path != null) {
        context.read<ComplaintProvider>().addFile(path);
      }
     }
     }
  }
  

  Future<void> _takePhoto() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if (!mounted) return; 
      if (photo != null) {
       context.read<ComplaintProvider>().addFile(photo.path);
      }
    }
  }

  Future<void> _pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (!mounted) return; 
    if (image != null) {
     context.read<ComplaintProvider>().addFile(image.path);
    }
  }

  Future<void> _handleVoiceRecording() async {
    if (_isRecording) {
      final path = await _audioRecorder.stop();
      if (!mounted) return; 
        setState(() {
          _isRecording = false;
        });
        if (path != null){
           context.read<ComplaintProvider>().addFile(path);
        }
     
    } else {
      final status = await Permission.microphone.request();
      if (status.isGranted) {
        final directory = await getApplicationDocumentsDirectory();
        final path = '${directory.path}/recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
        
        await _audioRecorder.start(const RecordConfig(), path: path);
        setState(() {
          _isRecording = true;
        });
      }
    }
  }

  void _showPickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!.selectEvidenceType,
                  style: AppTextStyles.sectionHeader,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildOptionItem(Icons.insert_drive_file, AppLocalizations.of(context)!.optionFiles, _pickFiles),
                    _buildOptionItem(Icons.camera_alt, AppLocalizations.of(context)!.optionCamera, _takePhoto),
                    _buildOptionItem(Icons.photo_library, AppLocalizations.of(context)!.optionGallery, _pickFromGallery),
                    _buildOptionItem(
                      _isRecording ? Icons.stop : Icons.mic, 
                      _isRecording ? AppLocalizations.of(context)!.optionStop : AppLocalizations.of(context)!.optionVoice, 
                      () {
                        Navigator.pop(context);
                        _handleVoiceRecording();
                      }
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOptionItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
      if (label != AppLocalizations.of(context)!.optionVoice && label != AppLocalizations.of(context)!.optionStop) Navigator.pop(context);
        onTap();
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addEvidenceTitle, style: AppTextStyles.appBarTitle),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                // Step Indicator
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.step4Of4,
                      style: AppTextStyles.stepIndicatorLabel,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 2, 149, 0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 2, 149, 0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 2, 149, 0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 2, 149, 0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

      
                Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFBFD9EB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.uploadEvidenceMessage,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF45606E),
                        ),
                      ),
                    ),

                const SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      if (_isRecording)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               const Icon(Icons.circle, color: Colors.red, size: 12),
                               const SizedBox(width: 8),
                               Text(AppLocalizations.of(context)!.recording, 
                               style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      Icon(
                        _isRecording ? Icons.mic : Icons.cloud_upload_outlined,
                        color: _isRecording ? Colors.red : AppColors.primary,
                        size: 48,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)!.clickToUpload,
                        style: AppTextStyles.sectionHeader,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.fileFormats,
                        style: AppTextStyles.bodyText,
                      ),
                      const SizedBox(height: 24),

                      // Browse Files  
                      SizedBox(
                        width: 180,
                        child: ElevatedButton(
                          onPressed: _isRecording ? _handleVoiceRecording : _showPickerOptions,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isRecording ? Colors.red : AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                          ),
                          child: Text(
                            _isRecording ? AppLocalizations.of(context)!.stopRecordingBtn : AppLocalizations.of(context)!.browseFilesBtn,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                if (context.watch<ComplaintProvider>().selectedFiles.isNotEmpty) ...[
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.selectedFilesText,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: context.watch<ComplaintProvider>().selectedFiles.length,
                    itemBuilder: (context, index) {
                      final filePath = context.watch<ComplaintProvider>().selectedFiles[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              filePath.endsWith('.m4a') ? Icons.mic : Icons.insert_drive_file,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                               filePath.split('/').last,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close, size: 18, color: Colors.red),
                              onPressed: () =>
                                  context.read<ComplaintProvider>().removeFile(index),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],

                const SizedBox(height: 20),

                CustomButton(
                  text: AppLocalizations.of(context)!.submitComplaintBtn,
                  color: AppColors.primary,
                  onPressed: () {
                    
                    final compProvider = context.read<ComplaintProvider>();
                    
                    //add new case to CasesProvider
                    context.read<CasesProvider>().addCase(
                      category: compProvider.selectedCategory,
                      description: compProvider.description,
                    );
                    
                    compProvider.clearAll();

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const ComplaintPortalPage()),
                      (route) => route.isFirst,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Complaint submitted successfully!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
