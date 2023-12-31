# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.6.3

EAPI=8

inherit cargo flag-o-matic git-r3

DESCRIPTION="Stack-based patch management for Git"
HOMEPAGE="https://stacked-git.github.io/"
EGIT_REPO_URI="https://github.com/stacked-git/stgit.git"
EGIT_BRANCH="master"

LICENSE="GPL-2"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD MIT Unicode-DFS-2016"
SLOT="0/2"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"
IUSE="doc"

DEPEND="doc? ( app-text/asciidoc )"
RDEPEND=""

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/stg"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	filter-lto #bug 897692
}

src_compile() {
	cargo_src_compile
	emake completion
	emake contrib
	use doc && emake doc
}

src_install() {
	cargo_src_install
	emake DESTDIR="${D}" prefix="/usr" install-completion
	emake DESTDIR="${D}" prefix="/usr" install-contrib
	if use doc; then
		emake DESTDIR="${D}" prefix="/usr" install-man
		emake DESTDIR="${D}" prefix="/usr" \
			htmldir="/usr/share/doc/${PF}"  \
			install-html
	fi
}
