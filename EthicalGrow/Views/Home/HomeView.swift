import SwiftUI

public struct HomeView: View {
    @State private var selectedPackage: PackageItem? = nil
    @State private var selectedCourse: CourseItem? = nil

    public init() {}

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 22) {
                    // Top App Header
                    HStack {
                        VStack(alignment: .leading, spacing: 3) {
                            HStack(spacing: 6) {
                                Text("Ethical")
                                    .font(.system(size: 24, weight: .black, design: .rounded))
                                    .foregroundColor(EthicalGrowTheme.darkText)
                                Text("Grow")
                                    .font(.system(size: 24, weight: .black, design: .rounded))
                                    .foregroundColor(EthicalGrowTheme.primaryBlue)
                            }
                            Text("Grow Spiritually and Financially")
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundColor(EthicalGrowTheme.muted)
                        }

                        Spacer()

                        Button(action: {
                            if let url = URL(string: EthicalGrowData.whatsappUrl) {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Image(systemName: "message.fill")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .background(EthicalGrowTheme.whatsappGreen)
                                .clipShape(Circle())
                                .shadow(color: EthicalGrowTheme.whatsappGreen.opacity(0.35), radius: 6, x: 0, y: 3)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)

                    // Hero Banner Card
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text("✦ LEARN & EARN ECOSYSTEM")
                                .font(.system(size: 10, weight: .black))
                                .foregroundColor(Color(hexString: "#FFD54F"))
                                .tracking(1.0)
                            Spacer()
                        }

                        Text("Master High-Income In-Demand Digital Skills")
                            .font(.system(size: 24, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                            .lineSpacing(2)

                        Text("From Python coding & Power BI to YouTube mastery, video editing, and Canva design — build real-world competency with verified certifications.")
                            .font(.system(size: 13))
                            .foregroundColor(.white.opacity(0.9))
                            .lineSpacing(3)

                        HStack(spacing: 12) {
                            NavigationLink(destination: PackagesListView()) {
                                Text("View Packages")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(EthicalGrowTheme.darkText)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 10)
                                    .background(Color.white)
                                    .cornerRadius(20)
                            }

                            NavigationLink(destination: PresentationView()) {
                                HStack(spacing: 4) {
                                    Image(systemName: "play.circle.fill")
                                    Text("Watch Plan")
                                }
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 10)
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(20)
                            }
                        }
                        .padding(.top, 4)
                    }
                    .padding(22)
                    .background(EthicalGrowTheme.brandGradient)
                    .cornerRadius(24)
                    .shadow(color: EthicalGrowTheme.primaryBlue.opacity(0.3), radius: 12, x: 0, y: 6)
                    .padding(.horizontal)

                    // Platform Key Metrics
                    HStack(spacing: 8) {
                        StatBadge(count: "50,000+", label: "Learners", iconSymbol: "person.3.fill", accentColor: EthicalGrowTheme.primaryBlue)
                        StatBadge(count: "15+", label: "Skill Courses", iconSymbol: "graduationcap.fill", accentColor: EthicalGrowTheme.purple)
                        StatBadge(count: "99.8%", label: "Satisfaction", iconSymbol: "hand.thumbsup.fill", accentColor: EthicalGrowTheme.green)
                        StatBadge(count: "24/7", label: "Mentorship", iconSymbol: "headphones", accentColor: EthicalGrowTheme.pink)
                    }
                    .padding(.horizontal)

                    // Featured Packages Section
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Popular Skill Bundles")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(EthicalGrowTheme.darkText)
                                Text("Get bundled access with 50% discount")
                                    .font(.system(size: 12))
                                    .foregroundColor(EthicalGrowTheme.muted)
                            }

                            Spacer()

                            NavigationLink(destination: PackagesListView()) {
                                Text("See All")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(EthicalGrowTheme.primaryBlue)
                            }
                        }
                        .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 14) {
                                ForEach(EthicalGrowData.officialPackages.prefix(4)) { pkg in
                                    PackageCardView(package: pkg) {
                                        selectedPackage = pkg
                                    }
                                    .frame(width: 290)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }

                    // Featured Courses Section
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Trending Courses")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(EthicalGrowTheme.darkText)
                                Text("Coding, Design, Video Editing & Growth")
                                    .font(.system(size: 12))
                                    .foregroundColor(EthicalGrowTheme.muted)
                            }

                            Spacer()

                            NavigationLink(destination: CoursesListView()) {
                                Text("See All")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(EthicalGrowTheme.primaryBlue)
                            }
                        }
                        .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 14) {
                                ForEach(EthicalGrowData.officialCourses.prefix(4)) { course in
                                    CourseCardView(course: course) {
                                        selectedCourse = course
                                    }
                                    .frame(width: 240)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }

                    // Founder Message Section
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(EthicalGrowTheme.brandGradient)
                                    .frame(width: 52, height: 52)
                                Image(systemName: "person.crop.circle.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            }

                            VStack(alignment: .leading, spacing: 2) {
                                Text("Er. Nitin Kumar")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(EthicalGrowTheme.darkText)
                                Text("Founder & CEO, EthicalGrow")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(EthicalGrowTheme.primaryBlue)
                            }
                        }

                        Text("\"At EthicalGrow, our mission is to empower youths and professionals with high-income digital competencies while staying grounded in strong ethical principles.\"")
                            .font(.system(size: 13))
                            .italic()
                            .foregroundColor(EthicalGrowTheme.muted)
                            .lineSpacing(3)
                    }
                    .padding(18)
                    .background(EthicalGrowTheme.cardBackground)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(EthicalGrowTheme.border, lineWidth: 1)
                    )
                    .padding(.horizontal)

                    Spacer(minLength: 24)
                }
            }
            .background(EthicalGrowTheme.background.ignoresSafeArea())
            .navigationBarHidden(true)
            .sheet(item: $selectedPackage) { pkg in
                PackageDetailSheet(package: pkg)
            }
            .sheet(item: $selectedCourse) { course in
                CourseDetailSheet(course: course)
            }
        }
    }
}
