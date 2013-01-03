# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kspy/kspy-3.5.10.ebuild,v 1.6 2009/07/12 10:58:18 armin76 Exp $

EAPI=2
RESTRICT="test"
KMNAME=kdesdk
KDE_DOWNLOAD_SOURCE="git"
inherit kde-meta eutils
DESCRIPTION="[GIT] kspy - an utility intended to help developers examine the internal state of a Qt/KDE application"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="kdehiddenvisibility"