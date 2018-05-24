# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Holland Random Plugin"
HOMEPAGE="http://www.hollandbackup.org/"
MY_P="holland-${PV}"
SRC_URI="http://hollandbackup.org/releases/stable/${PV%.*}/${MY_P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
PDEPEND="~app-backup/holland-${PV}[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}/plugins/${PN//-/.}"

python_install_all() {
	distutils-r1_python_install_all

	keepdir /etc/holland
	keepdir /etc/holland/backupsets
	keepdir /etc/holland/providers

	insinto /etc/holland/backupsets
	doins "${WORKDIR}/${MY_P}/config/backupsets/examples/${PN##*-}.conf"

	insinto /etc/holland/providers
	doins "${WORKDIR}/${MY_P}/config/providers/${PN##*-}.conf"
}
