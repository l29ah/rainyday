# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit kde-functions
DESCRIPTION="[GIT] kdeutils - merge this to pull in all kdeutils-derived packages"
HOMEPAGE="http://www.kde.org/"
LICENSE="GPL-2"
SLOT="3.5"
IUSE="crypt lirc"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"

RDEPEND="
	=kde-base/ark-${PV}:${SLOT}
	=kde-base/kcalc-${PV}:${SLOT}
	=kde-base/kcharselect-${PV}:${SLOT}
	lirc? ( =kde-base/kdelirc-${PV}:${SLOT} )
	=kde-base/kdf-${PV}:${SLOT}
	crypt? ( =kde-base/kgpg-${PV}:${SLOT} )
	=kde-base/khexedit-${PV}:${SLOT}
	=kde-base/kjots-${PV}:${SLOT}
	=kde-base/klaptopdaemon-${PV}:${SLOT}
	=kde-base/kmilo-${PV}:${SLOT}
	=kde-base/kregexpeditor-${PV}:${SLOT}
	=kde-base/ksim-${PV}:${SLOT}
	=kde-base/ktimer-${PV}:${SLOT}
	=kde-base/kwalletmanager-${PV}:${SLOT}
	=kde-base/superkaramba-${PV}:${SLOT}
"
