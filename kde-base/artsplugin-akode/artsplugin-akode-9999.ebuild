# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
KMNAME=kdemultimedia
KMMODULE=akode_artsplugin
KMCOPYLIB="libartsbuilder arts/runtime"
inherit kde-meta eutils
DESCRIPTION="[GIT] aKode aRts plugin."
IUSE=""

RDEPEND="media-libs/akode
	=kde-base/kdemultimedia-arts-${PV}:${SLOT}"
DEPEND="${RDEPEND}"

src_compile() {
	local myconf="--with-akode"
	kde-meta_src_compile
}
