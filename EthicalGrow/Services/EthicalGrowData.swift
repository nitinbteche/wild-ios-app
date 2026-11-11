import Foundation

public struct EthicalGrowData {
    public static let officialPackages: [PackageItem] = [
        PackageItem(
            name: "Ethical Beginner",
            subtitle: "Perfect kickstart for students entering digital skills",
            price: 399,
            originalPrice: 798,
            badge: "Entry Choice",
            features: [
                "Foundation Digital Skills",
                "Community Group Access",
                "Course Completion Certificate",
                "Mobile & Web Friendly Access"
            ],
            includedCourses: [
                "Basic YouTube Mastery",
                "Canva Pro Fundamentals",
                "Digital Skill Orientation"
            ],
            webUrl: "https://ethicalgrow.in/packages.php",
            iconSymbol: "sparkles"
        ),
        PackageItem(
            name: "Ethical Basic",
            subtitle: "Essential tools for content creators and freelancers",
            price: 999,
            originalPrice: 1998,
            badge: "Popular",
            features: [
                "All Beginner Package Courses",
                "VN Video Editor Training",
                "Instagram Growth Framework",
                "Weekly Doubt Clearing Sessions",
                "Dedicated WhatsApp Support"
            ],
            includedCourses: [
                "VN Video Editor Course",
                "Instagram Mastery Course",
                "Basic YouTube Mastery",
                "Canva Pro Graphic Design"
            ],
            webUrl: "https://ethicalgrow.in/packages.php",
            iconSymbol: "video.fill"
        ),
        PackageItem(
            name: "Ethical Starter",
            subtitle: "Structured skill path for young tech enthusiasts",
            price: 1799,
            originalPrice: 3598,
            badge: "Best Value",
            features: [
                "All Basic Courses Included",
                "Adobe Photoshop 2027 Mastery",
                "Advance YouTube Strategy",
                "Portfolio Building Guide",
                "Affiliate Partner Onboarding"
            ],
            includedCourses: [
                "Adobe Photoshop 2027 Course",
                "Advance YouTube Mastery",
                "Instagram Growth & Branding",
                "VN Video Editor Masterclass"
            ],
            webUrl: "https://ethicalgrow.in/packages.php",
            iconSymbol: "paintbrush.pointed.fill"
        ),
        PackageItem(
            name: "Ethical Standards",
            subtitle: "Coding & analytical skill development track",
            price: 3699,
            originalPrice: 7398,
            badge: "Recommended",
            features: [
                "All Starter Level Courses",
                "C++ Programming from Scratch",
                "Data Structures Fundamentals",
                "Live Expert Webinars",
                "Community Discord / Group VIP access"
            ],
            includedCourses: [
                "C++ Programming Beginner to Advanced",
                "Adobe Photoshop Full Suite",
                "Advance YouTube Strategy",
                "Content Monetization Playbook"
            ],
            webUrl: "https://ethicalgrow.in/packages.php",
            iconSymbol: "chevron.left.forwardslash.chevron.right"
        ),
        PackageItem(
            name: "Ethical Advance",
            subtitle: "High-income skills in software coding & data insights",
            price: 7499,
            originalPrice: 14998,
            badge: "Pro Choice",
            features: [
                "All Standards Courses Included",
                "Python Programming Mastery",
                "Power BI Business Intelligence",
                "1-on-1 Guidance Webinars",
                "Priority Mentor Support"
            ],
            includedCourses: [
                "Python Programming – Beginner to Advanced",
                "Advance Power BI Full Course",
                "C++ Coding Mastery",
                "Adobe Creative Suite Mastery"
            ],
            webUrl: "https://ethicalgrow.in/packages.php",
            iconSymbol: "chart.bar.xaxis"
        ),
        PackageItem(
            name: "Ethical Pro",
            subtitle: "The complete all-inclusive digital transformation bundle",
            price: 11999,
            originalPrice: 23998,
            badge: "Ultimate Bundle",
            features: [
                "Lifetime Access to All Courses & Future Updates",
                "Full Programming & Analytics Suite",
                "Full Design & Video Editing Suite",
                "Direct Founder Mentorship Sessions",
                "Top Tier Affiliate Commission Tier"
            ],
            includedCourses: [
                "Python Programming Masterclass",
                "Advance Power BI Analytics",
                "C++ Programming & OOP",
                "Adobe Photoshop 2027 Masterclass",
                "Advance YouTube Mastery",
                "Instagram Personal Branding",
                "VN Video Editing Suite",
                "Canva Pro Graphic Design"
            ],
            webUrl: "https://ethicalgrow.in/packages.php",
            iconSymbol: "crown.fill"
        )
    ]

