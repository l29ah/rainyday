# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
KMNAME=kdeaddons
KMNOMODULE=true
KMEXTRA="kicker-applets doc/kicker-applets"
inherit kde-meta
DESCRIPTION="[GIT] kicker applets"
IUSE=""
DEPEND="|| ( =kde-base/kicker-${PV}:${SLOT} =kde-base/kdebase-${PV}:${SLOT} )"

RDEPEND="${DEPEND}"

src_compile() {
	myconf="--without-xmms"
	kde-meta_src_compile
}
