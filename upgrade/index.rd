=begin JA
== Debian 9 -> 10 へのアップグレード
* stretch -> buster へのアップグレードに関するメモ書き
  * 「Debian buster upgrade」などをキーワードにして Google検索をかけると、すでに実施されている方がメモを残していらっしゃるので、改めて記す必要もないですが、個人的な備忘録として。
  * アップグレードする前の情報は以下のとおり。
   matsuba@debian:~$ cat /etc/debian_version
   9.13
   matsuba@debian:~$ uname -a
   Linux debian 4.9.0-3-amd64 #1 SMP Debian 4.9.30-2+deb9u5 (2017-09-19) x86_64 GNU/Linux
  
=== aptリストの書き換え
* (({/etc/apt/sources.list})) の stretch を buster に書き換えます。
  * 変更前：
   # deb cdrom:[Debian GNU/Linux 9.0.0 _Stretch_ - Official amd64 NETINST 20170617-13:06]/ stretch main

   # deb cdrom:[Debian GNU/Linux 9.0.0 _Stretch_ - Official amd64 NETINST 20170617-13:06]/ stretch main

   deb http://dennou-k.gfd-dennou.org/debian/ stretch main contrib non-free
   deb-src http://dennou-k.gfd-dennou.org/debian/ stretch main contrib non-free
   
   deb http://security.debian.org/debian-security stretch/updates main contrib non-free
   deb-src http://security.debian.org/debian-security stretch/updates main contrib non-free
   
   deb http://www.gfd-dennou.org/library/cc-env/Linux/debian-dennou stretch main
   deb-src http://www.gfd-dennou.org/library/cc-env/Linux/debian-dennou stretch main

   # stretch-updates, previously known as 'volatile'
   deb http://dennou-k.gfd-dennou.org/debian/ stretch-updates main
   deb-src http://dennou-k.gfd-dennou.org/debian/ stretch-updates main

   # 2019-02-16
   # added by Fumitaka MATSUBA for security
   deb https://typora.io/linux ./
   # deb-src https://typora.io/linux ./
   deb http://security.debian.org/ stretch/updates main contrib non-free

  * 変更後
   # deb cdrom:[Debian GNU/Linux 9.0.0 _Stretch_ - Official amd64 NETINST 20170617-13:06]/ stretch main
   
   # deb cdrom:[Debian GNU/Linux 9.0.0 _Stretch_ - Official amd64 NETINST 20170617-13:06]/ stretch main
   
   deb http://dennou-k.gfd-dennou.org/debian/ buster main contrib non-free
   deb-src http://dennou-k.gfd-dennou.org/debian/ buster main contrib non-free
   
   deb http://security.debian.org/debian-security buster/updates main contrib non-free
   deb-src http://security.debian.org/debian-security buster/updates main contrib non-free
   
   deb http://www.gfd-dennou.org/library/cc-env/Linux/debian-dennou buster main
   deb-src http://www.gfd-dennou.org/library/cc-env/Linux/debian-dennou buster main
   
   # buster-updates, previously known as 'volatile'
   deb http://dennou-k.gfd-dennou.org/debian/ buster-updates main
   deb-src http://dennou-k.gfd-dennou.org/debian/ buster-updates main
   
   # 2019-02-16
   # added by Fumitaka MATSUBA for security
   deb https://typora.io/linux ./
   # deb-src https://typora.io/linux ./
   deb http://security.debian.org/ buster/updates main contrib non-free

* (({/etc/apt/sources.list.d})) 内に別のリポジトリがある場合はそちらも確認します。私の環境の場合、(({dropbox.list})) がありました。
  * 変更前
   deb [arch=i386,amd64] http://linux.dropbox.com/debian stretch main
  * 変更後
   deb [arch=i386,amd64] http://linux.dropbox.com/debian buster main

=== apt update をする
   matsuba@debian:~$ sudo apt update
   ヒット:1 http://security.debian.org/debian-security buster/updates InRelease
   ヒット:2 http://dennou-k.gfd-dennou.org/debian buster InRelease 
   無視:3 http://www.gfd-dennou.org/library/cc-env/Linux/debian-dennou buster InRelease
   ヒット:4 http://dennou-k.gfd-dennou.org/debian buster-updates InRelease
   ヒット:5 http://www.gfd-dennou.org/library/cc-env/Linux/debian-dennou buster Release
   ヒット:6 https://typora.io/linux ./ InRelease
   ヒット:7 http://security.debian.org buster/updates InRelease
   無視:8 http://linux.dropbox.com/debian buster InRelease
   ヒット:9 http://linux.dropbox.com/debian buster Release
   パッケージリストを読み込んでいます... 完了
   依存関係ツリーを作成しています
   状態情報を読み取っています... 完了
   アップグレードできるパッケージが 2046 個あります。表示するには 'apt list --upgradable' を実行してください。

