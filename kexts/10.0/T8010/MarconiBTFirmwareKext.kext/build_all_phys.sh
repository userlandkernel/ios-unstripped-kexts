#!/bin/sh

# Build PHY M8B0
cd ../aciphyfw_bt_marconi/
xcodebuild

# Copy bt_phy_shared_mem_ext.h only once - non dependant of PHY type
cp shared/bt_phy_shared_mem_ext.h                                                             ../aci_bt_fw/SOC/Marconi/PHY_SILICON/

#cp src/platform/common/hci_phy.xml                                                            ../aci_bt_fw/SOC/Marconi/PHY_SILICON/
#cp ../build/btphy-silicon-samos_a0.debug/bin/phy_bin_id.aci                                   ../aci_bt_fw/SOC/Marconi/PHY_SILICON/
#cp ../build/btphy-silicon-samos_a0.debug/bin/phy_fw_image.h                                   ../aci_bt_fw/SOC/Marconi/PHY_SILICON/
#cp ../build/btphy-silicon-samos_a0.debug/bin/btphy-silicon-samos_a0_log_symbols.bin           ../aci_bt_fw/SOC/Marconi/PHY_SILICON/phy_log_symbols.bin
#cp ../build/btphy-silicon-samos_a0.debug/bin/btphy-silicon-samos_a0.version                   ../aci_bt_fw/SOC/Marconi/PHY_SILICON/phy.version
#cp ../build/btphy-silicon-samos_a0.debug/bin/bt_phy.cpf                                       ../aci_bt_fw/SOC/Marconi/PHY_SILICON/

cp src/platform/common/hci_phy.xml                                                            ../aci_bt_fw/SOC/Marconi/PHY_M8B0/
cp ../build/btphy-silicon-samos_a0.debug/bin/phy_bin_id.aci                                   ../aci_bt_fw/SOC/Marconi/PHY_M8B0/
cp ../build/btphy-silicon-samos_a0.debug/bin/phy_fw_image.h                                   ../aci_bt_fw/SOC/Marconi/PHY_M8B0/
cp ../build/btphy-silicon-samos_a0.debug/bin/btphy-silicon-samos_a0_log_symbols.bin           ../aci_bt_fw/SOC/Marconi/PHY_M8B0/phy_log_symbols.bin
cp ../build/btphy-silicon-samos_a0.debug/bin/btphy-silicon-samos_a0.version                   ../aci_bt_fw/SOC/Marconi/PHY_M8B0/phy.version
cp ../build/btphy-silicon-samos_a0.debug/bin/bt_phy.cpf                                       ../aci_bt_fw/SOC/Marconi/PHY_M8B0/

#sed 's/\[\]/_m8b0\[\]/g' ../aci_bt_fw/SOC/Marconi/PHY_M8B0/phy_fw_image.h > ../aci_bt_fw/SOC/Marconi/PHY_SILICON/phy_fw_image_m8b0.h
sed -e "s/\[\]/_m8b0\[\]/g;s/const unsigned long/__attribute__ ((section(\"PHY_IMAGE_TEXT,__const\")))`echo \\\r`const unsigned long/g;" ../aci_bt_fw/SOC/Marconi/PHY_M8B0/phy_fw_image.h > ../aci_bt_fw/SOC/Marconi/PHY_SILICON/phy_fw_image_m8b0.h

# Build PHY M8P
xcodebuild -target btphy-fpga_m8p-samos_a0

cp src/platform/common/hci_phy.xml                                                            ../aci_bt_fw/SOC/Marconi/PHY_M8P/
cp ../build/btphy-fpga_m8p-samos_a0.debug/bin/phy_bin_id.aci                                  ../aci_bt_fw/SOC/Marconi/PHY_M8P/
cp ../build/btphy-fpga_m8p-samos_a0.debug/bin/phy_fw_image.h                                  ../aci_bt_fw/SOC/Marconi/PHY_M8P/
cp ../build/btphy-fpga_m8p-samos_a0.debug/bin/btphy-fpga_m8p-samos_a0_log_symbols.bin         ../aci_bt_fw/SOC/Marconi/PHY_M8P/phy_log_symbols.bin
cp ../build/btphy-fpga_m8p-samos_a0.debug/bin/btphy-fpga_m8p-samos_a0.version                 ../aci_bt_fw/SOC/Marconi/PHY_M8P/phy.version
cp ../build/btphy-fpga_m8p-samos_a0.debug/bin/bt_phy.cpf                                      ../aci_bt_fw/SOC/Marconi/PHY_M8P/

#sed -e "s/\[\]/_m8p\[\]/g;s/const unsigned long/__attribute__ ((section(\"PHY_IMAGE_TEXT,__const\")))`echo \\\r`const unsigned long/g;" ../aci_bt_fw/SOC/Marconi/PHY_M8P/phy_fw_image.h > ../aci_bt_fw/SOC/Marconi/PHY_SILICON/phy_fw_image_m8p.h
sed 's/\[\]/_m8p\[\]/g' ../aci_bt_fw/SOC/Marconi/PHY_M8P/phy_fw_image.h > ../aci_bt_fw/SOC/Marconi/PHY_SILICON/phy_fw_image_m8p.h

# Build PHY M8W
xcodebuild - For M8W platform use M8B0 Phy

cp src/platform/common/hci_phy.xml                                                            ../aci_bt_fw/SOC/Marconi/PHY_M8W/

cp ../build/btphy-silicon_m8w-samos_a0.debug/bin/phy_bin_id.aci                               ../aci_bt_fw/SOC/Marconi/PHY_M8W/
cp ../build/btphy-silicon_m8w-samos_a0.debug/bin/phy_fw_image.h                               ../aci_bt_fw/SOC/Marconi/PHY_M8W/
cp ../build/btphy-silicon_m8w-samos_a0.debug/bin/btphy-silicon_m8w-samos_a0_log_symbols.bin   ../aci_bt_fw/SOC/Marconi/PHY_M8W/phy_log_symbols.bin
cp ../build/btphy-silicon_m8w-samos_a0.debug/bin/btphy-silicon_m8w-samos_a0.version           ../aci_bt_fw/SOC/Marconi/PHY_M8W/phy.version
cp ../build/btphy-silicon_m8w-samos_a0.debug/bin/bt_phy.cpf                                   ../aci_bt_fw/SOC/Marconi/PHY_M8W/

sed -e "s/\[\]/_m8w\[\]/g;s/const unsigned long/__attribute__ ((section(\"PHY_IMAGE_TEXT,__const\")))`echo \\\r`const unsigned long/g;" ../aci_bt_fw/SOC/Marconi/PHY_M8W/phy_fw_image.h > ../aci_bt_fw/SOC/Marconi/PHY_SILICON/phy_fw_image_m8w.h

cd -