# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit git-r3 distutils-r1

DESCRIPTION="An API standard for single-agent reinforcement learning environments"
HOMEPAGE="https://github.com/Farama-Foundation/Gymnasium"
EGIT_REPO_URI="https://github.com/Farama-Foundation/Gymnasium.git"

LICENSE="MIT"
SLOT="0"
RESTRICT="test"
