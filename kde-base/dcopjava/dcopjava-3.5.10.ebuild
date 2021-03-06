# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/dcopjava/dcopjava-3.5.10.ebuild,v 1.3 2009/06/11 15:07:26 fauli Exp $

# NOTE TODO install a jar file rather than a tree of class files, and use java-pkg.eclass,
# in keeping with policy

# Do NOT stable this package!
EAPI="1"
KMNAME=kdebindings
KMEXTRACTONLY="kdejava/configure.in.in"
KM_MAKEFILESREV=1
inherit kde-meta

DESCRIPTION="Java bindings for DCOP"
KEYWORDS="amd64 ~ppc ~ppc64 x86" # possibly broken according to upstream - 3.5.7 README
IUSE=""
DEPEND="virtual/jdk"
RDEPEND="virtual/jre"
PATCHES=( "$FILESDIR/no-gtk-glib-check.diff" )

pkg_setup() {
	ewarn "This package is considered \"possibly broken\" by upstream. You're on your own."
}

src_unpack() {
	kde-meta_src_unpack

	cd "${S}"/dcopjava/binding/org/kde/DCOP/
	for x in Makefile.am Makefile.in; do
		sed -e "s/-cp/-classpath/" -i ${x}
	done
}

src_compile () {
	myconf="$myconf --with-java=$(java-config --jdk-home)"
	kde-meta_src_compile
}
