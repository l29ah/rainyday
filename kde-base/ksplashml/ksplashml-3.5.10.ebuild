# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/ksplashml/ksplashml-3.5.10.ebuild,v 1.7 2009/07/12 09:46:34 armin76 Exp $
EAPI="1"
KMNAME=kdebase

inherit kde-meta eutils

DESCRIPTION="KDE splashscreen framework (the splashscreen of KDE itself, not of individual apps)"
KEYWORDS="alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="kdehiddenvisibility xinerama"

DEPEND="x11-libs/libXcursor
	xinerama? ( x11-proto/xineramaproto )"
RDEPEND="x11-libs/libXcursor
	xinerama? ( x11-libs/libXinerama )"

src_compile() {
	myconf="${myconf} $(use_with xinerama)"

	kde-meta_src_compile
}
