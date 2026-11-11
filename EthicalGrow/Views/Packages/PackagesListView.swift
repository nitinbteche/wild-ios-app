import SwiftUI

public struct PackagesListView: View {
    @State private var selectedPackage: PackageItem? = nil

    public init() {}

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Header Banner
                    VStack(spacing: 6) {
                        Text("Skill Development Packages")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(EthicalGrowTheme.darkText)

                        Text("Choose the package that aligns with your digital career goals. All packages include verified course certificates.")
                            .font(.system(size: 13))
                            .foregroundColor(EthicalGrowTheme.muted)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding(.top, 10)

                    // Packages List
                    LazyVStack(spacing: 16) {
                        ForEach(EthicalGrowData.officialPackages) { pkg in
                            PackageCardView(package: pkg) {
                                selectedPackage = pkg
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                }
            }
            .background(EthicalGrowTheme.background.ignoresSafeArea())
            .navigationTitle("Packages")
            .sheet(item: $selectedPackage) { pkg in
                PackageDetailSheet(package: pkg)
            }
        }
    }
}
