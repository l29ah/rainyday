# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
KMNAME=kdebase
KMNOMODULE=true
KMEXTRACTONLY="kdm/kfrontend/sessions/kde.desktop.in startkde"
inherit multilib kde-meta eutils
DESCRIPTION="[GIT] startkde script, which starts a complete KDE session, and associated scripts"
IUSE=""
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"

# The kde apps called from the startkde script.
# kdesktop, kicker etc are started because they put files in $KDEDIR/share/autostart
# and so in theory they aren't strictly necessary deps.
RDEPEND="x11-apps/xmessage
	x11-apps/xsetroot
	x11-apps/xset
	x11-apps/xrandr
	x11-apps/mkfontdir
	x11-apps/xprop
	=kde-base/kdesktop-${PV}:${SLOT}
	=kde-base/kcminit-${PV}:${SLOT}
	=kde-base/ksmserver-${PV}:${SLOT}
	=kde-base/kwin-${PV}:${SLOT}
	=kde-base/kpersonalizer-${PV}:${SLOT}
	=kde-base/kreadconfig-${PV}:${SLOT}
	=kde-base/ksplashml-${PV}:${SLOT}"

src_compile() {
	# Patch the startkde script to setup the environment for KDE 4.0
	# Add our KDEDIR
	sed -i -e "s#@REPLACE_PREFIX@#${PREFIX}#" \
		"${S}/startkde" || die "Sed for PREFIX failed."

	# List all the multilib libdirs
	local _libdir _libdirs
	for _libdir in $(get_all_libdirs); do
		_libdirs="${_libdirs}:${PREFIX}/${_libdir}"
	done
	_libdirs=${_libdirs#:}

	# Complete LDPATH
	sed -i -e "s#@REPLACE_LIBS@#${_libdirs}#" \
		"${S}/startkde" || die "Sed for LDPATH failed."
}

src_install() {
	# startkde script
	exeinto "${KDEDIR}/bin"
	doexe startkde

	# startup and shutdown scripts
	exeinto "${KDEDIR}/env"
	doexe "${FILESDIR}/agent-startup.sh"

	exeinto "${KDEDIR}/shutdown"
	doexe "${FILESDIR}/agent-shutdown.sh"

	# freedesktop environment variables
	cat <<EOF > "${T}/xdg.sh"
export XDG_CONFIG_DIRS="${KDEDIR}/etc/xdg"
EOF
	exeinto "${KDEDIR}/env"
	doexe "${T}/xdg.sh"

	# x11 session script
	cat <<EOF > "${T}/kde"
#!/bin/sh
exec ${KDEDIR}/bin/startkde
EOF
	exeinto /etc/X11/Sessions
	doexe "${T}/kde"

	# (not really) freedesktop compliant session script
	sed -e "s:@KDE_BINDIR@:${KDEDIR}/bin:g;s:Name=KDE:Name=KDE-LIVE:" \
		"${S}/kdm/kfrontend/sessions/kde.desktop.in" > "${T}/kde.desktop"
	insinto /usr/share/xsessions
	doins "${T}/kde.desktop"
}

pkg_postinst () {
	echo
	elog "To enable gpg-agent and/or ssh-agent in KDE sessions,"
	elog "edit ${KDEDIR}/env/agent-startup.sh and"
	elog "${KDEDIR}/shutdown/agent-shutdown.sh"
	echo
}
