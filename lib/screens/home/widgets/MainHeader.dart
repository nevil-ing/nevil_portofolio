import 'package:flutter/material.dart';
import 'package:nevil_portofolio/screens/home/widgets/main_body.dart'; // Import Section enum
import 'package:responsive_framework/responsive_framework.dart';

class MainHeader extends StatelessWidget {
  final Function(Section) onNavItemTap; // Callback for scrolling
  final Section activeSection;          // Currently active section

  const MainHeader({
    super.key,
    required this.onNavItemTap,
    required this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Responsive padding for the header
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveValue<double>(
            context,
            defaultValue: 16.0,
            conditionalValues: [
              Condition.largerThan(name: TABLET, value: 50.0), // More padding on larger screens
              Condition.largerThan(name: DESKTOP, value: 80.0),
            ],
          ).value ?? 16.0, // Use ?? for null safety
          vertical: 15.0), // Increased vertical padding slightly
      child: ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        // Change layout to COLUMN on smaller screens if desired, otherwise keep ROW
        layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
            ? ResponsiveRowColumnType.COLUMN // Example: Stack on very small screens
            : ResponsiveRowColumnType.ROW,
        // Add column specific alignment if using COLUMN layout
        // columnMainAxisAlignment: MainAxisAlignment.center,
        // columnCrossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // --- Profile ---
          ResponsiveRowColumnItem(
            rowFlex: 0, // Doesn't expand
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0), // Add padding if stacked
              child: CircleAvatar(
                radius: 25, // Slightly larger avatar
                // Ensure profile image has transparent background or fits well
                backgroundColor: Colors.transparent,
                child: ClipOval( // Clip the image to the circle
                    child: Image.asset(
                      'assets/img/profile.jpg', // Ensure path is correct
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.person), // Placeholder on error
                    )
                ),
              ),
            ),
          ),

          // --- Desktop Navigation (Hidden on mobile) ---
          ResponsiveRowColumnItem(
            rowFlex: 0, // Doesn't expand
            child: ResponsiveVisibility(
              hiddenConditions: [
                Condition.smallerThan(name: TABLET), // Hide nav items below tablet
              ],
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _navItem('Home', Section.home, context),
                  _navItem('About', Section.about, context),
                  _navItem('Experience', Section.experience, context),
                  _navItem('Portfolio', Section.portfolio, context),
                  _navItem('Contact', Section.contact, context),
                ],
              ),
            ),
          ),

          // --- Mobile Menu Button (Visible on mobile/tablet) ---
          ResponsiveRowColumnItem(
            rowFlex: 0,
            child: ResponsiveVisibility(
              visible: false, // Default to hidden
              visibleConditions: [
                Condition.smallerThan(name: TABLET) // Show only below tablet
              ],
              child: PopupMenuButton<Section>(
                icon: Icon(Icons.menu, color: Theme.of(context).iconTheme.color), // Use theme color
                color: Theme.of(context).popupMenuTheme.color, // Use theme color for background
                onSelected: (section) {
                  onNavItemTap(section); // Use the callback
                },
                itemBuilder: (context) => [
                  _popupMenuItem('Home', Section.home, context),
                  _popupMenuItem('About', Section.about, context),
                  _popupMenuItem('Experience', Section.experience, context),
                  _popupMenuItem('Portfolio', Section.portfolio, context),
                  _popupMenuItem('Contact', Section.contact, context),
                ],
              ),
            ),
          ),

          // --- Get in Touch Button ---
          // ResponsiveRowColumnItem(
          //   rowFlex: 0, // Doesn't expand
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 8.0), // Add padding if stacked
          //     child: OutlinedButton(
          //       onPressed: () => onNavItemTap(Section.contact),
          //       style: Theme.of(context).outlinedButtonTheme.style,
          //       child: const Text('Get in Touch'),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  // Helper for Desktop Navigation Items
  Widget _navItem(String text, Section section, BuildContext context) {
    bool isActive = activeSection == section;
    final hoverColor = Colors.blue.withOpacity(0.1);
    final activeStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).hintColor, // Use accent color for active
        shadows: [ Shadow( color: Theme.of(context).hintColor.withOpacity(0.5), blurRadius: 5,) ] // Subtle glow
    );
    final inactiveStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500, // Slightly less bold when inactive
      color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.white,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0), // Increase spacing slightly
      child: InkWell( // Use InkWell for hover effect and tap
        onTap: () => onNavItemTap(section),
        hoverColor: hoverColor, // Visual feedback on hover
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0), // Padding inside InkWell
          child: Text(
            text,
            style: isActive ? activeStyle : inactiveStyle,
          ),
        ),
      ),
    );
  }

  // Helper for Popup Menu Items
  PopupMenuItem<Section> _popupMenuItem(String text, Section section, BuildContext context) {
    bool isActive = activeSection == section;
    return PopupMenuItem<Section>(
      value: section,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive
              ? Theme.of(context).hintColor // Use accent color for active
              : Theme.of(context).popupMenuTheme.textStyle?.color ?? Colors.white,
        ),
      ),
    );
  }
}