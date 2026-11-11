import SwiftUI
import WebKit

// MARK: - WKWebView Representable
public struct WebViewWrapper: UIViewRepresentable {
    public let urlString: String
    @Binding public var canGoBack: Bool
    @Binding public var canGoForward: Bool
    @Binding public var isLoading: Bool
    @Binding public var estimatedProgress: Double
    public let webView: WKWebView

    public init(
        urlString: String,
        canGoBack: Binding<Bool>,
        canGoForward: Binding<Bool>,
        isLoading: Binding<Bool>,
        estimatedProgress: Binding<Double>,
        webView: WKWebView
    ) {
        self.urlString = urlString
        self._canGoBack = canGoBack
        self._canGoForward = canGoForward
        self._isLoading = isLoading
        self._estimatedProgress = estimatedProgress
        self.webView = webView
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        context.coordinator.setupProgressObserver(for: webView)

        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }

        return webView
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {
        // Dynamic updates handled by controller
    }

    public class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebViewWrapper
        private var progressObservation: NSKeyValueObservation?

        init(_ parent: WebViewWrapper) {
            self.parent = parent
        }

        func setupProgressObserver(for webView: WKWebView) {
            progressObservation = webView.observe(\.estimatedProgress, options: [.new]) { [weak self] webView, _ in
                DispatchQueue.main.async {
                    self?.parent.estimatedProgress = webView.estimatedProgress
                }
            }
        }

        public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            DispatchQueue.main.async {
                self.parent.isLoading = true
                self.parent.canGoBack = webView.canGoBack
                self.parent.canGoForward = webView.canGoForward
            }
        }

        public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            DispatchQueue.main.async {
                self.parent.isLoading = false
                self.parent.canGoBack = webView.canGoBack
                self.parent.canGoForward = webView.canGoForward
            }
        }

        public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            DispatchQueue.main.async {
                self.parent.isLoading = false
            }
        }
    }
}

// MARK: - WebPortalView
public struct WebPortalView: View {
    public var initialUrl: String = EthicalGrowData.loginUrl

    @State private var webView = WKWebView()
    @State private var canGoBack = false
    @State private var canGoForward = false
    @State private var isLoading = false
    @State private var progress: Double = 0.0
    @State private var selectedShortcut = "Login"

    public init(initialUrl: String = EthicalGrowData.loginUrl) {
        self.initialUrl = initialUrl
    }

    public var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Quick URL Switcher Toolbar
                HStack(spacing: 8) {
                    shortcutChip(title: "Student Login", url: EthicalGrowData.loginUrl)
                    shortcutChip(title: "Register", url: EthicalGrowData.registerUrl)
                    shortcutChip(title: "Full Website", url: EthicalGrowData.homeUrl)
                    shortcutChip(title: "Packages", url: EthicalGrowData.packagesUrl)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(EthicalGrowTheme.cardBackground)

                // Loading progress indicator
                if isLoading {
                    ProgressView(value: progress, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: EthicalGrowTheme.primaryBlue))
                        .frame(height: 3)
                }

                // In-App WKWebView
                WebViewWrapper(
                    urlString: initialUrl,
                    canGoBack: $canGoBack,
                    canGoForward: $canGoForward,
                    isLoading: $isLoading,
                    estimatedProgress: $progress,
                    webView: webView
                )
            }
            .background(EthicalGrowTheme.background.ignoresSafeArea())
            .navigationTitle("Student Portal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: { webView.goBack() }) {
                        Image(systemName: "chevron.backward")
                    }
                    .disabled(!canGoBack)

                    Spacer()

                    Button(action: { webView.goForward() }) {
                        Image(systemName: "chevron.forward")
                    }
                    .disabled(!canGoForward)

                    Spacer()

                    Button(action: { webView.reload() }) {
                        Image(systemName: "arrow.clockwise")
                    }

                    Spacer()

                    if let url = webView.url {
                        ShareLink(item: url) {
                            Image(systemName: "square.and.arrow.up")
                        }

                        Spacer()

                        Button(action: {
                            UIApplication.shared.open(url)
                        }) {
                            Image(systemName: "safari")
                        }
                    }
                }
            }
        }
    }

    private func shortcutChip(title: String, url: String) -> some View {
        Button(action: {
            selectedShortcut = title
            if let target = URL(string: url) {
                webView.load(URLRequest(url: target))
            }
        }) {
            Text(title)
                .font(.system(size: 11, weight: .bold))
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .foregroundColor(selectedShortcut == title ? .white : EthicalGrowTheme.darkText)
                .background(selectedShortcut == title ? EthicalGrowTheme.primaryBlue : Color.gray.opacity(0.12))
                .clipShape(Capsule())
        }
    }
}
