#
# Copyright (C) 2006-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lirc
PKG_VERSION:=0.9.2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://lirc.git.sourceforge.net/gitroot/lirc/lirc
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=7e9d14378a0010e24583d3c9f3b8ae5820edac0e
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/lirc
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=LIRC - Linux Infrared Remote Control
	URL:=http://www.lirc.org/
endef

define Package/lirc/description
	LIRC is a package that allows you to decode and send infra-red signals of many
	(but not all) commonly used remote controls.
endef

CONFIGURE_ARGS += \
	--without-x \
	--disable-static \

#TARGET_CFLAGS += -fPIC -O2

define Build/Configure
	(cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/lirc $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblirc_client.{so*,la} $(1)/usr/lib/
endef

define Package/lirc/install
	$(INSTALL_DIR) $(1)/etc/lirc/
	$(INSTALL_CONF) ./files/etc/lirc/lircd.conf $(1)/etc/lirc/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblirc_client.{la,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/lircd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/lircd $(1)/etc/init.d/lircd
endef

$(eval $(call BuildPackage,lirc))
