# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
KMNAME=kdegraphics
inherit kde-meta eutils
DESCRIPTION="[GIT] KDE: A fast and versatile image viewer"
IUSE=""

DEPEND="
	x11-libs/libXext
	media-libs/imlib
"
