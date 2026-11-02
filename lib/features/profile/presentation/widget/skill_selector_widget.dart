import 'package:flutter/material.dart';
import 'package:skill_swap_bd/core/extensions/context_extension.dart';
import 'package:skill_swap_bd/core/theme/app_spacing.dart';
import 'package:skill_swap_bd/core/widgets/app_text_field.dart';
import 'package:skill_swap_bd/features/profile/presentation/widget/skill_tag_widget.dart';

class SkillSelectorWidget extends StatefulWidget {
  const SkillSelectorWidget({
    required this.title,
    required this.skills,
    required this.onAddSkill,
    required this.onRemoveSkill,
    super.key,
    this.isOffered = true,
  });

  final String title;
  final List<String> skills;
  final ValueChanged<String> onAddSkill;
  final ValueChanged<String> onRemoveSkill;
  final bool isOffered;

  @override
  State<SkillSelectorWidget> createState() => SkillSelectorWidgetState();
}

class SkillSelectorWidgetState extends State<SkillSelectorWidget> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  /// Commits any pending text currently typed in the input field.
  void flushPending() {
    _handleAdd();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      _handleAdd();
    }
  }

  void _handleAdd() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onAddSkill(text);
      _controller.clear();
    }
  }

  void _handleChanged(String value) {
    if (value.contains(',')) {
      final parts = value.split(',');
      for (final part in parts) {
        final trimmed = part.trim();
        if (trimmed.isNotEmpty) {
          widget.onAddSkill(trimmed);
        }
      }
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_handleFocusChange)
      ..dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: context.textTheme.titleMedium,
        ),
        Gaps.v8,
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: _controller,
                focusNode: _focusNode,
                hint: context.tr.profileAddSkillHint,
                textInputAction: TextInputAction.done,
                onChanged: _handleChanged,
                onSubmitted: (_) => _handleAdd(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: _handleAdd,
                ),
              ),
            ),
          ],
        ),
        Gaps.v8,
        if (widget.skills.isNotEmpty)
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.xs,
            children: widget.skills.map((skill) {
              return SkillTagWidget(
                skill: skill,
                isOffered: widget.isOffered,
                onDeleted: () => widget.onRemoveSkill(skill),
              );
            }).toList(),
          ),
      ],
    );
  }
}
