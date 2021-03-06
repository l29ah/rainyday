# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
KMNAME=kdeedu
KMEXTRACTONLY="libkdeedu/kdeeducore"
KMCOPYLIB="libkdeeducore libkdeedu/kdeeducore"
inherit kde-meta
DESCRIPTION="[GIT] KDE: KLatin - a program to help revise Latin"
IUSE=""
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"

DEPEND="=kde-base/libkdeedu-${PV}:${SLOT}"
RDEPEND="${DEPEND}"
