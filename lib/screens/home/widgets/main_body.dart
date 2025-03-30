import 'package:flutter/material.dart';
import 'package:nevil_portofolio/screens/home/widgets/MainHeader.dart';
import 'package:nevil_portofolio/screens/home/widgets/footer.dart';
import '../../sections/about_section.dart';
import '../../sections/contact_section.dart';
import '../../sections/experience_section.dart';
import '../../sections/portofolio_section.dart';
import '../../sections/sub_heading_section.dart';

// Add Experience to the enum
enum Section { home, about, experience, portfolio, contact } // Added experience

class MainBody extends StatefulWidget {
  const MainBody({super.key});
  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  final ScrollController _scrollController = ScrollController();

  // Add a key for the new Experience section
  final Map<Section, GlobalKey> _sectionKeys = {
    Section.about: GlobalKey(),
    Section.experience: GlobalKey(), // Added key
    Section.portfolio: GlobalKey(),
    Section.contact: GlobalKey(),
  };

  Section _activeSection = Section.home;
  final double _scrollOffsetThreshold = 100.0;
  final double _estimatedHeaderHeight = kToolbarHeight + 40;

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
    Section newActiveSection = Section.home;

    // Logic remains the same, but now includes Section.experience in _sectionKeys
    for (var entry in _sectionKeys.entries.toList().reversed) {
      final key = entry.value;
      final section = entry.key;
      final RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
      final ScrollPosition scrollPosition = _scrollController.position;

      if (renderBox != null && scrollPosition.hasPixels) {
        double sectionTopOffset = renderBox.localToGlobal(Offset.zero, ancestor: scrollPosition.viewportDimension != null ? context.findRenderObject() : null).dy;
        double sectionActivationPoint = currentScroll + sectionTopOffset - _estimatedHeaderHeight;
        if (currentScroll >= sectionActivationPoint - _scrollOffsetThreshold) {
          newActiveSection = section;
          break;
        }
      }
    }

    if (currentScroll < _scrollOffsetThreshold) newActiveSection = Section.home;

    if (_activeSection != newActiveSection) {
      setState(() => _activeSection = newActiveSection);
    }
  }

  void _scrollToSection(Section section) {
    // Logic remains the same, handles Section.experience via the key
    if (section == Section.home) {
      _scrollController.animateTo(0, duration: const Duration(milliseconds: 800), curve: Curves.easeInOutCubic);
    } else {
      final key = _sectionKeys[section];
      if (key?.currentContext != null) {
        Scrollable.ensureVisible(
          key!.currentContext!,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCubic,
          alignment: 0.0,
        ).then((_) {
          if (_scrollController.offset > 0) {
            _scrollController.animateTo(
              _scrollController.offset - _estimatedHeaderHeight + 20,
              duration: const Duration(milliseconds: 100),
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
        // ... (background decoration) ...
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // --- Fixed Header ---
            Container(
              color: Colors.black.withOpacity(0.6),
              child: MainHeader(
                onNavItemTap: _scrollToSection,
                activeSection: _activeSection,
              ),
            ),
            // --- Scrollable Content ---
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Ensure sections align left
                  children: [
                    // --- ADD SECTIONS IN ORDER ---
                    const SubHeadingSection(), // Your intro heading
                    AboutSection(key: _sectionKeys[Section.about]),
                    ExperienceSection(key: _sectionKeys[Section.experience]), // Add Experience section
                    PortfolioSection(key: _sectionKeys[Section.portfolio]),
                    ContactSection(key: _sectionKeys[Section.contact]),
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