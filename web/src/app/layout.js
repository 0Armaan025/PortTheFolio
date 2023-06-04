import './globals.css'
import { Inter } from 'next/font/google'

const inter = Inter({ subsets: ['latin'] })

export const metadata = {
  title: "PortTheFolio",
  description:
    "PortTheFolio is a flutter app designed for helping users understand the portfolio efficiently in a unique storytelling way!",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body className={inter.className}>{children}</body>
    </html>
  )
}
