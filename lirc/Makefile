#
# Copyright (C) 2006-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lirc
PKG_VERSION:=0.9.3a
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://lirc.git.sourceforge.net/gitroot/lirc/lirc
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=lirc-0_9_3a
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/lirc
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=LIRC - Linux Infrared Remote Control
	URL:=http://www.lirc.org/
	DEPENDS:=+libstdcpp
endef

define Package/lirc/description
	LIRC is a package that allows you to decode and send infra-red signals of many
	(but not all) commonly used remote controls.
endef

CONFIGURE_ARGS += \
	--without-x \
	--disable-static \

DESTDIR = $(PKG_INSTALL_DIR)

define Build/Configure
	(cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default,$(CONFIGURE_ARGS))
endef

define Build/Install
	$(MAKE) $(MAKE_FLAGS) -C $(PKG_BUILD_DIR) install DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/lirc $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblirc.{so*,la} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblirc_driver.{so*,la} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblirc_client.{so*,la} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libirrecord.{so*,la} $(1)/usr/lib/
endef

define Package/lirc/install
	$(INSTALL_DIR) $(1)/etc/lirc
	$(CP) ./files/etc/lirc/lirc_options.conf $(1)/etc/lirc/
	$(CP) ./files/etc/lirc/lircd.conf $(1)/etc/lirc/
	$(INSTALL_DIR) $(1)/etc/lirc/lircd.conf.d
	$(CP) ./files/etc/lirc/lircd.conf.d/devinput.conf $(1)/etc/lirc/lircd.conf.d/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblirc.{la,so*} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblirc_driver.{la,so*} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblirc_client.{la,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/lirc/plugins
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lirc/plugins/devinput.{la,so*} $(1)/usr/lib/lirc/plugins/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/lircd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
endef

$(eval $(call BuildPackage,lirc))
