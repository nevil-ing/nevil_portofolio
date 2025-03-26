import 'package:flutter/material.dart';
import 'package:nevil_portofolio/screens/home/widgets/MainHeader.dart';
import 'package:nevil_portofolio/screens/home/widgets/footer.dart';

import '../../sections/about_section.dart';
import '../../sections/contact_section.dart';
import '../../sections/portofolio_section.dart';

// Define keys for each section (Enum remains the same)
enum Section { home, about, portfolio, contact }

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  final ScrollController _scrollController = ScrollController();
  final Map<Section, GlobalKey> _sectionKeys = {

    Section.about: GlobalKey(),
    Section.portfolio: GlobalKey(),
    Section.contact: GlobalKey(),
  };

  Section _activeSection = Section.home;
  // Adjust threshold based on the header's height and desired sensitivity
  final double _scrollOffsetThreshold = 100.0;

  // Store header height dynamically if needed, but start with an estimate
  final double _estimatedHeaderHeight = kToolbarHeight + 40; // Adjust based on header content/padding

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    double currentScroll = _scrollController.offset;
    Section newActiveSection = Section.home; // Default to home

    // Check sections in reverse order (bottom to top)
    for (var entry in _sectionKeys.entries.toList().reversed) {
      final key = entry.value;
      final section = entry.key;

      final RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
      final ScrollPosition scrollPosition = _scrollController.position;

      if (renderBox != null && scrollPosition.hasPixels) {
        // Get the position of the top of the section relative to the scrollable viewport
        double sectionTopOffset = renderBox.localToGlobal(Offset.zero, ancestor: scrollPosition.viewportDimension != null ? context.findRenderObject() : null).dy;

        double sectionActivationPoint = currentScroll + sectionTopOffset - _estimatedHeaderHeight;

        // print("Section: $section, CurrentScroll: $currentScroll, SectionTop: $sectionTopOffset, ActivationPoint: $sectionActivationPoint"); // Debugging

        // If the scroll position is at or below the activation point
        if (currentScroll >= sectionActivationPoint - _scrollOffsetThreshold) { // Use threshold
          newActiveSection = section;
          break; // Found the topmost visible section below the header
        }
      }
    }


    if (currentScroll < _scrollOffsetThreshold) {
      newActiveSection = Section.home;
    }


    if (_activeSection != newActiveSection) {
      setState(() {
        _activeSection = newActiveSection;
        // print("Active Section: $_activeSection"); // Debugging
      });
    }
  }


  void _scrollToSection(Section section) {
    if (section == Section.home) {
      // Scroll to the very top for Home
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    } else {
      final key = _sectionKeys[section];
      if (key?.currentContext != null) {
        // Ensure the section is visible. We might need to add an offset
        // later if ensureVisible doesn't perfectly account for the fixed header.
        Scrollable.ensureVisible(
          key!.currentContext!,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCubic,
          alignment: 0.0, // Align top of the section to the top of the viewport (below header)
          // alignmentPolicy: ScrollPositionAlignmentPolicy.explicit, // More control if needed
        ).then((_) {
          // Optional: Fine-tune scroll position after ensureVisible if needed
          // This ensures the section top is just below the header
          if (_scrollController.offset > 0) { // Avoid adjusting if already at top
            _scrollController.animateTo(
              _scrollController.offset - _estimatedHeaderHeight + 20, // Add small buffer
              duration: const Duration(milliseconds: 100), // Quick adjustment
              curve: Curves.easeOut,
            );
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        // Use a Column: Header on top, Expanded Scrollable content below
        child: Column(
          children: [
            // --- Sticky Header ---
            // Wrap Header in a Container for background/styling if needed
            Container(
              // Add a background color to the header area for readability
              // Make it slightly transparent to blend with the main background
              color: Colors.black.withOpacity(0.6), // Adjust color and opacity
              // You could also use ClipRect + BackdropFilter for a blur effect
              child: MainHeader(
                // key is not needed here as it's not scrolling
                onNavItemTap: _scrollToSection,
                activeSection: _activeSection,
              ),
            ),

            // --- Scrollable Content ---
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    // No need for the Home key here, handled by scroll offset 0
                    // Add some padding at the top if the first section feels too close
                    // SizedBox(height: 20),

                    // --- Sections ---
                    AboutSection(key: _sectionKeys[Section.about]),
                    PortfolioSection(key: _sectionKeys[Section.portfolio]),
                    ContactSection(key: _sectionKeys[Section.contact]),

                    // --- Footer ---
                    const Footer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}