import SwiftUI

public struct PackageCardView: View {
    public let package: PackageItem
    public let onSelect: () -> Void

    public init(package: PackageItem, onSelect: @escaping () -> Void) {
        self.package = package
        self.onSelect = onSelect
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            // Header Row: Badge & Discount
            HStack {
                if let badge = package.badge {
                    Text(badge.uppercased())
                        .font(.system(size: 10, weight: .black))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(EthicalGrowTheme.brandGradient)
                        .clipShape(Capsule())
                }

                Spacer()

                Text("\(package.discountPercent)% OFF")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(EthicalGrowTheme.green)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(EthicalGrowTheme.green.opacity(0.12))
                    .clipShape(Capsule())
            }

            // Package Title & Subtitle
            VStack(alignment: .leading, spacing: 4) {
                Text(package.name)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(EthicalGrowTheme.darkText)

                Text(package.subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(EthicalGrowTheme.muted)
                    .lineLimit(2)
            }

            // Price Row
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Text("₹\(package.price)")
                    .font(.system(size: 26, weight: .heavy, design: .rounded))
                    .foregroundColor(EthicalGrowTheme.primaryBlue)

                Text("₹\(package.originalPrice)")
                    .font(.system(size: 14, weight: .medium))
                    .strikethrough()
                    .foregroundColor(EthicalGrowTheme.muted)

                Spacer()
            }

            Divider()

            // Key Highlights List
            VStack(alignment: .leading, spacing: 6) {
                ForEach(package.features.prefix(3), id: \.self) { feat in
                    HStack(spacing: 8) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 12))
                            .foregroundColor(EthicalGrowTheme.green)

                        Text(feat)
                            .font(.system(size: 12))
                            .foregroundColor(EthicalGrowTheme.darkText)
                            .lineLimit(1)
                    }
                }
            }

            // Enroll / View Syllabus Button
            Button(action: onSelect) {
                Text("View Details & Enroll")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(EthicalGrowTheme.primaryBlue)
                    .cornerRadius(12)
            }
        }
        .padding(18)
        .background(EthicalGrowTheme.cardBackground)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(EthicalGrowTheme.border, lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.04), radius: 8, x: 0, y: 3)
    }
}

public struct PackageDetailSheet: View {
    public let package: PackageItem
    @Environment(\.dismiss) private var dismiss

    public init(package: PackageItem) {
        self.package = package
    }

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Hero Price Card
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            if let badge = package.badge {
                                Text(badge.uppercased())
                                    .font(.system(size: 11, weight: .black))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(EthicalGrowTheme.pink)
                                    .clipShape(Capsule())
                            }

                            Spacer()

                            Text("Limited Time \(package.discountPercent)% OFF")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(EthicalGrowTheme.green)
                        }

                        Text(package.name)
                            .font(.system(size: 26, weight: .heavy, design: .rounded))
                            .foregroundColor(EthicalGrowTheme.darkText)

                        Text(package.subtitle)
                            .font(.system(size: 14))
                            .foregroundColor(EthicalGrowTheme.muted)

                        HStack(alignment: .firstTextBaseline, spacing: 10) {
                            Text("₹\(package.price)")
                                .font(.system(size: 32, weight: .heavy, design: .rounded))
                                .foregroundColor(EthicalGrowTheme.primaryBlue)

                            Text("₹\(package.originalPrice)")
                                .font(.system(size: 16))
                                .strikethrough()
                                .foregroundColor(EthicalGrowTheme.muted)
                        }
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(EthicalGrowTheme.softBg)
                    .cornerRadius(20)
                    .padding(.horizontal)

                    // Included Courses in this Bundle
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Courses Included in this Bundle")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(EthicalGrowTheme.darkText)

                        VStack(spacing: 8) {
                            ForEach(package.includedCourses, id: \.self) { course in
                                HStack(spacing: 12) {
                                    Image(systemName: "graduationcap.fill")
                                        .font(.system(size: 14))
                                        .foregroundColor(EthicalGrowTheme.primaryBlue)

                                    Text(course)
                                        .font(.system(size: 13, weight: .semibold))
                                        .foregroundColor(EthicalGrowTheme.darkText)

                                    Spacer()
                                }
                                .padding(12)
                                .background(EthicalGrowTheme.cardBackground)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(EthicalGrowTheme.border, lineWidth: 1)
                                )
                            }
                        }
                    }
                    .padding(.horizontal)

                    // Package Perks
                    VStack(alignment: .leading, spacing: 12) {
                        Text("What You'll Receive")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(EthicalGrowTheme.darkText)

                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(package.features, id: \.self) { feature in
                                HStack(spacing: 10) {
                                    Image(systemName: "checkmark.seal.fill")
                                        .font(.system(size: 16))
                                        .foregroundColor(EthicalGrowTheme.green)

                                    Text(feature)
                                        .font(.system(size: 13))
                                        .foregroundColor(EthicalGrowTheme.darkText)
                                }
                            }
                        }
                        .padding(16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(EthicalGrowTheme.cardBackground)
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(EthicalGrowTheme.border, lineWidth: 1)
                        )
                    }
                    .padding(.horizontal)

                    // Enroll Action
                    VStack(spacing: 12) {
                        Button(action: {
                            if let url = URL(string: package.webUrl) {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "lock.open.fill")
                                Text("Enroll Now for ₹\(package.price)")
                            }
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(EthicalGrowTheme.brandGradient)
                            .cornerRadius(16)
                            .shadow(color: EthicalGrowTheme.primaryBlue.opacity(0.35), radius: 8, x: 0, y: 4)
                        }

                        HStack(spacing: 6) {
                            Image(systemName: "shield.checkmark.fill")
                                .foregroundColor(EthicalGrowTheme.green)
                            Text("Secure Payment via ethicalgrow.in")
                                .font(.system(size: 12))
                                .foregroundColor(EthicalGrowTheme.muted)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                }
            }
            .navigationTitle(package.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }
}