    public static let officialCourses: [CourseItem] = [
        CourseItem(
            title: "Python Programming Course – Beginner to Advanced",
            category: .programming,
            summary: "Master Python programming from syntax basics to object-oriented programming, data handling, and real-world script automation.",
            level: "Beginner to Advanced",
            duration: "24 Hours",
            rating: 4.9,
            studentsCount: "4,200+",
            syllabus: [
                "Module 1: Introduction to Python & Environment Setup",
                "Module 2: Variables, Data Types & Control Flow",
                "Module 3: Functions, Modules & Packages",
                "Module 4: Object-Oriented Programming (OOP) in Python",
                "Module 5: File Handling & Error Handling",
                "Module 6: Capstone Project & Certification"
            ],
            iconSymbol: "chevron.left.forwardslash.chevron.right"
        ),
        CourseItem(
            title: "Advance Power BI Full Course",
            category: .programming,
            summary: "Learn business intelligence, data modeling, DAX queries, and build executive interactive dashboards.",
            level: "Intermediate to Pro",
            duration: "18 Hours",
            rating: 4.8,
            studentsCount: "2,800+",
            syllabus: [
                "Module 1: Power BI Desktop Architecture",
                "Module 2: Power Query Data Transformation & Cleaning",
                "Module 3: Data Modeling & Relationships",
                "Module 4: DAX Expressions & Calculated Columns",
                "Module 5: Building Interactive Business Dashboards"
            ],
            iconSymbol: "chart.pie.fill"
        ),
        CourseItem(
            title: "C++ Programming Course – Coding Mastery",
            category: .programming,
            summary: "Deep dive into C++, pointers, memory management, object-oriented concepts, and core algorithms.",
            level: "Beginner to Advanced",
            duration: "20 Hours",
            rating: 4.9,
            studentsCount: "3,100+",
            syllabus: [
                "Module 1: C++ Basics & Compiler Setup",
                "Module 2: Functions, Arrays & Pointers",
                "Module 3: Classes, Objects, Inheritance & Polymorphism",
                "Module 4: Standard Template Library (STL)",
                "Module 5: Algorithm Practice & Coding Challenges"
            ],
            iconSymbol: "cpu.fill"
        ),
        CourseItem(
            title: "Adobe Photoshop 2027 Course – Complete Design",
            category: .design,
            summary: "Master modern photo editing, thumbnail creation, digital manipulation, typography, and banner design.",
            level: "All Levels",
            duration: "16 Hours",
            rating: 4.9,
            studentsCount: "5,400+",
            syllabus: [
                "Module 1: Photoshop Workspace & Core Tools",
                "Module 2: Layers, Masking & Selections",
                "Module 3: Photo Retouching & Color Grading",
                "Module 4: Viral YouTube Thumbnail Design",
                "Module 5: Social Media Advertising Graphics"
            ],
            iconSymbol: "photo.stack.fill"
        ),
        CourseItem(
            title: "Advance YouTube Mastery",
            category: .video,
            summary: "Step-by-step channel setup, high-CTR thumbnails, scriptwriting, SEO optimization, Shorts strategies, and monetization.",
            level: "Beginner to Pro",
            duration: "14 Hours",
            rating: 5.0,
            studentsCount: "6,800+",
            syllabus: [
                "Module 1: Niche Selection & Competitive Research",
                "Module 2: High-Retention Video Scripting",
                "Module 3: Click-Worthy Thumbnail Psychology",
                "Module 4: YouTube SEO & Algorithmic Growth",
                "Module 5: Monetization & Brand Sponsorships"
            ],
            iconSymbol: "play.rectangle.fill"
        ),
        CourseItem(
            title: "Instagram Mastery Course – Grow & Monetize",
            category: .marketing,
            summary: "Learn viral Reels creation, profile branding, audience engagement, algorithm hacks, and personal brand monetization.",
            level: "All Levels",
            duration: "12 Hours",
            rating: 4.8,
            studentsCount: "7,100+",
            syllabus: [
                "Module 1: Bio Optimization & Brand Positioning",
                "Module 2: Viral Reels Hook Formula",
                "Module 3: Carousel Design & Story Selling",
                "Module 4: Instagram DM Automation & Funnels",
                "Module 5: Turning Followers into Paying Clients"
            ],
            iconSymbol: "camera.filters"
        ),
        CourseItem(
            title: "VN Video Editor Course (Vlog Now)",
            category: .video,
            summary: "Edit professional short-form videos, smooth transitions, speed ramps, trending sound sync, and export at 4K resolution on mobile.",
            level: "Beginner",
            duration: "8 Hours",
            rating: 4.9,
            studentsCount: "4,600+",
            syllabus: [
                "Module 1: VN Interface & Timeline Basics",
                "Module 2: Cuts, Transitions & Keyframing",
                "Module 3: Audio Syncing & Sound Effects",
                "Module 4: Color Grading & Cinematic Filters",
                "Module 5: Exporting Reels & Shorts in High Quality"
            ],
            iconSymbol: "scissors"
        ),
        CourseItem(
            title: "Canva Pro Graphic Design & Content Creation",
            category: .design,
            summary: "Create stunning promotional graphics, brochures, presentation slides, and brand kits quickly with Canva Pro.",
            level: "Beginner Friendly",
            duration: "10 Hours",
            rating: 4.8,
            studentsCount: "8,900+",
            syllabus: [
                "Module 1: Canva Pro Features & Workspace",
                "Module 2: Typography, Color Theory & Spacing",
                "Module 3: Social Media Posts & Stories",
                "Module 4: Pitch Decks & Business Presentations",
                "Module 5: Creating & Selling Canva Templates"
            ],
            iconSymbol: "wand.and.stars"
        )
    ]

