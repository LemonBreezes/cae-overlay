# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Modal keyboard-driven pointer manipulation for X11 and Wayland"
HOMEPAGE="https://github.com/rvaiya/warpd"
SRC_URI="https://github.com/rvaiya/warpd/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+X wayland"
REQUIRED_USE="|| ( X wayland )"

RDEPEND="
	X? (
		media-libs/freetype
		x11-libs/libX11
		x11-libs/libXext
		x11-libs/libXfixes
		x11-libs/libXft
		x11-libs/libXi
		x11-libs/libXinerama
		x11-libs/libXtst
	)
	wayland? (
		dev-libs/wayland
		x11-libs/cairo
		x11-libs/libxkbcommon
	)
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_compile() {
	# The Makefile folds its link libraries into CFLAGS and never references
	# LDFLAGS, so flags must reach it via the environment: a command-line
	# "CFLAGS=" would override the makefile's "CFLAGS := ... $(CFLAGS)"
	# assignment and drop -lX11 and friends. CC is only used in recipes, so
	# passing it as a make argument is safe.
	local makeargs=( CC="$(tc-getCC)" PREFIX="${EPREFIX}/usr" )
	use X || makeargs+=( DISABLE_X=1 )
	use wayland || makeargs+=( DISABLE_WAYLAND=1 )

	CFLAGS="${CFLAGS} ${LDFLAGS}" emake "${makeargs[@]}"
}

src_install() {
	dobin bin/warpd

	# Upstream ships a pre-gzipped manpage; decompress it so portage performs
	# its own (de)compression and we avoid a docompress QA notice.
	gunzip -c files/warpd.1.gz > "${T}"/warpd.1 || die
	doman "${T}"/warpd.1

	einstalldocs
}
