EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit toolchain-funcs lua-single git-r3

DESCRIPTION="A language server for Fennel."
HOMEPAGE="https://git.sr.ht/~xerool/fennel-ls"
EGIT_REPO_URI="https://git.sr.ht/~xerool/fennel-ls"
EGIT_BRANCH="main"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
REQUIRE_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"
RESTRICT="!test? ( test )"

src_compile() {
	emake
}

src_test() {
	emake test
	emake testall
}

src_install() {
	dobin fennel-ls
}
