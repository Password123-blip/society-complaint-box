import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Society Complaint Box",
  description: "A paper trail for building complaints",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="antialiased">{children}</body>
    </html>
  );
}
