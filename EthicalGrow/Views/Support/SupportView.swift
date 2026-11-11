import SwiftUI

public struct SupportView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // WhatsApp Priority Support Card
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(EthicalGrowTheme.whatsappGreen)
                                    .frame(width: 48, height: 48)

                                Image(systemName: "message.fill")
                                    .font(.system(size: 22))
                                    .foregroundColor(.white)
                            }

                            VStack(alignment: .leading, spacing: 3) {
                                Text("Official WhatsApp Support")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(EthicalGrowTheme.darkText)

                                Text("+91 6397165292 • Instant Response")
                                    .font(.system(size: 12))
                                    .foregroundColor(EthicalGrowTheme.muted)
                            }

                            Spacer()
                        }

                        Text("Have questions regarding course access, affiliate activation, or package upgrades? Chat with our official student success team on WhatsApp.")
                            .font(.system(size: 13))
                            .foregroundColor(EthicalGrowTheme.darkText.opacity(0.85))
                            .lineSpacing(3)

                        Button(action: {
                            if let url = URL(string: EthicalGrowData.whatsappUrl) {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: "paperplane.fill")
                                Text("Chat on WhatsApp Now")
                            }
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(EthicalGrowTheme.whatsappGreen)
                            .cornerRadius(12)
                        }
                    }
                    .padding(18)
                    .background(EthicalGrowTheme.cardBackground)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(EthicalGrowTheme.whatsappGreen.opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal)
                    .padding(.top, 8)

                    // Quick Contact Options
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Get in Touch")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(EthicalGrowTheme.darkText)
                            .padding(.horizontal)

                        VStack(spacing: 8) {
                            contactRow(
                                title: "Email Support",
                                detail: EthicalGrowData.supportEmail,
                                icon: "envelope.fill",
                                color: EthicalGrowTheme.primaryBlue
                            ) {
                                if let url = URL(string: "mailto:\(EthicalGrowData.supportEmail)") {
                                    UIApplication.shared.open(url)
                                }
                            }

                            contactRow(
                                title: "Phone Helpline",
                                detail: EthicalGrowData.supportPhone,
                                icon: "phone.fill",
                                color: EthicalGrowTheme.green
                            ) {
                                if let url = URL(string: "tel:\(EthicalGrowData.supportPhone)") {
                                    UIApplication.shared.open(url)
                                }
                            }

                            contactRow(
                                title: "Headquarters",
                                detail: EthicalGrowData.location,
                                icon: "mappin.and.ellipse",
                                color: EthicalGrowTheme.pink
                            ) {
                                // Informational
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Leadership & Founders
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Leadership & Founders")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(EthicalGrowTheme.darkText)
                            .padding(.horizontal)

                        VStack(spacing: 12) {
                            ForEach(EthicalGrowData.founders) { founder in
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack(spacing: 12) {
                                        ZStack {
                                            Circle()
                                                .fill(EthicalGrowTheme.brandGradient)
                                                .frame(width: 44, height: 44)

                                            Image(systemName: founder.iconSymbol)
                                                .font(.system(size: 20))
                                                .foregroundColor(.white)
                                        }

                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(founder.name)
                                                .font(.system(size: 16, weight: .bold))
                                                .foregroundColor(EthicalGrowTheme.darkText)

                                            Text(founder.role)
                                                .font(.system(size: 12, weight: .semibold))
                                                .foregroundColor(EthicalGrowTheme.primaryBlue)
                                        }

                                        Spacer()

                                        Text(founder.city.components(separatedBy: ",").first ?? "")
                                            .font(.system(size: 11))
                                            .foregroundColor(EthicalGrowTheme.muted)
                                    }

                                    Text("\"\(founder.message)\"")
                                        .font(.system(size: 12))
                                        .italic()
                                        .foregroundColor(EthicalGrowTheme.muted)
                                        .lineSpacing(2)
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

                    // Official Social Links
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Follow Our Channels")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(EthicalGrowTheme.darkText)
                            .padding(.horizontal)

                        HStack(spacing: 12) {
                            socialButton(name: "YouTube", icon: "play.rectangle.fill", url: "https://www.youtube.com/@ethicalgrow", color: .red)
                            socialButton(name: "Instagram", icon: "camera.fill", url: "https://www.instagram.com/ethicalgrow_/", color: .purple)
                            socialButton(name: "Facebook", icon: "hand.thumbsup.fill", url: "https://www.facebook.com/ethicalgrow", color: .blue)
                        }
                        .padding(.horizontal)
                    }

                    // Disclaimer Note
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Educational Disclaimer")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(EthicalGrowTheme.darkText)

                        Text("EthicalGrow is an educational skill-development platform. Course programs are designed strictly for knowledge acquisition and personal development. Results in jobs, freelancing, or earnings depend on personal dedication, market practice, and execution.")
                            .font(.system(size: 11))
                            .foregroundColor(EthicalGrowTheme.muted)
                            .lineSpacing(2)
                    }
                    .padding(14)
                    .background(EthicalGrowTheme.softBg)
                    .cornerRadius(14)
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                }
            }
            .background(EthicalGrowTheme.background.ignoresSafeArea())
            .navigationTitle("Support & About")
        }
    }

    private func contactRow(title: String, detail: String, icon: String, color: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 16))
                    .foregroundColor(color)
                    .frame(width: 36, height: 36)
                    .background(color.opacity(0.12))
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(EthicalGrowTheme.darkText)

                    Text(detail)
                        .font(.system(size: 12))
                        .foregroundColor(EthicalGrowTheme.muted)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 11))
                    .foregroundColor(EthicalGrowTheme.muted)
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

    private func socialButton(name: String, icon: String, url: String, color: Color) -> some View {
        Button(action: {
            if let target = URL(string: url) {
                UIApplication.shared.open(target)
            }
        }) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundColor(color)

                Text(name)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(EthicalGrowTheme.darkText)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(EthicalGrowTheme.cardBackground)
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(EthicalGrowTheme.border, lineWidth: 1)
            )
        }
    }
}
