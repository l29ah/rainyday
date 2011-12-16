# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/scrotwm/scrotwm-0.9.34.ebuild,v 1.1 2011/10/15 09:00:04 xmw Exp $

EAPI=3

inherit eutils multilib toolchain-funcs git-2

DESCRIPTION="Small dynamic tiling window manager for X11"
HOMEPAGE="http://www.scrotwm.org"
#SRC_URI="http://opensource.conformal.com/snapshots/${PN}/${P}.tgz"
EGIT_REPO_URI="git://opensource.conformal.com/scrotwm.git"
EGIT_SOURCEDIR="${WORKDIR}"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-misc/dmenu"
DEPEND="${DEPEND}
	x11-libs/libX11
	x11-libs/libXrandr
	x11-libs/libXtst"

src_prepare() {
#	epatch "${FILESDIR}"/scrotwm-0.9.34-makefile.patch
	tc-export CC
}

S=${WORKDIR}/linux
src_install() {
	emake PREFIX="${D}"usr LIBDIR="${D}usr/$(get_libdir)"  install || die

	# Set session
	insinto /usr/share/xsessions
	doins ${FILESDIR}/scrotwm.desktop

	# Set executable script
	exeinto /usr/local/bin
	doexe ${FILESDIR}/scrotwm.sh
}
