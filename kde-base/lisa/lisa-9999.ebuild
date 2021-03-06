# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/lisa/lisa-3.5.10.ebuild,v 1.7 2009/07/12 11:15:36 armin76 Exp $

EAPI=2
KMNAME=kdenetwork
KMMODULE=lanbrowsing
KMEXTRA="doc/kcontrol/lanbrowser"
inherit kde-meta eutils flag-o-matic
DESCRIPTION="[GIT] KDE Lan Information Server - allows KDE desktops to share information over a network."
IUSE="kdehiddenvisibility"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"

src_compile() {
	kde-meta_src_compile
}

src_install() {
	kde-meta_src_install

	chmod u+s "${D}/${KDEDIR}/bin/reslisa"

	# lisa, reslisa initscripts
	sed -e "s:_KDEDIR_:${KDEDIR}:g" "${WORKDIR}/patches/lisa" > "${T}/lisa"
	sed -e "s:_KDEDIR_:${KDEDIR}:g" "${WORKDIR}/patches/reslisa" > "${T}/reslisa"
	doinitd "${T}/lisa" "${T}/reslisa"

	newconfd "${WORKDIR}/patches/lisa.conf" lisa
	newconfd "${FILESDIR}/reslisa.conf" reslisa

	for x in /etc/lisarc /etc/reslisarc; do
		echo '# Default lisa/reslisa configfile' > "$D"/$x
	done
}
