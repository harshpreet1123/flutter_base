import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final bool showChevron;
  final VoidCallback onPress;
  final Widget? trailing;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onPress,
    this.value,
    this.showChevron = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (value != null)
              Text(
                value!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).hintColor,
                ),
              ),
            if (trailing != null) trailing!,
            if (showChevron && trailing == null)
              Icon(Ionicons.chevron_forward, color: Theme.of(context).hintColor, size: 20),
          ],
        ),
      ),
    );
  }
}
