import SwiftUI
import WebKit

// MARK: - YouTube Player Helper
struct YouTubeVideoView: UIViewRepresentable {
    let videoId: String

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.scrollView.isScrollEnabled = false
        webView.backgroundColor = .black
        if let url = URL(string: "https://www.youtube.com/embed/\(videoId)?playsinline=1") {
            webView.load(URLRequest(url: url))
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

public struct PresentationView: View {
    @State private var expandedFaqIndex: Int? = 0

    public init() {}

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Video Player Card
                    VStack(alignment: .leading, spacing: 10) {
                        YouTubeVideoView(videoId: EthicalGrowData.presentationYoutubeId)
                            .frame(height: 215)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)

                        HStack {
                            Label("OFFICIAL PRESENTATION", systemImage: "play.circle.fill")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(EthicalGrowTheme.pink)
                                .tracking(1.0)

                            Spacer()

                            Button(action: {
                                if let url = URL(string: EthicalGrowData.presentationVideoUrl) {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                HStack(spacing: 4) {
                                    Text("Open on YouTube")
                                    Image(systemName: "arrow.up.right")
                                }
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(EthicalGrowTheme.primaryBlue)
                            }
                        }
                        .padding(.top, 4)
                    }
                    .padding(14)
                    .background(EthicalGrowTheme.cardBackground)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(EthicalGrowTheme.border, lineWidth: 1)
                    )
                    .padding(.horizontal)

                    // Platform Pillars
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Why Learn with EthicalGrow?")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(EthicalGrowTheme.darkText)
                            .padding(.horizontal)

                        VStack(spacing: 10) {
                            pillarCard(
                                title: "Practical Digital Skills",
                                desc: "No boring theory. Master tools used by modern professionals: Python, Power BI, Photoshop 2027, VN, and Canva Pro.",
                                icon: "laptopcomputer",
                                color: EthicalGrowTheme.primaryBlue
                            )
                            pillarCard(
                                title: "Ethical & Transparent",
                                desc: "Founded on genuine learning values. We focus on true skill acquisition and honest career enablement.",
                                icon: "shield.checkered",
                                color: EthicalGrowTheme.green
                            )
                            pillarCard(
                                title: "Verified Course Certificates",
                                desc: "Earn verifiable certificates after passing quizzes and completing project work to boost your resume.",
                                icon: "rosette",
                                color: EthicalGrowTheme.purple
                            )
                            pillarCard(
                                title: "Active Community & Mentorship",
                                desc: "Join student support groups, attend live expert webinars, and get answers from experienced practitioners.",
                                icon: "person.3.fill",
                                color: EthicalGrowTheme.pink
                            )
                        }
                        .padding(.horizontal)
                    }

                    // FAQ Accordion
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Frequently Asked Questions")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(EthicalGrowTheme.darkText)
                            .padding(.horizontal)

                        VStack(spacing: 10) {
                            ForEach(Array(EthicalGrowData.faqs.enumerated()), id: \.offset) { index, faq in
                                let isExpanded = expandedFaqIndex == index
                                VStack(alignment: .leading, spacing: 8) {
                                    Button(action: {
                                        withAnimation(.easeInOut(duration: 0.2)) {
                                            expandedFaqIndex = isExpanded ? nil : index
                                        }
                                    }) {
                                        HStack(alignment: .center) {
                                            Text(faq.question)
                                                .font(.system(size: 14, weight: .bold))
                                                .foregroundColor(EthicalGrowTheme.darkText)
                                                .multilineTextAlignment(.leading)

                                            Spacer()

                                            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                                                .font(.system(size: 12, weight: .bold))
                                                .foregroundColor(EthicalGrowTheme.muted)
                                        }
                                    }

                                    if isExpanded {
                                        Text(faq.answer)
                                            .font(.system(size: 13))
                                            .foregroundColor(EthicalGrowTheme.muted)
                                            .lineSpacing(3)
                                            .padding(.top, 2)
                                    }
                                }
                                .padding(14)
                                .background(EthicalGrowTheme.cardBackground)
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(EthicalGrowTheme.border, lineWidth: 1)
                                )
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Direct Action
                    Button(action: {
                        if let url = URL(string: EthicalGrowData.packagesUrl) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("Explore Packages & Join Today")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(EthicalGrowTheme.brandGradient)
                            .cornerRadius(14)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                }
            }
            .background(EthicalGrowTheme.background.ignoresSafeArea())
            .navigationTitle("Presentation")
        }
    }

    private func pillarCard(title: String, desc: String, icon: String, color: Color) -> some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(color)
                .frame(width: 38, height: 38)
                .background(color.opacity(0.12))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(EthicalGrowTheme.darkText)
                Text(desc)
                    .font(.system(size: 12))
                    .foregroundColor(EthicalGrowTheme.muted)
            }
            Spacer()
        }
        .padding(12)
        .background(EthicalGrowTheme.cardBackground)
        .cornerRadius(14)
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(EthicalGrowTheme.border, lineWidth: 1)
        )
    }
}
