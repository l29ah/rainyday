# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-misc/kdnssd-avahi/kdnssd-avahi-0.1.2-r1.ebuild,v 1.6 2009/10/12 07:09:16 abcd Exp $

EAPI=2
KMNAME=kdnssd-avahi
KDE_DOWNLOAD_SOURCE="git"
inherit kde

need-kde 9999

DESCRIPTION="[GIT] DNS Service Discovery kioslave using Avahi (rather than mDNSResponder)"
HOMEPAGE="http://wiki.kde.org/tiki-index.php?page=Zeroconf+in+KDE"
LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="net-dns/avahi[qt3,dbus]"
DEPEND="${RDEPEND}"

src_compile() {
	emake -C "${S}/${PN}" mocs || die "make mocs failed"
	kde_src_compile make
}