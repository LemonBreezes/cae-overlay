# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils git-r3

DESCRIPTION="Fast XML parser"
HOMEPAGE="https://github.com/CodeFinder2/rapidxml"
EGIT_REPO_URI="https://github.com/CodeFinder2/rapidxml.git"
EGIT_BRANCH="main"

LICENSE="Boost-1.0 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install() {
	DOCS=( "README.md" )
	HTML_DOCS=( "doc/manual.html" )
	default

	insinto /usr/include
	doins -r include/*
}