=== apt upgrade をする
   matsuba@debian:~$ sudo apt upgrade
   パッケージリストを読み込んでいます... 完了
   依存関係ツリーを作成しています
   状態情報を読み取っています... 完了
   アップグレードパッケージを検出しています... 完了
   以下のパッケージが自動でインストールされましたが、もう必要とされていません:
   bdf2psf gcj-6-jre-lib gksu im-config iputils-arping isympy isympy-common isympy3 libbind9-140 libblas-common
   libboost-thread1.62.0 libdns162 libfreerdp-cache1.1 libfreerdp-codec1.1 libfreerdp-common1.1.0 libfreerdp-core1.1
   libfreerdp-crypto1.1 libfreerdp-gdi1.1 libfreerdp-locale1.1 libfreerdp-primitives1.1 libfreerdp-utils1.1 libgcab-1.0-0
   libgcj-bc libgcj-common libgcj17 libgcr-3-common libgeos-3.5.1 libgit2-24 libgksu2-0 libgmime-2.6-0
   libgnome-autoar-common libgnome-games-support-1-2 libgom-1.0-common libgutenprint2 libhttp-parser2.1 libisc160
   libisccc140 libisccfg140 libjim0.76 liblouis12 liblouisutdml7 libluajit-5.1-2 libluajit-5.1-common liblwres141 libncl1
   libntfs-3g871 libopenmpi2 libprotobuf10 librarian0 librpm3 librpmbuild3 librpmio3 librpmsign3 libsac-java-gcj
   libsane-extras libsane-extras-common libsodium18 libsuitesparseconfig4 libunbound2 libwinpr-crt0.1 libwinpr-crypto0.1
   libwinpr-dsparse0.1 libwinpr-environment0.1 libwinpr-file0.1 libwinpr-handle0.1 libwinpr-heap0.1 libwinpr-input0.1
   libwinpr-interlocked0.1 libwinpr-library0.1 libwinpr-path0.1 libwinpr-pool0.1 libwinpr-registry0.1 libwinpr-rpc0.1
   libwinpr-sspi0.1 libwinpr-synch0.1 libwinpr-sysinfo0.1 libwinpr-thread0.1 libwinpr-utils0.1 libxfont1 python-antlr
   python-certifi python-idna python-pyasn1 python-requests python-urllib3 rarian-compat ruby-ffi ruby-listen
   ruby-rb-inotify ruby2.3 ruby2.3-dev tcpd x11proto-dri2-dev x11proto-gl-dev
   これを削除するには 'sudo apt autoremove' を利用してください。
   以下のパッケージが新たにインストールされます:
   aisleriot ant-contrib apparmor binfmt-support binutils-common binutils-x86-64-linux-gnu comerr-dev cpp-8 dirmngr dwz
   e2fsprogs-l10n fdisk firmware-linux-free fonts-adf-accanthis fonts-adf-gillius fonts-adf-universalis
   fonts-glyphicons-halflings fonts-noto-core fonts-noto-ui-core fonts-quicksand fonts-roboto-unhinted gcc-7-base gcc-8
   gcc-8-base gcc-8-base:i386 gcc-8-multilib gfortran-8 gir1.2-harfbuzz-0.0 gir1.2-rsvg-2.0 gnome-keyring-pkcs11
   gnome-user-docs gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client gpg-wks-server gpgconf gpgsm guile-2.2-libs
   ibverbs-providers intel-media-va-driver jupyter-nbextension-jupyter-js-widgets krb5-multidev ksh lib32asan5
   lib32gcc-8-dev lib32ubsan1 libactivation-java libanthy1 libaom0 libaopalliance-java libarchive-cpio-perl libargon2-1
   libargs4j-java libasan5 libasm-java libatinject-jsr330-api-java libavcodec58 libavresample4 libavutil56
   libayatana-appindicator3-1 libayatana-ido3-0.4-0 libayatana-indicator3-7 libbind9-161 libbinutils libblockdev-crypto2
   libblockdev-fs2 libblockdev-loop2 libblockdev-part-err2 libblockdev-part2 libblockdev-swap2 libblockdev-utils2
   libblockdev2 libboost-atomic1.67.0 libboost-chrono1.67.0 libboost-date-time1.67.0 libboost-filesystem1.67.0
   libboost-system1.67.0 libboost-thread1.67.0 libcaf-openmpi-3 libcdi-api-java libcglib-java libcoarrays-dev
   libcoarrays-openmpi-dev libcodec2-0.8.1 libcodemodel-java libcom-err2 libcommons-cli-java libcommons-collections4-java
   libcommons-compress-java libcommons-io-java libcommons-lang3-java libcommons-math3-java libcryptsetup12
   libcurvesapi-java libdap25 libdata-dump-perl libdbusmenu-gtk3-4 libdns-export1104 libdns1104 libdrm-common
   libdtd-parser-java libdw1 libeccodes-data libeccodes0 libefiboot1 libefivar1 libegl-mesa0 libegl1 libel-api-java
   libevent-2.1-6 libevent-core-2.1-6 libevent-pthreads-2.1-6 libext2fs2 libfastinfoset-java libfreerdp2-2 libfstrm0
   libgcc-8-dev libgdbm-compat4 libgdbm6 libgdk-pixbuf2.0-bin libgeos-3.7.1 libgeronimo-annotation-1.3-spec-java
   libgeronimo-interceptor-3.0-spec-java libgfortran-8-dev libgfortran5 libgit2-27 libgl1 libgl1-mesa-dev libgles1 libgles2
   libglew2.1 libglvnd-core-dev libglvnd-dev libglvnd0 libglx-mesa0 libglx0 libgnome-games-support-1-3 libgpg-error-l10n
   libgssrpc4 libguava-java libguice-java libgutenprint-common libgutenprint9 libgweather-3-15 libhawtjni-runtime-java
   libhttp-parser2.8 libhttpclient-java libhttpcore-java libhunspell-1.7-0 libical3 libicu4j-java libicu63 libidn2-0:i386
   libigdgmm5 libimagequant0 libintellij-annotations-java libio-stringy-perl libirs161 libisc-export1100 libisc1100
   libisccc161 libisccfg163 libisl19 libistack-commons-java libjansi-java libjansi-native-java libjaxb-api-java
   libjaxb-java libjetbrains-annotations-java libjim0.77 libjsoup-java libjsp-api-java libjsr305-java libkadm5clnt-mit11
   libkadm5srv-mit11 libkdb5-9 libkrb5-dev libllvm7 liblmdb0 liblouis17 liblouisutdml8 liblwres161
   libmaven-file-management-java libmaven-parent-java libmaven-resolver-java libmaven-shared-io-java
   libmaven-shared-utils-java libmaven3-core-java libmbedcrypto3 libmbedtls12 libmbedx509-0 libmpfr6 libncl2 libncurses6
   libncursesw6 libnftables0 libnftnl11 libnl-3-dev libnl-route-3-dev libnorm-dev libnorm1 libnss-systemd libntfs-3g883
   libopengl0 libopenmpi3 libparted-fs-resize0 libpcre2-16-0 libpgm-dev libplexus-archiver-java libplexus-cipher-java
   libplexus-classworlds-java libplexus-component-annotations-java libplexus-interpolation-java libplexus-io-java
   libplexus-sec-dispatcher-java libplexus-utils2-java libplymouth4 libpmix2 libpoppler82 libprocps7 libproj13
   libprotobuf-c1 libprotobuf17 libpsm2-2 libqpdf21 libraw19 librngom-java librpm8 librpmbuild8 librpmio8 librpmsign8
   libruby2.5 libservlet-api-java libsisu-guice-java libsisu-inject-java libsisu-ioc-java libsisu-plexus-java libslf4j-java
   libsnappy-java libsnappy-jni libsndio7.0 libsodium-dev libsodium23 libstax-ex-java libstreambuffer-java
   libsuitesparseconfig5 libswresample3 libsystemd-dev libtinfo6 libtracker-sparql-2.0-0 libtry-tiny-perl libtxw2-java
   libu2f-udev libubsan1 libuchardet0 libudunits2-data libunbound8 libunistring2 libunistring2:i386 libunwind8 libva-drm2
   libva-x11-2 libva2 libvolume-key1 libvpx5 libwagon-http-java libwagon-provider-api-java libwayland-egl1 libwebpmux3
   libwebsocket-api-java libwinpr2-2 libx264-155 libx265-165 libx32asan5 libx32gcc-8-dev libx32ubsan1 libxsom-java
   libxz-java linux-image-4.19.0-10-amd64 mesa-common-dev nautilus-extension-brasero nautilus-extension-gnome-terminal
   nftables pdftk-java pigz plymouth plymouth-label python-asn1crypto python-atomicwrites python-attr
   python-backports.functools-lru-cache python-certifi python-configparser python-et-xmlfile python-funcsigs python-future
   python-lz4 python-mock python-more-itertools python-olefile python-pbr python-pluggy python-psutil python-scandir
   python-soupsieve python3-bleach python3-certifi python3-debconf python3-defusedxml python3-distro-info python3-idna
   python3-pandocfilters python3-scour python3-soupsieve python3-testpath python3-widgetsnbextension ruby-xmlrpc ruby2.5
   ruby2.5-dev ruby2.5-doc scour sound-icons tix usb.ids x11proto-dev
   以下のパッケージは保留されます:
   anthy apache2 apache2-bin apache2-data apache2-utils appstream bogofilter bogofilter-bdb bogofilter-common
   build-essential cheese cheese-common cups cups-bsd cups-client cups-core-drivers cups-daemon cups-filters
   cups-filters-core-drivers curl dconf-cli dconf-gsettings-backend dconf-service default-jre default-jre-headless emacs
   emacs24 emacsen-common eog evince evince-common evolution evolution-common evolution-data-server
   evolution-data-server-common evolution-plugins ffmpeg folks-common g++ gdm3 gedit gedit-common gedit-plugins gimp
   gimp-data gir1.2-atk-1.0 gir1.2-evince-3.0 gir1.2-freedesktop gir1.2-gdm-1.0 gir1.2-glib-2.0 gir1.2-gnomedesktop-3.0
   gir1.2-goa-1.0 gir1.2-gst-plugins-base-1.0 gir1.2-gstreamer-1.0 gir1.2-gtk-3.0 gir1.2-javascriptcoregtk-4.0
   gir1.2-lokdocview-0.1 gir1.2-pango-1.0 gir1.2-rb-3.0 gir1.2-totem-1.0 gir1.2-webkit2-4.0 gjs glib-networking
   glib-networking-common glib-networking-services gmt gmt-common gnome gnome-calendar gnome-characters gnome-clocks
   gnome-contacts gnome-control-center gnome-control-center-data gnome-core gnome-dictionary gnome-disk-utility
   gnome-documents gnome-font-viewer gnome-maps gnome-music gnome-online-accounts gnome-orca gnome-session
   gnome-session-bin gnome-session-common gnome-settings-daemon gnome-shell gnome-shell-common gnome-shell-extensions
   gnome-software gnome-software-common gnome-sushi gnome-system-monitor gnome-themes-standard gnome-tweak-tool
   gnome-user-share gnome-weather grads gstreamer1.0-libav gstreamer1.0-plugins-bad gstreamer1.0-plugins-base
   gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-pulseaudio gstreamer1.0-x gtk-update-icon-cache gvfs
   gvfs-backends gvfs-bin gvfs-common gvfs-daemons gvfs-fuse gvfs-libs hplip hplip-data icedtea-netx imagemagick-6.q16
   inkscape jupyter-notebook libalgorithm-diff-xs-perl libappstream4 libapt-pkg-perl libatk-adaptor libatk-bridge2.0-0
   libatk-bridge2.0-dev libatk1.0-0 libatk1.0-data libatk1.0-dev libatkmm-1.6-1v5 libcairo-perl libcheese-gtk25 libcheese8
   libclone-perl libcommon-sense-perl libcrypt-openssl-bignum-perl libcrypt-openssl-rsa-perl libcups2 libcupsimage2
   libdconf1 libebackend-1.2-10 libebook-contacts-1.2-2 libecal-1.2-19 libedata-book-1.2-25 libevdocument3-4 libevolution
   libevview3-3 libfcgi-perl libfile-fcntllock-perl libfolks-eds25 libfolks-telepathy25 libfolks25 libgail-3-0 libgd-perl
   libgdal20 libgdm1 libgimp2.0 libgirepository-1.0-1 libgl1-mesa-dri libglib-perl libglib2.0-0 libglib2.0-bin
   libglib2.0-dev libglibmm-2.4-1v5 libgmt-dev libgmt5 libgoa-1.0-0b libgoa-1.0-common libgoa-backend-1.0-1 libgrib-api-dev
   libgrib-api-tools libgrib-api0 libgstreamer-plugins-bad1.0-0 libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 libgtk-3-0
   libgtk-3-bin libgtk-3-dev libgtk2-perl libgtkmm-2.4-1v5 libgtkmm-3.0-1v5 libhdf5-dev libhe5-hdfeos0 libhpmud0
   libhtml-parser-perl libimage-magick-q16-perl libio-pty-perl libio-socket-ssl-perl libjavascriptcoregtk-4.0-18
   libjson-xs-perl libkpathsea6 liblibreofficekitgtk liblist-moreutils-perl liblocale-gettext-perl libmouse-perl
   libnautilus-extension1a libncarg-bin libncarg-dev libncarg0 libnet-dbus-perl libnet-dns-perl libnet-ssleay-perl
   libnetcdf-dev libnetcdff-dev libnetcdff6 libopenmpt0 libpango-1.0-0 libpango-perl libpango1.0-0 libpango1.0-dev
   libpangocairo-1.0-0 libpangoft2-1.0-0 libpangomm-1.4-1v5 libpangoxft-1.0-0 libpeas-1.0-0 libperlio-gzip-perl
   libphodav-2.0-0 libproc-processtable-perl libptexenc1 libpython-all-dbg libpython-dbg libpython-dev libpython-stdlib
   libpython2.7 libpython2.7-dbg libpython2.7-dev libpython2.7-minimal libpython2.7-stdlib libpython3-stdlib libqt4-dbus
   libqt4-designer libqt4-network libqt4-qt3support libqt4-script libqt4-sql libqt4-sql-mysql libqt4-xml libqtcore4
   libqtdbus4 libqtgui4 libreoffice libreoffice-avmedia-backend-gstreamer libreoffice-base libreoffice-base-core
   libreoffice-base-drivers libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw libreoffice-evolution
   libreoffice-gnome libreoffice-gtk3 libreoffice-help-en-us libreoffice-help-ja libreoffice-impress
   libreoffice-java-common libreoffice-l10n-ja libreoffice-math libreoffice-ogltrans libreoffice-pdfimport
   libreoffice-report-builder libreoffice-report-builder-bin libreoffice-script-provider-bsh libreoffice-script-provider-js
   libreoffice-script-provider-python libreoffice-sdbc-hsqldb libreoffice-sdbc-postgresql libreoffice-style-tango
   libreoffice-writer libreofficekit-data librhythmbox-core10 libsane-hpaio libsnmp30 libsocket6-perl libstdc++6
   libstdc++6:i386 libsub-name-perl libtamuanova-0.2 libtbb2 libtexlua52 libtexluajit2 libtext-charwidth-perl
   libtext-iconv-perl libtotem0 libuim-custom2 libuim-scm0 libuim8 libwebkit2gtk-4.0-37 libxml-libxml-perl
   libxml-parser-perl libyaml-libyaml-perl libyelp0 lintian mutter mutter-common nautilus nautilus-data ncl-ncarg
   netcdf-bin perl perl-base polari printer-driver-hpcups printer-driver-hpijs printer-driver-postscript-hp prosper python
   python-all python-all-dbg python-cvxopt python-dbg python-dev python-glade2 python-grib python-gribapi python-gtk2
   python-matplotlib python-matplotlib-dbg python-minimal python-mpltoolkits.basemap python-mpltoolkits.basemap-dbg
   python-netcdf4 python-numexpr python-numpy python-opencv python-pandas python-pandas-lib python-scipy python-statsmodels
   python-statsmodels-lib python-tables python-tables-data python-tables-lib python2.7 python2.7-dbg python2.7-dev
   python2.7-minimal python3 python3-apt python3-brlapi python3-cairo python3-cups python3-dbus python3-gi python3-gi-cairo
   python3-grib python3-gribapi python3-jupyter-core python3-lxml python3-markupsafe python3-matplotlib python3-minimal
   python3-mpltoolkits.basemap python3-notebook python3-numexpr python3-numpy python3-pandas python3-pandas-lib python3-pil
   python3-pycurl python3-pyproj python3-renderpm python3-reportlab python3-reportlab-accel python3-scipy python3-smbc
   python3-tables python3-tables-lib python3-tk python3-tornado python3-uno python3-zmq qdbus rename rhythmbox
   rhythmbox-data rhythmbox-plugin-cdrecorder rhythmbox-plugins ruby-gsl ruby-netcdf texlive-base texlive-binaries
   texlive-extra-utils texlive-font-utils texlive-fonts-extra texlive-fonts-extra-doc texlive-fonts-recommended
   texlive-fonts-recommended-doc texlive-generic-extra texlive-generic-recommended texlive-lang-chinese texlive-lang-cjk
   texlive-lang-japanese texlive-lang-korean texlive-lang-other texlive-latex-base texlive-latex-base-doc
   texlive-latex-extra texlive-latex-extra-doc texlive-latex-recommended texlive-latex-recommended-doc texlive-luatex
   texlive-pictures texlive-pictures-doc texlive-pstricks texlive-pstricks-doc texlive-xetex totem totem-common
   totem-plugins tracker tracker-extract tracker-miner-fs transmission-common transmission-gtk uim uim-anthy uim-fep
   uim-gtk2.0 uim-gtk3 uim-qt5 uim-xim uno-libs3 ure xserver-xorg-core xserver-xorg-video-amdgpu xserver-xorg-video-ati
   xserver-xorg-video-fbdev xserver-xorg-video-intel xserver-xorg-video-nouveau xserver-xorg-video-qxl
   xserver-xorg-video-radeon xserver-xorg-video-vesa xserver-xorg-video-vmware yelp
   以下のパッケージはアップグレードされます:
   accountsservice acl adduser adwaita-icon-theme alsa-utils anacron ant ant-optional anthy-common apache2-suexec-custom
   apg apt apt-listchanges apt-transport-https apt-utils argyll argyll-ref aspell aspell-en at-spi2-core autoconf automake
   autopoint autotools-dev avahi-autoipd avahi-daemon baobab base-files base-passwd bash bash-completion bc bdf2psf
   bind9-host binutils blt bluetooth bluez bluez-obexd brasero brasero-cdrkit brasero-common bsdmainutils bsdutils busybox
   bzip2 ca-certificates ca-certificates-java caribou cdrdao chrome-gnome-shell coinor-libcbc3 coinor-libcgl1
   coinor-libclp1 coinor-libcoinmp1v5 coinor-libcoinutils3v5 coinor-libosi1v5 colord colord-data console-setup
   console-setup-linux coreutils cpio cpp cracklib-runtime cron cups-browsed cups-common cups-ppdc cups-server-common dash
   dbus dbus-user-session dbus-x11 dc debconf debconf-i18n debhelper debian-archive-keyring debian-faq debian-keyring
   debianutils debugedit desktop-base desktop-file-utils dh-autoreconf dh-python dh-strip-nondeterminism
   dictionaries-common diffstat diffutils discover distro-info-data dmidecode dmsetup dns-root-data dnsmasq-base dnsutils
   dosfstools dpkg dpkg-dev dvdauthor dvipng e2fslibs e2fsprogs enchant espeak-ng-data exfat-fuse exfat-utils fakeroot
   fig2dev file file-roller findutils firefox-esr firefox-esr-l10n-ja firmware-iwlwifi five-or-more fontconfig
   fontconfig-config fonts-arphic-bkai00mp fonts-baekmuk fonts-cantarell fonts-comfortaa fonts-croscore
   fonts-crosextra-caladea fonts-font-awesome fonts-freefont-otf fonts-freefont-ttf fonts-ipaexfont-gothic
   fonts-ipaexfont-mincho fonts-ipafont fonts-ipafont-gothic fonts-ipafont-mincho fonts-junicode fonts-lato
   fonts-liberation fonts-linuxlibertine fonts-lmodern fonts-lyx fonts-mathjax fonts-noto-hinted fonts-noto-mono
   fonts-opensymbol fonts-roboto-hinted fonts-sil-gentium fonts-sil-gentium-basic fonts-sil-gentiumplus fonts-sil-padauk
   fonts-texgyre fonts-unfonts-core fonts-unfonts-extra fonts-vlgothic foomatic-db-compressed-ppds foomatic-db-engine
   four-in-a-row fuse gawk gcc gcc-multilib gconf-service gconf2 gconf2-common gcr gdebi gdebi-core gdisk geoclue-2.0
   geoip-database gettext gettext-base gfortran ghostscript ghostscript-x gir1.2-accountsservice-1.0 gir1.2-atspi-2.0
   gir1.2-caribou-1.0 gir1.2-champlain-0.12 gir1.2-clutter-1.0 gir1.2-clutter-gst-3.0 gir1.2-cogl-1.0 gir1.2-coglpango-1.0
   gir1.2-gck-1 gir1.2-gcr-3 gir1.2-gdata-0.0 gir1.2-gdesktopenums-3.0 gir1.2-gdkpixbuf-2.0 gir1.2-geoclue-2.0
   gir1.2-geocodeglib-1.0 gir1.2-gfbgraph-0.2 gir1.2-gmenu-3.0 gir1.2-gnomebluetooth-1.0 gir1.2-grilo-0.3 gir1.2-gtk-2.0
   gir1.2-gtkchamplain-0.12 gir1.2-gtkclutter-1.0 gir1.2-gtksource-3.0 gir1.2-gucharmap-2.90 gir1.2-gweather-3.0
   gir1.2-ibus-1.0 gir1.2-json-1.0 gir1.2-mediaart-2.0 gir1.2-notify-0.7 gir1.2-packagekitglib-1.0 gir1.2-peas-1.0
   gir1.2-polkit-1.0 gir1.2-rest-0.7 gir1.2-secret-1 gir1.2-soup-2.4 gir1.2-telepathyglib-0.12 gir1.2-telepathylogger-0.2
   gir1.2-upowerglib-1.0 gir1.2-vte-2.91 gir1.2-wnck-3.0 gir1.2-zeitgeist-2.0 gir1.2-zpj-0.0 git git-man gkbd-capplet
   gmt-dcw gmt-doc gmt-gshhg gmt-gshhg-full gmt-gshhg-high gmt-gshhg-low gnome-accessibility-themes gnome-backgrounds
   gnome-bluetooth gnome-calculator gnome-chess gnome-color-manager gnome-desktop3-data gnome-games
   gnome-getting-started-docs gnome-icon-theme gnome-keyring gnome-klotski gnome-logs gnome-mahjongg gnome-menus
   gnome-mime-data gnome-mines gnome-nibbles gnome-online-miners gnome-robots gnome-screenshot gnome-sound-recorder
   gnome-sudoku gnome-taquin gnome-terminal gnome-terminal-data gnome-tetravex gnome-user-guide gnome-video-effects gnupg
   gnupg-agent gnuplot gnuplot-data gnuplot-qt gnutls-bin gpgv gphys grep grilo-plugins-0.3 groff-base growisofs
   grub-common grub-pc grub-pc-bin grub2-common gsettings-desktop-schemas gsfonts gstreamer1.0-clutter-3.0
   gtk2-engines-pixbuf gtool5 gv gzip hdf5-helpers hdparm hicolor-icon-theme hitori hoichess hostname hunspell-en-us
   hyphen-en-us i965-va-driver iagno icu-devtools ifupdown iio-sensor-proxy im-config imagemagick imagemagick-6-common init
   init-system-helpers initramfs-tools initramfs-tools-core install-info installation-report intltool-debian iproute2
   iptables iputils-arping iputils-ping ipython ipython3 isc-dhcp-client isc-dhcp-common iso-codes isympy-common isympy3 iw
   java-common kasumi kbd keyboard-configuration klibc-utils kmod krb5-locales laptop-detect latex-cjk-all
   latex-cjk-chinese latex-cjk-common latex-cjk-japanese latex-cjk-korean latex-cjk-thai less lib32atomic1 lib32cilkrts5
   lib32gcc1 lib32gomp1 lib32itm1 lib32mpx2 lib32quadmath0 lib32stdc++6 lib32ubsan0 lib32z1 libaa1 libaacs0 libabw-0.1-1
   libaccountsservice0 libacl1 libaec-dev libaec0 libalgorithm-diff-perl libamd2 libao-common libao4 libapache-poi-java
   libapache-pom-java libapache2-mod-dnssd libapparmor1 libappindicator1 libappstream-glib8 libapr1 libaprutil1
   libaprutil1-dbd-sqlite3 libaprutil1-ldap libapt-inst2.0 libapt-pkg5.0 libarchive-zip-perl libarchive13 libarpack2
   libart-2.0-2 libasound2 libasound2-data libasound2-plugins libaspell15 libassuan0 libatasmart4 libatk-wrapper-java
   libatk-wrapper-java-jni libatomic1 libatspi2.0-0 libatspi2.0-dev libattr1 libaudio2 libaudit-common libaudit1
   libavahi-client3 libavahi-common-data libavahi-common3 libavahi-core7 libavahi-glib1 libavahi-gobject0
   libavahi-ui-gtk3-0 libavc1394-0 libbabl-0.1-0 libbcmail-java libbcpkix-java libbcprov-java libbdplus0 libblas-dev
   libblas3 libblkid1 libblosc1 libbluetooth3 libbrasero-media3-1 libbrlapi0.6 libbsd0 libbsh-java libburn4 libbz2-1.0
   libc-bin libc-dev-bin libc-l10n libc6 libc6:i386 libc6-dev libc6-dev-i386 libc6-dev-x32 libc6-i386 libc6-x32 libcaca0
   libcacard0 libcairo-gobject2 libcairo-script-interpreter2 libcairo2 libcairo2-dev libcairomm-1.0-1v5 libcamd2
   libcanberra-gtk-module libcanberra-gtk0 libcanberra-gtk3-0 libcanberra-gtk3-module libcanberra-pulse libcanberra0
   libcap-ng0 libcap2 libcap2-bin libcaribou-common libcaribou-gtk-module libcaribou-gtk3-module libcaribou0 libcc1-0
   libccolamd2 libcdcl7 libcdparanoia0 libcdr-0.1-1 libcgi-fast-perl libcgi-pm-perl libchamplain-0.12-0
   libchamplain-gtk-0.12-0 libcholmod3 libchromaprint1 libcilkrts5 libclass-accessor-perl libclass-data-inheritable-perl
   libclass-isa-perl libclutter-1.0-0 libclutter-1.0-common libclutter-gst-3.0-0 libclutter-gtk-1.0-0 libcmis-0.5-5v5
   libcogl-common libcogl-pango20 libcogl-path20 libcogl20 libcolamd2 libcolord-gtk1 libcolord2 libcolorhug2 libcomerr2
   libcommons-codec-java libcommons-collections3-java libcommons-logging-java libcommons-parent-java libcrack2 libcroco3
   libcryptui0a libcrystalhd3 libcupsfilters1 libcurl3-gnutls libcurl4-gnutls-dev libczmq-dev libczmq4 libdaemon0
   libdap-dev libdapclient6v5 libdapserver7v5 libdata-random-perl libdatrie1 libdb5.3 libdbus-1-3 libdbus-1-dev
   libdbus-glib-1-2 libdbusmenu-glib4 libdbusmenu-gtk4 libdca0 libde265-0 libdebconfclient0 libdee-1.0-4 libdevmapper1.02.1
   libdigest-hmac-perl libdiscover2 libdjvulibre-text libdjvulibre21 libdleyna-connector-dbus-1.0-1 libdleyna-core-1.0-3
   libdmapsharing-3.0-2 libdom4j-java libdotconf0 libdouble-conversion1 libdpkg-perl libdrm-amdgpu1 libdrm-dev
   libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libdv4 libdvdnav4 libdvdread4 libe-book-0.1-1 libebur128-1 libedit2
   libegl1-mesa libegl1-mesa-dev libelf1 libenchant1c2a libeot0 libepoxy-dev libepoxy0 libepsilon1 liberror-perl
   libespeak-ng1 libestr0 libetonyek-0.1-1 libevdev2 libexif12 libexiv2-14 libexpat1 libexpat1-dev libexporter-tiny-perl
   libexttextcat-2.0-0 libexttextcat-data libextutils-pkgconfig-perl libf77dcl-dev libf77dcl7 libfaad2 libfabric1
   libfakeroot libfastjson4 libfdisk1 libffi-dev libffi6 libfftw3-double3 libfftw3-single3 libfile-basedir-perl
   libfile-copy-recursive-perl libfile-homedir-perl libfile-mimeinfo-perl libfile-stripnondeterminism-perl
   libfile-which-perl libflac8 libflite1 libfluidsynth1 libflute-java libfontconfig1 libfontconfig1-dev libfontembed1
   libfreehand-0.1-1 libfreetype6 libfreetype6-dev libfreexl1 libfribidi0 libfuse2 libgail-common libgail18 libgbm1
   libgc1c2 libgcab-1.0-0 libgcc1 libgcc1:i386 libgck-1-0 libgconf-2-4 libgcr-base-3-1 libgcr-ui-3-1 libgcroots0
   libgcrypt20 libgd3 libgdata-common libgdata22 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgdk-pixbuf2.0-dev
   libgee-0.8-2 libgeoclue-2-0 libgeocode-glib0 libgeoip1 libgeos-c1v5 libgeotiff2 libgexiv2-2 libgfbgraph-0.2-0 libgif7
   libgit2-glib-1.0-0 libgl1-mesa-glx libglade2-0 libglapi-mesa libgles2-mesa libglib2.0-data libglpk40 libglu1-mesa
   libgme0 libgmime-2.6-0 libgmp-dev libgmp10 libgmpxx4ldbl libgnome-autoar-0-0 libgnome-autoar-gtk-0-0
   libgnome-bluetooth13 libgnome-games-support-common libgnome-menu-3-0 libgnomecanvas2-0 libgnomecanvas2-common
   libgnomekbd-common libgnomekbd8 libgnutls-dane0 libgnutls30 libgom-1.0-0 libgomp1 libgpg-error0 libgpgme11 libgphoto2-6
   libgphoto2-l10n libgphoto2-port12 libgpm2 libgpm2:i386 libgpod-common libgpod4 libgraphite2-3 libgraphite2-dev
   libgrib2c-dev libgrib2c0d libgrilo-0.3-0 libgs9 libgs9-common libgsf-1-114 libgsf-1-common libgsf-bin libgsm1 libgsound0
   libgspell-1-1 libgspell-1-common libgssapi-krb5-2 libgssdp-1.0-3 libgtk-3-common libgtk-vnc-2.0-0 libgtk2.0-0
   libgtk2.0-bin libgtk2.0-common libgtk2.0-dev libgtkimageview0 libgtksourceview-3.0-1 libgtksourceview-3.0-common
   libgtkspell0 libgtkspell3-3-0 libgtop2-common libgucharmap-2-90-7 libgudev-1.0-0 libgupnp-1.0-4 libgupnp-av-1.0-2
   libgupnp-dlna-2.0-3 libgusb2 libgvnc-1.0-0 libgweather-common libgxps2 libharfbuzz-dev libharfbuzz-gobject0
   libharfbuzz-icu0 libharfbuzz0b libhdf4-0-alt libhdfeos0 libhogweed4 libhsqldb1.8.0-java libhtml-tree-perl
   libhttp-cookies-perl libhttp-daemon-perl libhttp-message-perl libhttp-negotiate-perl libhttp-server-simple-perl
   libhwloc-dev libhwloc-plugins libhwloc5 libhyphen0 libibus-1.0-5 libibverbs-dev libibverbs1 libicu-dev libidn11
   libidn2-0 libiec61883-0 libijs-0.35 libimage-magick-perl libimobiledevice6 libindicator7 libinput-bin libinput10
   libip4tc0 libip6tc0 libipc-run-perl libipc-system-simple-perl libiptc0 libiptcdata0 libisofs6 libisorelax-java
   libispack-dev libitext-java libitm1 libiw30 libjack-jackd2-0 libjansson4 libjaxen-java libjbig2dec0 libjdom1-java
   libjpeg-dev libjpeg62-turbo libjpeg62-turbo-dev libjs-backbone libjs-bootstrap libjs-bootstrap-tour libjs-codemirror
   libjs-es6-promise libjs-jquery libjs-jquery-typeahead libjs-jquery-ui libjs-marked libjs-mathjax libjs-moment
   libjs-requirejs libjs-sphinxdoc libjs-term.js libjs-text-encoding libjs-underscore libjson-c3 libjson-glib-1.0-0
   libjson-glib-1.0-common libjson-perl libjte1 libk5crypto3 libkate1 libkeyutils1 libklibc libkmlbase1 libkmlconvenience1
   libkmldom1 libkmlengine1 libkmlregionator1 libkmlxsd1 libkmod2 libkrb5-3 libkrb5support0 liblapack-dev liblapack3
   liblayout-java liblcms2-2 liblcms2-utils libldap-2.4-2 libldap-common libldb1 liblilv-0-0 liblirc-client0
   liblockfile-bin liblockfile1 liblog4j1.2-java liblognorm5 liblouis-data liblouisutdml-bin liblouisutdml-data liblqr-1-0
   liblsan0 libltdl-dev libltdl7 liblua5.3-0 libluajit-5.1-2 libluajit-5.1-common liblwp-protocol-https-perl liblz4-1
   liblzma5 liblzo2-2 libm17n-0 libmad0 libmagic-mgc libmagic1 libmail-java libmail-sendmail-perl libmbim-glib4
   libmbim-proxy libmediaart-2.0-0 libmhash2 libmission-control-plugins0 libmm-glib0 libmms0 libmodplug1 libmount1
   libmp3lame0 libmpc3 libmpcdec6 libmpdec2 libmpeg2-4 libmpg123-0 libmpx2 libmspub-0.1-1 libmsv-java libmtp-common
   libmtp-runtime libmtp9 libmuparser2v5 libmusicbrainz5-2 libmusicbrainz5cc2v5 libmwaw-0.3-3 libnatpmp1 libncarg-data
   libncurses5 libncurses5:i386 libncursesw5 libneon27-gnutls libnet-http-perl libnet-ip-perl libnet-oauth-perl
   libnetfilter-conntrack3 libnettle6 libnewt0.52 libnfnetlink0 libnghttp2-14 libnl-3-200 libnl-genl-3-200
   libnl-route-3-200 libnm0 libnma0 libnotify4 libnpth0 libnspr4 libnss-mdns libnss-myhostname libnss3 libnuma-dev libnuma1
   liboauth0 libodbc1 libodfgen-0.1-1 libofa0 libogdi3.2 libogg0 libopenal-data libopenal1 libopenjp2-7 libopenmpi-dev
   libopts25 libopus0 liborc-0.4-0 libosinfo-1.0-0 libotf0 libp11-kit0 libpackagekit-glib2-18 libpagemaker-0.0-0 libpam-cap
   libpam-gnome-keyring libpam-modules libpam-modules-bin libpam-runtime libpam-systemd libpam0g libpaper-utils libpaper1
   libparse-debianchangelog-perl libparted2 libpcap0.8 libpcaudio0 libpciaccess0 libpcre16-3 libpcre2-8-0 libpcre3
   libpcre3-dev libpcre32-3 libpcrecpp0v5 libpcsclite1 libpeas-common libpentaho-reporting-flow-engine-java
   libperl4-corelibs-perl libpgm-5.2-0 libphodav-2.0-common libphonenumber7 libpipeline1 libpixman-1-0 libpixman-1-dev
   libplist3 libplot2c2 libpng-dev libpng-tools libpng16-16 libpolkit-agent-1-0 libpolkit-backend-1-0 libpolkit-gobject-1-0
   libpoppler-glib8 libpopt0 libpotrace0 libpq5 libproxy1-plugin-gsettings libproxy1-plugin-networkmanager libproxy1v5
   libpsl5 libpsm-infinipath1 libpst4 libpthread-stubs0-dev libpulse-mainloop-glib0 libpulse0 libpulsedsp
   libpwquality-common libpwquality1 libqhull7 libqmi-glib5 libqmi-proxy libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5
   libqt5printsupport5 libqt5svg5 libqt5widgets5 libqt5x11extras5 libquadmath0 libquvi-0.9-0.9.3 librdf0 librdmacm1
   libreadline7 librecad librecad-data libreoffice-librelogo libreoffice-nlpsolver libreoffice-wiki-publisher librest-0.7-0
   librsvg2-2 librsvg2-common librtmp1 librygel-core-2.6-2 librygel-db-2.6-2 librygel-renderer-2.6-2
   librygel-renderer-gst-2.6-2 librygel-server-2.6-2 libsac-java libsamplerate0 libsane libsane-common libsasl2-2
   libsasl2-modules libsasl2-modules-db libsaxonhe-java libsbc1 libsdl1.2debian libsdl2-2.0-0 libseccomp2 libsecret-1-0
   libsecret-common libselinux1 libsemanage-common libsemanage1 libsepol1 libserd-0-0 libserializer-java libservlet3.1-java
   libsgutils2-2 libshine3 libshout3 libshp2 libsidplay1v5 libsigc++-2.0-0v5 libsigsegv2 libslang2 libsm-dev libsm6
   libsmartcols1 libsmbclient libsnappy1v5 libsndfile1 libsnmp-base libsonic0 libsort-naturally-perl libsoundtouch1
   libsoup-gnome2.4-1 libsoup2.4-1 libsoxr0 libspandsp2 libspatialite7 libspeechd2 libspice-client-glib-2.0-8
   libspice-client-gtk-3.0-5 libsqlite3-0 libss2 libssh-gcrypt-4 libssh2-1 libssl1.1 libstartup-notification0 libsuperlu5
   libsystemd0 libsz2 libtag1v5 libtag1v5-vanilla libtagc0 libtalloc2 libtasn1-6 libtcl8.6 libtdb1 libteamdctl0
   libtelepathy-glib0 libtelepathy-logger3 libtevent0 libthai-data libthai0 libtheora0 libtiff5 libtimedate-perl libtinfo5
   libtinfo5:i386 libtk8.6 libtool libtotem-plparser-common libtotem-plparser18 libtsan0 libtwolame0 libubsan0 libudev1
   libudisks2-0 libudunits2-0 libudunits2-dev libuim-data libumfpack5 libunique-1.0-0 libupower-glib3 liburi-perl
   liburiparser1 libusb-0.1-4 libusb-1.0-0 libusbmuxd4 libusbredirhost1 libusbredirparser1 libuuid1 libv4l-0 libv4lconvert0
   libvdpau-va-gl1 libvdpau1 libvisio-0.1-1 libvisual-0.4-0 libvo-aacenc0 libvo-amrwbenc0 libvorbis0a libvorbisenc2
   libvorbisfile3 libvte-2.91-0 libvte-2.91-common libwacom-bin libwacom-common libwacom2 libwavpack1 libwayland-bin
   libwayland-client0 libwayland-cursor0 libwayland-dev libwayland-egl1-mesa libwayland-server0 libwbclient0 libwebp6
   libwebpdemux2 libwildmidi-config libwildmidi2 libwmf-bin libwmf0.2-7 libwnck-3-0 libwnck-3-common libwnck-common
   libwnck22 libwpd-0.10-10 libwpg-0.3-3 libwps-0.4-4 libwrap0 libwww-mechanize-perl libwww-perl libwww-robotrules-perl
   libwxbase3.0-0v5 libwxgtk3.0-0v5 libx11-6 libx11-data libx11-dev libx11-doc libx11-protocol-other-perl libx11-xcb-dev
   libx11-xcb1 libx32atomic1 libx32cilkrts5 libx32gcc1 libx32gomp1 libx32itm1 libx32quadmath0 libx32stdc++6 libx32ubsan0
   libxapian30 libxatracker2 libxau-dev libxau6 libxcb-dri2-0 libxcb-dri2-0-dev libxcb-dri3-0 libxcb-dri3-dev libxcb-glx0
   libxcb-glx0-dev libxcb-icccm4 libxcb-present-dev libxcb-present0 libxcb-randr0 libxcb-randr0-dev libxcb-render-util0
   libxcb-render0 libxcb-render0-dev libxcb-res0 libxcb-shape0 libxcb-shape0-dev libxcb-shm0 libxcb-shm0-dev
   libxcb-sync-dev libxcb-sync1 libxcb-xf86dri0 libxcb-xfixes0 libxcb-xfixes0-dev libxcb-xinerama0 libxcb-xkb1 libxcb-xv0
   libxcb1 libxcb1-dev libxcursor-dev libxcursor1 libxdamage-dev libxdamage1 libxerces2-java libxfont2 libxft-dev libxft2
   libxgks-dev libxgks2 libxgks2-data libxinerama-dev libxinerama1 libxkbcommon-dev libxkbcommon-x11-0 libxkbcommon0
   libxkbfile1 libxklavier16 libxml-commons-external-java libxml-commons-resolver1.1-java libxml-namespacesupport-perl
   libxml-sax-base-perl libxml-sax-expat-perl libxml-sax-perl libxml-simple-perl libxml-twig-perl libxml-xpathengine-perl
   libxml2 libxml2-dev libxml2-utils libxmlbeans-java libxmu6 libxmuu1 libxpp2-java libxpp3-java libxres1 libxshmfence-dev
   libxshmfence1 libxslt1.1 libxss1 libxt6 libxtables12 libxvidcore4 libyajl2 libyaml-0-2 libyaml-tiny-perl libytnef0
   libzapojit-0.0-0 libzbar0 libzeitgeist-2.0-0 libzinnia0 libzmq3-dev libzmq5 libzstd1 libzvbi-common libzvbi0
   libzzip-0-13 lightsoff linux-base linux-image-amd64 linux-libc-dev lmodern locales login logrotate lsb-base lsb-release
   lsof lua-bitop lua-json lua-lpeg lua-socket lv m17n-db m4 make man-db manpages manpages-dev manpages-ja manpages-ja-dev
   markdown media-player-info mesa-utils mesa-va-drivers mesa-vdpau-drivers mime-support minissdpd
   mobile-broadband-provider-info modemmanager mount mousetweaks mozc-data mozc-server mozc-utils-gui mpi-default-bin
   mpi-default-dev multiarch-support mysql-common mythes-en-us nano nautilus-sendto ncl-tools ncurses-base ncurses-bin
   ncurses-term net-tools netbase netcat-traditional netcdf-doc network-manager network-manager-gnome nkf
   notification-daemon ntfs-3g ocl-icd-libopencl1 odbcinst odbcinst1debian2 openmpi-bin openmpi-common openprinting-ppds
   openssh-client openssh-server openssh-sftp-server openssl os-prober osinfo-db p11-kit p11-kit-modules p7zip p7zip-full
   packagekit packagekit-tools pandoc pandoc-data parted passwd patch pcmciautils pdftk pinentry-curses pinentry-gnome3
   pkg-config plotutils po-debconf policykit-1 poppler-data poppler-utils powermgmt-base powertop ppp preview-latex-style
   printer-driver-all printer-driver-brlaser printer-driver-c2050 printer-driver-c2esp printer-driver-cjet
   printer-driver-dymo printer-driver-escpr printer-driver-foo2zjs printer-driver-foo2zjs-common printer-driver-fujixerox
   printer-driver-gutenprint printer-driver-m2300w printer-driver-min12xxw printer-driver-pnm2ppa printer-driver-ptouch
   printer-driver-pxljr printer-driver-sag-gdi printer-driver-splix procps proj-bin proj-data pry psf-unifont psmisc
   pulseaudio pulseaudio-module-bluetooth pulseaudio-utils pychecker pymacs python-antlr python-apt-common
   python-backports-shutil-get-terminal-size python-bs4 python-cairo python-cffi-backend python-chardet python-cheetah
   python-cryptography python-cssselect python-dap python-dateutil python-decorator python-dnspython python-enum34
   python-formencode python-gi python-gmpy python-gobject-2 python-grib-doc python-html5lib python-httplib2 python-idna
   python-ipython python-ipython-genutils python-jdcal python-joblib python-lxml python-matplotlib-data python-mode
   python-mpltoolkits.basemap-data python-mpltoolkits.basemap-doc python-mpmath python-nose python-openid python-openpyxl
   python-openssl python-paste python-pastedeploy python-pastedeploy-tpl python-pastescript python-pathlib2 python-patsy
   python-pexpect python-pickleshare python-pil python-pkg-resources python-prompt-toolkit python-ptyprocess python-py
   python-pyasn1 python-pyglet python-pygments python-pyparsing python-pyproj python-pyquery python-pytest python-requests
   python-scour python-seaborn python-setuptools python-simplegeneric python-simplejson python-six python-subprocess32
   python-sympy python-sympy-doc python-talloc python-tk python-traitlets python-tz python-urllib3 python-wcwidth
   python-webencodings python-webob python-wget python-xlrd python-xlwt python3-bs4 python3-chardet python3-cupshelpers
   python3-dateutil python3-debian python3-debianbts python3-decorator python3-entrypoints python3-html5lib
   python3-httplib2 python3-ipykernel python3-ipython python3-ipython-genutils python3-ipywidgets python3-jinja2
   python3-jsonschema python3-jupyter-client python3-louis python3-mako python3-mistune python3-mpmath python3-nbconvert
   python3-nbformat python3-pexpect python3-pickleshare python3-pkg-resources python3-prompt-toolkit python3-ptyprocess
   python3-pyatspi python3-pygments python3-pyparsing python3-pysimplesoap python3-reportbug python3-requests
   python3-simplegeneric python3-six python3-software-properties python3-speechd python3-sympy python3-terminado
   python3-traitlets python3-tz python3-urllib3 python3-wcwidth python3-webencodings python3-xdg qpdf qt-at-spi
   qt5-gtk-platformtheme qtchooser qtcore4-l10n qttranslations5-l10n quadrapassel rake readline-common realmd reportbug rpm
   rpm-common rpm2cpio rsync rsyslog rtkit ruby ruby-coderay ruby-dev ruby-did-you-mean ruby-ffi ruby-fftw3 ruby-grib
   ruby-lapack ruby-liquid ruby-listen ruby-method-source ruby-minitest ruby-narray ruby-narray-miss ruby-numru-met
   ruby-numru-units ruby-power-assert ruby-rb-inotify ruby-sass ruby-test-unit rubygems-integration rygel rygel-playbin
   rygel-tracker samba-libs sane-utils seahorse seahorse-daemon sed sensible-utils sgml-data shared-mime-info shotwell
   shotwell-common simple-scan software-properties-common software-properties-gtk sound-theme-freedesktop speech-dispatcher
   speech-dispatcher-audio-plugins speech-dispatcher-espeak-ng spice-client-glib-usb-acl-helper spml spml-doc sudo
   swell-foop synaptic system-config-printer-common system-config-printer-udev systemd systemd-sysv sysvinit-utils t1utils
   tali tar task-desktop task-gnome-desktop task-japanese task-japanese-desktop task-laptop task-print-server
   task-ssh-server tasksel tasksel-data tcl tcl8.6 tcpd tcsh telepathy-logger telepathy-mission-control-5 telnet tex-common
   tex-gyre tk tk8.6 tk8.6-blt2.5 ttf-adf-accanthis ttf-adf-gillius ttf-adf-universalis ttf-unifont tzdata ucf udev udisks2
   uim-mozc unattended-upgrades unifont unzip update-inetd upower usb-modeswitch usb-modeswitch-data usbmuxd usbutils
   util-linux uuid-dev va-driver-all vdpau-driver-all vim vim-common vim-runtime vim-tiny vinagre vino wamerican
   wayland-protocols wget whiptail wireless-tools wpasupplicant x11-apps x11-session-utils x11-utils x11-xkb-utils
   x11-xserver-utils x11proto-composite-dev x11proto-core-dev x11proto-damage-dev x11proto-dri2-dev x11proto-fixes-dev
   x11proto-gl-dev x11proto-input-dev x11proto-kb-dev x11proto-randr-dev x11proto-record-dev x11proto-render-dev
   x11proto-xext-dev x11proto-xf86vidmode-dev x11proto-xinerama-dev xauth xaw3dg xbrlapi xclip xdg-user-dirs
   xdg-user-dirs-gtk xdg-utils xdvik-ja xfonts-base xfonts-unifont xfonts-utils xinit xkb-data xml-core xorg-docs-core
   xserver-common xserver-xephyr xserver-xorg-input-libinput xserver-xorg-input-wacom xserver-xorg-legacy xterm xwayland
   xxd xz-utils yatex yelp-xsl zeitgeist-core zenity zenity-common zlib1g zlib1g:i386 zlib1g-dev
   アップグレード: 1611 個、新規インストール: 327 個、削除: 0 個、保留: 435 個。
   1,510 MB 中 1,510 MB のアーカイブを取得する必要があります。
   この操作後に追加で 1,055 MB のディスク容量が消費されます。
   続行しますか? [Y/n]

