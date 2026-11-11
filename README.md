# EthicalGrow — Official iOS Application 🚀📚

> **"Grow Spiritually and Financially"** — Official iOS client for [ethicalgrow.in](https://ethicalgrow.in).

**EthicalGrow** is a digital learning and skill-development platform founded by **Er. Nitin Kumar (Founder & CEO)** and **Aditya Taak (Co-Founder)** based in Moradabad, Uttar Pradesh, India. This native iOS application delivers a learning experience combining a modern **SwiftUI** interface with an integrated **Web Portal Bridge** (`WKWebView`) to access the student dashboard, packages, and courses directly.

---

## 🌟 Key App Features

### 1. 🏠 Home & Discovery Hub
* **Hero Spotlight**: Dynamic banner promoting practical, in-demand digital competencies.
* **Platform Key Metrics**: Tracking 50,000+ Learners, 15+ In-Demand Skill Courses, 99.8% Satisfaction, and 24/7 Mentorship.
* **Featured Skill Bundles**: 1-tap preview of top skill packages.
* **Trending Courses**: Carousel featuring Python, Power BI, Photoshop 2027, YouTube Mastery, and Canva Pro.
* **Founder Spotlight**: Messages from Er. Nitin Kumar & Aditya Taak.

### 2. 📦 Official Skill Packages
* **All 6 Official Bundles** with 50% limited-time discounts:
  * **Ethical Beginner** (₹399, was ₹798) — Basic YouTube, Canva Pro & Orientation.
  * **Ethical Basic** (₹999, was ₹1,998) — VN Video Editor, Instagram Mastery & Community Access.
  * **Ethical Starter** (₹1,799, was ₹3,598) — Adobe Photoshop 2027 & Advance YouTube Strategy.
  * **Ethical Standards** (₹3,699, was ₹7,398) — C++ Coding & Data Structures Foundations.
  * **Ethical Advance** (₹7,499, was ₹14,998) — Python Programming & Power BI Business Analytics.
  * **Ethical Pro** (₹11,999, was ₹23,998) — Complete All-Inclusive Master Suite & Founder Mentorship.
* **Detailed Syllabus Sheets**: Preview included courses, perks, verified certification, and instant enrollment checkout via `ethicalgrow.in`.

### 3. 🎓 Comprehensive Skill Academy (Courses)
* **Categorized Curriculum**:
  * 💻 **Coding & Tech**: Python Programming (Beginner to Advanced), Advance Power BI, C++ Programming.
  * 🎨 **Design & Creative**: Adobe Photoshop 2027, Canva Pro Graphic Design.
  * 🎬 **Video & Content**: VN Video Editor (Vlog Now), Advance YouTube Mastery.
  * 📈 **Growth & Marketing**: Instagram Mastery (Grow, Monetize & Brand).
* **Live Search & Filter**: Filter courses by category or search by topic.
* **Module Breakdown**: Complete syllabus modules for each course.

### 4. 🎥 Official Presentation & Plan
* **Embedded Video Player**: Watch the official presentation video (`nF9hdovMLRk`) directly inside the app with YouTube webkit inline playback.
* **Platform Pillars**: Practical skills, ethical transparency, verifiable certificates, and active community mentorship.
* **Interactive FAQ**: Collapsible answers to common student questions.

### 5. 🌐 Student Portal (Live Web Bridge)
* **Embedded `WKWebView`**: Fast, smooth in-app browsing of [ethicalgrow.in](https://ethicalgrow.in).
* **Direct Shortcuts**: Quick toggle between **Student Login**, **Registration**, **Full Website**, and **Packages**.
* **Navigation Controls**: Back, Forward, Reload, Share, and "Open in Safari" actions.

### 6. 💬 Dedicated WhatsApp & Support Desk
* **1-Tap WhatsApp Support**: Direct launch to official WhatsApp helpline (`+91 6397165292`).
* **Direct Helpline & Email**: Instant calling and email links (`support@ethicalgrow.in`).
* **Official Social Channels**: Direct access to YouTube (`@ethicalgrow`), Instagram (`@ethicalgrow_`), and Facebook.
* **Compliance & Transparency**: Clear educational disclaimers and terms.

---

## 🏗️ Architecture & Directory Structure

```
wild-ios-app/
├── EthicalGrow.xcodeproj/           # Xcode Project configured for iOS 17.0+
├── Package.swift                     # Swift Package Manager manifest
├── README.md
└── EthicalGrow/
    ├── App/
    │   ├── EthicalGrowApp.swift      # Main SwiftUI application entry point (@main)
    │   └── ContentView.swift         # Root navigation container
    ├── Models/
    │   ├── PackageItem.swift         # Packages, pricing, discounts, and features
    │   ├── CourseItem.swift          # Courses, curriculum, ratings, and categories
    │   └── FAQItem.swift             # Frequently asked questions & leadership models
    ├── Services/
    │   └── EthicalGrowData.swift     # Central catalog of packages, courses, and URLs
    ├── Theme/
    │   └── EthicalGrowTheme.swift    # Official Brand Gradient (#1565C0 -> #8E24AA -> #D81B60)
    ├── Views/
    │   ├── Navigation/
    │   │   └── MainTabView.swift     # 6-tab primary navigation controller
    │   ├── Home/
    │   │   └── HomeView.swift        # Landing hub, metrics, carousels, founder quote
    │   ├── Packages/
    │   │   ├── PackagesListView.swift # Full package catalog
    │   │   └── PackageCardView.swift  # Package card & detail sheet
    │   ├── Courses/
    │   │   ├── CoursesListView.swift  # Searchable & filterable course catalog
    │   │   └── CourseCardView.swift   # Course card & syllabus sheet
    │   ├── Presentation/
    │   │   └── PresentationView.swift # Embedded YouTube video & platform pillars
    │   ├── WebPortal/
    │   │   └── WebPortalView.swift    # WKWebView student portal with toolbar
    │   ├── Support/
    │   │   └── SupportView.swift      # WhatsApp chat, calling, email & socials
    │   └── Components/
    │       └── GradientButton.swift   # Custom gradient buttons & stat badges
    └── Resources/
        ├── Info.plist                # Permissions & App Transport Security
        └── Assets.xcassets/          # AppIcon & AccentColor (#1565C0)
```

---

## 🎨 Official Brand Identity

* **Primary Blue**: `#1565C0`
* **Royal Blue Dark**: `#0D47A1`
* **Spiritual Purple**: `#8E24AA`
* **Vibrant Pink**: `#D81B60`
* **Success Green**: `#059669`
* **WhatsApp Green**: `#25D366`
* **Signature Gradient**: `linear-gradient(135deg, #1565C0, #8E24AA, #D81B60)`

---

## 🚀 How to Run in Xcode

1. Clone or pull this repository:
   ```bash
   git clone https://github.com/nitinbteche/wild-ios-app.git
   cd wild-ios-app
   ```
2. Open [`EthicalGrow.xcodeproj`](file:///home/runner/work/wild-ios-app/wild-ios-app/EthicalGrow.xcodeproj/project.pbxproj) in Xcode:
   ```bash
   open EthicalGrow.xcodeproj
   ```
3. Choose an iOS Simulator (e.g. **iPhone 15 Pro**, **iPhone 16**) or your physical iPhone.
4. Press **⌘ + R** to build and run.

---

## 👨‍💼 Leadership & Contacts

* **Founder & CEO**: Er. Nitin Kumar
* **Co-Founder**: Aditya Taak
* **Location**: Moradabad, Uttar Pradesh, India
* **Website**: [ethicalgrow.in](https://ethicalgrow.in)
* **WhatsApp Support**: [+91 6397165292](https://wa.me/916397165292)
* **Support Email**: `support@ethicalgrow.in`
