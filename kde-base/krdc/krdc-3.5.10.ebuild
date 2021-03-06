# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/krdc/krdc-3.5.10.ebuild,v 1.8 2009/07/12 10:52:13 armin76 Exp $

EAPI="1"
KMNAME=kdenetwork
inherit kde-meta eutils

DESCRIPTION="KDE remote desktop connection (RDP and VNC) client"
KEYWORDS="alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="kdehiddenvisibility rdesktop slp"

DEPEND=">=dev-libs/openssl-0.9.6b
	slp? ( net-libs/openslp )
	x11-libs/libXxf86vm
	x11-libs/libXtst"
RDEPEND="${DEPEND}
	rdesktop? ( >=net-misc/rdesktop-1.4.1 )"

src_compile() {
	local myconf="$(use_enable slp)"
	kde-meta_src_compile
}