    public static let founders: [FounderItem] = [
        FounderItem(
            name: "Er. Nitin Kumar",
            role: "Founder & CEO",
            message: "Our vision with EthicalGrow is to equip every individual with practical, high-value digital skills so they can grow both spiritually and financially in the modern digital era.",
            city: "Moradabad, Uttar Pradesh, India",
            iconSymbol: "person.crop.circle.badge.checkmark"
        ),
        FounderItem(
            name: "Aditya Taak",
            role: "Co-Founder",
            message: "We focus on real, actionable skills that empower learners to build careers, freelancing income, and personal brands with transparency and ethical standards.",
            city: "Moradabad, Uttar Pradesh, India",
            iconSymbol: "person.2.fill"
        )
    ]

    public static let faqs: [FAQItem] = [
        FAQItem(
            question: "What is EthicalGrow?",
            answer: "EthicalGrow is an educational skill-development platform offering structured courses in digital marketing, coding, content creation, design, and freelancing to help learners develop practical skills."
        ),
        FAQItem(
            question: "How do I access my purchased courses?",
            answer: "Once enrolled, log in using your registered mobile number or email at the Student Portal (or inside this app's Portal tab) to watch lessons, track progress, and take quizzes."
        ),
        FAQItem(
            question: "Do I get a certificate after completing a course?",
            answer: "Yes, every completed course includes an official, verifiable digital certificate from EthicalGrow to showcase on your resume or LinkedIn profile."
        ),
        FAQItem(
            question: "How can I contact student support?",
            answer: "You can reach our team via WhatsApp at +91 6397165292 or email us at support@ethicalgrow.in for instant assistance with enrollment, dashboard access, or course queries."
        ),
        FAQItem(
            question: "Is there an income guarantee?",
            answer: "EthicalGrow is an educational platform. We provide high-quality training and skill-building resources. Individual earnings, jobs, or business success depend on personal dedication, market practice, and execution."
        )
    ]

    // Official Links
    public static let homeUrl = "https://ethicalgrow.in/"
    public static let loginUrl = "https://ethicalgrow.in/login.php"
    public static let registerUrl = "https://ethicalgrow.in/register.php"
    public static let packagesUrl = "https://ethicalgrow.in/packages.php"
    public static let coursesUrl = "https://ethicalgrow.in/courses.php"
    public static let presentationYoutubeId = "nF9hdovMLRk"
    public static let presentationVideoUrl = "https://www.youtube.com/watch?v=nF9hdovMLRk"
    public static let whatsappUrl = "https://wa.me/916397165292"
    public static let supportPhone = "+91 6397165292"
    public static let supportEmail = "support@ethicalgrow.in"
    public static let location = "Moradabad, Uttar Pradesh, India"
}
