# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Execute scripts on IMAP mailbox changes (new/deleted/updated messages) using IDLE, golang version."
HOMEPAGE="https://gitlab.com/shackra/goimapnotify"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

EGO_PN=gitlab.com/shackra/goimapnotify
EGIT_REPO_URI="https://gitlab.com/shackra/goimapnotify.git"

inherit go-module git-r3

src_unpack() {
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	go build -o goimapnotify || die "build failed"
}

src_install() {
	einstalldocs
	dobin goimapnotify
}
