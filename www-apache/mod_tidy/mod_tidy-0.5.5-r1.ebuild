# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

inherit apache-module

DESCRIPTION="TidyLib module to clean-up and pretty-print the webserver (X)HTML output"
SRC_URI="http://mod-tidy.sourceforge.net/src/${P}.tar.gz"
HOMEPAGE="http://mod-tidy.sourceforge.net/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

APACHE2_MOD_CONF="55_${PN}"
APACHE2_MOD_DEFINE="TIDY"

DEPEND="app-text/htmltidy"
RDEPEND="${DEPEND}"

need_apache2

DOCFILES="Changes INSTALL LICENSE README"

src_prepare() {
	rm -rf tidy/
}

src_configure() {
	:
}

src_compile() {
	${APXS} -c src/mod_tidy.c -ltidy
}
