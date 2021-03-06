# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
KMNAME=kdebase
inherit kde-meta eutils flag-o-matic
DESCRIPTION="[GIT] A simple password checker, used by any software in need of user authentication."
IUSE="pam kdehiddenvisibility"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"

DEPEND="pam? ( kde-base/kdebase-pam )"
RDEPEND="${DEPEND}"

src_compile() {
	myconf="$(use_with pam)"
	kde-meta_src_compile
}
