# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..12} )

inherit git-r3 distutils-r1

DESCRIPTION="ChatGPT plugin for GDB or LLDB"
HOMEPAGE="https://github.com/pgosar/ChatGDB"
EGIT_REPO_URI="https://github.com/pgosar/ChatGDB.git"

LICENSE="MIT"
SLOT="0"
RESTRICT="test"
