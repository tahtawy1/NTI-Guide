import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/auth/presentation/views/widgets/c_header_text_field.dart';
import 'package:nti_hub_app/features/news/data/models/new_model.dart';
import 'package:nti_hub_app/features/news/presentation/view_model/news_bloc/news_bloc.dart';

class AddNewBottomModalSheet extends StatefulWidget {
  const AddNewBottomModalSheet({super.key});

  @override
  State<AddNewBottomModalSheet> createState() => _AddNewBottomModalSheetState();
}

class _AddNewBottomModalSheetState extends State<AddNewBottomModalSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _briefController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _thumbnailController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  final List<String> _imagesUrl = [];
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _briefController.dispose();
    _descriptionController.dispose();
    _thumbnailController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _addImageUrl() {
    final url = _imageUrlController.text.trim();
    if (url.isEmpty) return;
    setState(() {
      _imagesUrl.add(url);
      _imageUrlController.clear();
    });
  }

  void _removeImageUrl(int index) {
    setState(() => _imagesUrl.removeAt(index));
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_imagesUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one image URL')),
      );
      return;
    }

    final newItem = NewModel(
      brief: _briefController.text.trim(),
      description: _descriptionController.text.trim(),
      thumbnail: _thumbnailController.text.trim(),
      imagesUrl: List.from(_imagesUrl),
      date: Timestamp.fromDate(_selectedDate),
    );

    context.read<NewsBloc>().add(AddNewsEvent(newNew: newItem));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Header
              Center(
                child: Text(
                  'Add News',
                  style: AppTextStyles.textLgBold.copyWith(
                    color: AppColors.darkPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              //  Brief
              CustomHeaderTextField(
                title: 'Brief',
                hintText: "Enter news brief",
                controller: _briefController,
                keyboardType: TextInputType.text,
                fieldType: CTextFieldType.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 12),

              //  Description
              CustomHeaderTextField(
                title: 'Description',
                hintText: "Enter full description",
                controller: _descriptionController,
                keyboardType: TextInputType.multiline,
                fieldType: CTextFieldType.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 12),

              //  Thumbnail URL
              CustomHeaderTextField(
                title: 'Thumbnail URL',
                hintText: "https://example.com/image.jpg",
                controller: _thumbnailController,
                keyboardType: TextInputType.url,
                fieldType: CTextFieldType.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 12),

              //  Date Picker
              const Text('Date', style: AppTextStyles.textMdSemiBold),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary.withAlpha(80)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 18,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                        style: AppTextStyles.text14Regular.copyWith(
                          color: AppColors.darkPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              //  Images URLs
              const Text('Images', style: AppTextStyles.textMdSemiBold),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _imageUrlController,
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(
                        hintText: 'https://example.com/img.jpg',
                        hintStyle: AppTextStyles.text14Regular.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: AppColors.primary.withAlpha(80),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: AppColors.primary.withAlpha(80),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _addImageUrl,
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: AppColors.darkPrimary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),

              //  Added Images List
              if (_imagesUrl.isNotEmpty) ...[
                const SizedBox(height: 10),
                ..._imagesUrl.asMap().entries.map(
                  (entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.image_outlined,
                          size: 16,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            entry.value,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.text14Regular.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _removeImageUrl(entry.key),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 20),

              //  Submit Button
              BlocConsumer<NewsBloc, NewsState>(
                listener: (context, state) {
                  if (state is NewsError) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                builder: (context, state) {
                  final isLoading = state is NewsLoading;
                  return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkPrimary,
                        foregroundColor: AppColors.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              'Publish News',
                              style: AppTextStyles.textMdSemiBold.copyWith(
                                color: AppColors.onPrimary,
                              ),
                            ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