* 以下のエラーが出ていたがとりあえず気にしないことにする
   Errors were encountered while processing:
   uim-mozc:amd64
   E: Sub-process /usr/bin/dpkg returned an error code (1)
 
=== apt dist-upgrade をする
matsuba@debian:~$ sudo apt dist-upgrade
パッケージリストを読み込んでいます... 完了
依存関係ツリーを作成しています
状態情報を読み取っています... 完了
アップグレードパッケージを検出しています... 完了
以下のパッケージが自動でインストールされましたが、もう必要とされていません:

これを削除するには 'sudo apt autoremove' を利用してください。
以下のパッケージは「削除」されます:

以下のパッケージが新たにインストールされます:

以下のパッケージはアップグレードされます:

アップグレード: 433 個、新規インストール: 354 個、削除: 47 個、保留: 0 個。
1 個のパッケージが完全にインストールまたは削除されていません。
2,477 MB のアーカイブを取得する必要があります。
この操作後に追加で 1,475 MB のディスク容量が消費されます。
続行しますか? [Y/n]

* 以下のエラーが出現
以前に未選択のパッケージ uim-data を選択しています。
dpkg: `uim-data' のインストール によって壊れた uim-anthy の設定削除を考えています ...
dpkg: 問題ありません。(uim-data によって壊れた) uim-anthy の設定削除をします
.../uim-data_1%3a1.8.8-4+deb10u3_all.deb を展開する準備をしています ...
uim-anthy (1:1.8.6+gh20161003.0.d63dadd-2) を設定削除しています ...
Error: in load: file "/usr/share/uim/lib/sigscheme-init.scm" not found
dpkg: アーカイブ /var/cache/apt/archives/uim-data_1%3a1.8.8-4+deb10u3_all.deb の処理中にエラーが発生しました (--unpack):
 installed uim-anthy package pre-removal script subprocess returned error exit status 1
 処理中にエラーが発生しました:
  /var/cache/apt/archives/uim-data_1%3a1.8.8-4+deb10u3_all.deb
  E: Sub-process /usr/bin/dpkg returned an error code (1)
  

=== apt full-upgrade

matsuba@debian:~$ sudo apt full-upgrade
[sudo] matsuba のパスワード:
パッケージリストを読み込んでいます... 完了
依存関係ツリーを作成しています
状態情報を読み取っています... 完了
これらを直すためには 'apt --fix-broken install' を実行する必要があるかもしれません。
以下のパッケージには満たせない依存関係があります:
 libuim-plugins : 依存: uim-common (>= 1:1.8.6+gh20161003.0.d63dadd-2) しかし、インストールすることができません
  libuim-scm0 : 依存: uim-common (>= 1:1.8.6+gh20161003.0.d63dadd-2) しかし、インストールすることができません
   libuim8 : 依存: uim-common (>= 1:1.8.6+gh20161003.0.d63dadd-2) しかし、インストールすることができません
    uim : 依存: uim-common (= 1:1.8.6+gh20161003.0.d63dadd-2) しかし、インストールすることができません
     uim-anthy : 依存: uim-common (>= 1:1.8.6+gh20161003.0.d63dadd-2) しかし、インストールすることができません
      uim-fep : 依存: uim-common (>= 1:1.8.6+gh20161003.0.d63dadd-2) しかし、インストールすることができません
       uim-gtk2.0 : 依存: uim (= 1:1.8.8-4+deb10u3)
                     依存: uim-gtk2.0-immodule (= 1:1.8.8-4+deb10u3) しかし、インストールされていません
                                   依存: uim-data (>= 1:1.8.8-4+deb10u3) しかし、インストールされていません
                                    uim-gtk3 : 依存: uim-common (>= 1:1.8.6+gh20161003.0.d63dadd-2) しかし、インストールすることができません
                                     uim-qt : 依存: uim-common (>= 1:1.8.6+gh20161003.0.d63dadd-2) しかし、インストールすることができません
                                      uim-qt5 : 依存: uim-common (>= 1:1.8.6+gh20161003.0.d63dadd-2) しかし、インストールすることができません
                                       uim-utils : 依存: uim-common (>= 1:1.8.6+gh20161003.0.d63dadd-2) しかし、インストールすることができません
                                        uim-xim : 依存: uim (>= 1:1.8.8-4+deb10u3)
                                                   依存: uim-data (>= 1:1.8.8-4+deb10u3) しかし、インストールされていません
                                                   E: 未解決の依存関係です。'apt --fix-broken install' を実行してみてください (または解法を明示してください)。

 * apt --fix-broken install

これを削除するには 'sudo apt autoremove' を利用してください。
以下の追加パッケージがインストールされます:
  libuim-scm0 libuim8 uim uim-anthy uim-data uim-fep uim-gtk2.0-immodule uim-gtk3 uim-gtk3-immodule uim-plugins uim-qt5
    uim-qt5-immodule
    以下のパッケージは「削除」されます:
      libuim-plugins uim-qt uim-utils
      以下のパッケージが新たにインストールされます:
        uim-data uim-gtk2.0-immodule uim-gtk3-immodule uim-plugins uim-qt5-immodule
        以下のパッケージはアップグレードされます:
          libuim-scm0 libuim8 uim uim-anthy uim-fep uim-gtk3 uim-qt5
          アップグレード: 7 個、新規インストール: 5 個、削除: 3 個、保留: 47 個。
          542 個のパッケージが完全にインストールまたは削除されていません。
          1,682 kB 中 0 B のアーカイブを取得する必要があります。
          この操作後に追加で 4,697 kB のディスク容量が消費されます。
          続行しますか? [Y/n]
          changelog を読み込んでいます... 完了
          libstdc++6:amd64 (8.3.0-6) を設定しています ...
          (データベースを読み込んでいます ... 現在 408409 個のファイルとディレクトリがインストールされています。)
          .../libuim-scm0_1%3a1.8.8-4+deb10u3_amd64.deb を展開する準備をしています ...
          libuim-scm0:amd64 (1:1.8.8-4+deb10u3) で (1:1.8.6+gh20161003.0.d63dadd-2 に) 上書き展開しています ...
          .../libuim8_1%3a1.8.8-4+deb10u3_amd64.deb を展開する準備をしています ...
          libuim8:amd64 (1:1.8.8-4+deb10u3) で (1:1.8.6+gh20161003.0.d63dadd-2 に) 上書き展開しています ...
          dpkg: `uim-data' のインストール によって壊れた uim-anthy の設定削除を考えています ...
          dpkg: 問題ありません。(uim-data によって壊れた) uim-anthy の設定削除をします
          .../uim-data_1%3a1.8.8-4+deb10u3_all.deb を展開する準備をしています ...
          uim-anthy (1:1.8.6+gh20161003.0.d63dadd-2) を設定削除しています ...
          Error: in load: file "/usr/share/uim/lib/sigscheme-init.scm" not found
          dpkg: アーカイブ /var/cache/apt/archives/uim-data_1%3a1.8.8-4+deb10u3_all.deb の処理中にエラーが発生しました (--unpack):
           installed uim-anthy package pre-removal script subprocess returned error exit status 1
           処理中にエラーが発生しました:
            /var/cache/apt/archives/uim-data_1%3a1.8.8-4+deb10u3_all.deb
            E: Sub-process /usr/bin/dpkg returned an error code (1)
            
matsuba@debian:~$ sudo dpkg -l "linux-image*" | grep ^ii | grep -i meta
ii  linux-image-amd64                    4.19+105+deb10u5 amd64        Linux for 64-bit PCs (meta-package)


=end JA
