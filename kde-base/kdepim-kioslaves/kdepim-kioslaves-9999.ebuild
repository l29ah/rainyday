# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdepim-kioslaves/kdepim-kioslaves-3.5.10.ebuild,v 1.7 2009/07/12 11:33:17 armin76 Exp $

EAPI=2
KMNAME=kdepim
KMMODULE=kioslaves
KMCOPYLIB="libkmime libkmime/"
KMEXTRACTONLY="libkmime/"
KMCOMPILEONLY="libemailfunctions"
KDE_DOWNLOAD_SOURCE="git"
inherit kde-meta eutils
DESCRIPTION="[GIT] kioslaves from kdepim package"
IUSE="sasl"
DEPEND="sasl? ( >=dev-libs/cyrus-sasl-2 )
	=kde-base/libkmime-${PV}:${SLOT}"

PATCHES=( "${FILESDIR}/${P}-kio_imap4_fix_infinite_loop.patch"
	"${FILESDIR}/${KMNAME}_${KMMODULE}-r875280.patch" )

src_compile() {
	myconf="$myconf $(use_with sasl)"
	kde-meta_src_compile
}