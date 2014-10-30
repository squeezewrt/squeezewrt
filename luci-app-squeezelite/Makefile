include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-squeezelite
PKG_RELEASE:=2

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-squeezelite
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:= squeezelite configuration and status module
  DEPENDS:=+luci +squeezelite
  MAINTAINER:= Me, Myself & I
endef

define Package/luci-app-squeezelite/description
	squeezelite web module for LuCi web interface
endef

define Package/luci-app-squeezelite/conffiles
	/etc/config/squeezelite
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-squeezelite/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,luci-app-squeezelite))
