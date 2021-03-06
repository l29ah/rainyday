# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit kde-functions
DESCRIPTION="[GIT] kdegames - merge this to pull in all kdegames-derived packages"
HOMEPAGE="http://www.kde.org/"
LICENSE="GPL-2"
SLOT="3.5"
IUSE="arts"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"

RDEPEND="
arts? ( =kde-base/kasteroids-${PV}:${SLOT}
=kde-base/kolf-${PV}:${SLOT} )
=kde-base/atlantik-${PV}:${SLOT}
=kde-base/katomic-${PV}:${SLOT}
=kde-base/kbackgammon-${PV}:${SLOT}
=kde-base/kbattleship-${PV}:${SLOT}
=kde-base/kblackbox-${PV}:${SLOT}
=kde-base/kbounce-${PV}:${SLOT}
=kde-base/kenolaba-${PV}:${SLOT}
=kde-base/kfouleggs-${PV}:${SLOT}
=kde-base/kgoldrunner-${PV}:${SLOT}
=kde-base/kjumpingcube-${PV}:${SLOT}
=kde-base/klickety-${PV}:${SLOT}
=kde-base/klines-${PV}:${SLOT}
=kde-base/kmahjongg-${PV}:${SLOT}
=kde-base/kmines-${PV}:${SLOT}
=kde-base/knetwalk-${PV}:${SLOT}
=kde-base/konquest-${PV}:${SLOT}
=kde-base/kpat-${PV}:${SLOT}
=kde-base/kpoker-${PV}:${SLOT}
=kde-base/ktron-${PV}:${SLOT}
=kde-base/ktuberling-${PV}:${SLOT}
=kde-base/ksame-${PV}:${SLOT}
=kde-base/kshisen-${PV}:${SLOT}
=kde-base/ksirtet-${PV}:${SLOT}
=kde-base/ksmiletris-${PV}:${SLOT}
=kde-base/ksnake-${PV}:${SLOT}
=kde-base/ksokoban-${PV}:${SLOT}
=kde-base/kspaceduel-${PV}:${SLOT}
=kde-base/kreversi-${PV}:${SLOT}
=kde-base/kwin4-${PV}:${SLOT}
=kde-base/lskat-${PV}:${SLOT}
"
