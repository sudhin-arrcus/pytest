##Procedure Header
# Name:
#    ::ixiangpf::emulation_ngpf_cfm_config
#
# Description:
#    This procedure configures CFM Bridge neighbors. It can be internal and/or external.
#    You can configure multiple CFM peers per interface by calling the
#    procedure multiple times. This can also configure Y1731, MPs, and MEPs.
#
# Synopsis:
#    ::ixiangpf::emulation_ngpf_cfm_config
#        -handle                                ANY
#        -mode                                  CHOICES disable
#                                               CHOICES enable
#                                               CHOICES create
#                                               CHOICES modify
#                                               CHOICES delete
#        [-count                                ANY
#                                               DEFAULT 1]
#x       [-protocol_name                        ALPHA]
#x       [-active                               CHOICES 0 1
#x                                              DEFAULT 1]
#        [-bridge_count                         NUMERIC]
#x       [-allow_cfm_maid_formats_in_y1731      CHOICES 0 1]
#x       [-enable_out_of_sequence_ccm_detection CHOICES 0 1]
#x       [-encapsulation_type                   CHOICES encapsulationtypeethernet
#x                                              CHOICES encapsulationtypellcsnap]
#x       [-ether_type                           CHOICES ethertype88e6 ethertype8902]
#x       [-operation_mode                       CHOICES cfmieee8021ag y1731]
#x       [-mp_type                              CHOICES mip mep]
#x       [-mep_id                               NUMERIC]
#x       [-md_mg_level                          NUMERIC]
#x       [-rd_i                                 CHOICES rdtypeauto rdtypeon rdtypeoff]
#x       [-md_name_format                       CHOICES mdnameformatnomaintenancedomainname
#x                                              CHOICES mdnameformatdomainnamebasedstr
#x                                              CHOICES mdnameformatmacplustwooctetint
#x                                              CHOICES mdnameformatcharacterstr]
#x       [-md_name                              ALPHA]
#x       [-cci_interval                         CHOICES cciinterval333msec
#x                                              CHOICES cciinterval10msec
#x                                              CHOICES cciinterval100msec
#x                                              CHOICES cciinterval1sec
#x                                              CHOICES cciinterval10sec
#x                                              CHOICES cciinterval1min
#x                                              CHOICES cciinterval10min]
#x       [-short_ma_name_format                 CHOICES shortmanameformatprimaryvid
#x                                              CHOICES shortmanameformatcharstr
#x                                              CHOICES shortmanameformattwooctetint
#x                                              CHOICES shortmanameformatrfc2685vpnid]
#x       [-short_ma_name                        ALPHA]
#x       [-meg_id_format                        CHOICES megidformattypeiccbasedformat
#x                                              CHOICES megidformattypeprimaryvid
#x                                              CHOICES megidformattypecharstr
#x                                              CHOICES megidformattypetwooctetint
#x                                              CHOICES megidformattyperfc2685vpnid]
#x       [-meg_id                               ALPHA]
#x       [-dm_method                            CHOICES dmsupporttypetwoway
#x                                              CHOICES dmsupporttypeoneway]
#x       [-ais_mode                             CHOICES aismodeauto
#x                                              CHOICES aismodestart
#x                                              CHOICES aismodestop]
#x       [-ais_interval                         CHOICES aisinterval1sec
#x                                              CHOICES aisinterval1min]
#x       [-ais_enable_unicast_mac               CHOICES 0 1]
#x       [-ais_unicast_mac                      MAC]
#x       [-enable_ais_rx                        CHOICES 0 1]
#x       [-lck_mode                             CHOICES lckmodeauto
#x                                              CHOICES lckmodestart
#x                                              CHOICES lckmodestop]
#x       [-lck_interval                         CHOICES lckinterval1sec
#x                                              CHOICES lckinterval1min]
#x       [-lck_support_ais_generation           CHOICES 0 1]
#x       [-lck_enable_unicast_mac               CHOICES 0 1]
#x       [-lck_unicast_mac                      MAC]
#x       [-enable_lck_rx                        CHOICES 0 1]
#x       [-tst_mode                             CHOICES tstmodeauto
#x                                              CHOICES tstmodestart
#x                                              CHOICES tstmodestop]
#x       [-tst_interval                         NUMERIC]
#x       [-tst_test_type                        CHOICES tsttesttypeinservice
#x                                              CHOICES tsttesttypeoutofservice]
#x       [-tst_enable_unicast_mac               CHOICES 0 1]
#x       [-tst_unicast_mac                      MAC]
#x       [-tst_sequence_number                  NUMERIC]
#x       [-tst_overwrite_seq_number             CHOICES 0 1]
#x       [-tst_pattern_type                     CHOICES knullsignalwocrc32
#x                                              CHOICES nullsignalwcrc32
#x                                              CHOICES prbswocrc32
#x                                              CHOICES prbswcrc32]
#x       [-tst_initial_pattern_value            HEX]
#x       [-enable_tst_rx                        CHOICES 0 1]
#x       [-tst_packet_length                    NUMERIC]
#x       [-tst_increment_packet_length          CHOICES 0 1]
#x       [-tst_increment_packet_length_step     NUMERIC]
#x       [-enable_lm_counter_update             CHOICES 0 1]
#x       [-lm_method_type                       CHOICES lmmethodtypedualended
#x                                              CHOICES lmmethodtypesingleended]
#x       [-ccm_lmm_txfcf                        NUMERIC]
#x       [-ccm_lmm_txFcf_step_per100mSec        NUMERIC]
#x       [-ccm_rx_fcb                           NUMERIC]
#x       [-ccm_rx_fcb_step_per100mSec           NUMERIC]
#x       [-lmr_tx_fcb                           NUMERIC]
#x       [-lmr_tx_fcb_step_per100mSec           NUMERIC]
#x       [-lmr_rx_fcf                           NUMERIC]
#x       [-lmr_rx_fcf_step_per100mSec           NUMERIC]
#x       [-inter_remote_mep_tx_increment_step   NUMERIC]
#x       [-inter_remote_mep_rx_increment_step   NUMERIC]
#x       [-overrride_vlan_priority              CHOICES 0 1]
#x       [-ccm_priority                         NUMERIC]
#x       [-ltm_priority                         NUMERIC]
#x       [-lbm_priority                         NUMERIC]
#x       [-dm_priority                          NUMERIC]
#x       [-ais_priority                         NUMERIC]
#x       [-lck_priority                         NUMERIC]
#x       [-tst_priority                         NUMERIC]
#x       [-lmm_priority                         NUMERIC]
#x       [-lmr_priority                         NUMERIC]
#x       [-enable_auto_lt                       CHOICES 0 1]
#x       [-auto_lt_timer_in_sec                 NUMERIC]
#x       [-auto_lt_iteration                    NUMERIC]
#x       [-auto_lt_timeout_in_sec               NUMERIC]
#x       [-auto_lt_ttl                          NUMERIC]
#x       [-lt_all_remote_meps                   CHOICES 0 1]
#x       [-lt_destination_mac_address           MAC]
#x       [-enable_auto_lb                       CHOICES 0 1]
#x       [-auto_lb_timer_in_sec                 NUMERIC]
#x       [-auto_lb_iteration                    NUMERIC]
#x       [-auto_lb_timeout_in_sec               NUMERIC]
#x       [-lb_all_remote_meps                   CHOICES 0 1]
#x       [-lb_destination_mac_address           MAC]
#x       [-enable_auto_dm                       CHOICES 0 1]
#x       [-auto_dm_timer_in_sec                 NUMERIC]
#x       [-auto_dm_iteration                    NUMERIC]
#x       [-auto_dm_timeout_in_sec               NUMERIC]
#x       [-dm_all_remote_meps                   CHOICES 0 1]
#x       [-dm_destination_mac_address           MAC]
#x       [-enable_auto_lm                       CHOICES 0 1]
#x       [-auto_lm_timer_in_sec                 NUMERIC]
#x       [-auto_lm_iteration                    NUMERIC]
#x       [-auto_lm_timeout_in_sec               NUMERIC]
#x       [-lm_all_remote_meps                   CHOICES 0 1]
#x       [-lm_destination_mac_address           MAC]
#x       [-enable_sender_id_tlv                 CHOICES 0 1]
#x       [-chassis_id_sub_type                  CHOICES chassisidsubtypechassiscomponent
#x                                              CHOICES chassisidsubtypeinterfacealias
#x                                              CHOICES chassisidsubtypeportcomponent
#x                                              CHOICES chassisidsubtypemacaddress
#x                                              CHOICES chassisidsubtypenetworkaddress
#x                                              CHOICES chassisidsubtypeinterfacename
#x                                              CHOICES chassisidsubtypelocallyassigned]
#x       [-chassis_id_length                    NUMERIC]
#x       [-chassis_id                           HEX]
#x       [-management_address_domain_length     NUMERIC]
#x       [-management_address_domain            HEX]
#x       [-management_address_length            NUMERIC]
#x       [-management_address                   HEX]
#x       [-enable_interface_status_tlv          CHOICES 0 1]
#x       [-enable_port_status_tlv               CHOICES 0 1]
#x       [-enable_data_tlv                      CHOICES 0 1]
#x       [-data_tlv_length                      NUMERIC]
#x       [-data_tlv_value                       HEX]
#x       [-enable_organization_specific_tlv     CHOICES 0 1]
#x       [-organization_specific_tlv_length     NUMERIC]
#x       [-organization_data_tlv_value          HEX]
#x       [-number_of_custom_tlvs                NUMERIC]
#x       [-type                                 ANY]
#x       [-tlv_length                           ANY]
#x       [-value                                ANY]
#x       [-include_tlv_in_ccm                   CHOICES 0 1]
#x       [-include_tlv_in_ltm                   CHOICES 0 1]
#x       [-include_tlv_in_ltr                   CHOICES 0 1]
#x       [-include_tlv_in_lbm                   CHOICES 0 1]
#x       [-include_tlv_in_lbr                   CHOICES 0 1]
#x       [-include_tlv_in_lmm                   CHOICES 0 1]
#x       [-include_tlv_in_lmr                   CHOICES 0 1]
#x       [-md_Meg_Level_CCM                     CHOICES level0
#x                                              CHOICES level1
#x                                              CHOICES level2
#x                                              CHOICES level3
#x                                              CHOICES level4
#x                                              CHOICES level5
#x                                              CHOICES level6
#x                                              CHOICES level7
#x                                              CHOICES levelall]
#x       [-enable_VLANFilter_CCM                CHOICES 0 1]
#x       [-vlan_Stacking_CCM                    CHOICES novlan singlevlan qinq]
#x       [-all_Vlan_CCM                         CHOICES 0 1]
#x       [-vlanId_Filter_CCM                    NUMERIC]
#x       [-vlan_Priority_Filter_CCM             NUMERIC]
#x       [-vlan_Tpid_Filter_CCM                 CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#x       [-all_SVlan_CCM                        CHOICES 0 1]
#x       [-sVlanId_Filter_CCM                   NUMERIC]
#x       [-sVlan_Priority_Filter_CCM            NUMERIC]
#x       [-sVlan_Tpid_Filter_CCM                CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#x       [-all_CVlan_CCM                        CHOICES 0 1]
#x       [-cVlanId_Filter_CCM                   NUMERIC]
#x       [-cVlan_Priority_Filter_CCM            NUMERIC]
#x       [-cVlan_Tpid_Filter_CCM                CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#x       [-ttl_LT                               NUMERIC]
#x       [-timeout_LT                           NUMERIC]
#x       [-transaction_Id_LT                    NUMERIC]
#x       [-mdlevel_LT                           CHOICES level0
#x                                              CHOICES level1
#x                                              CHOICES level2
#x                                              CHOICES level3
#x                                              CHOICES level4
#x                                              CHOICES level5
#x                                              CHOICES level6
#x                                              CHOICES level7
#x                                              CHOICES levelall]
#x       [-all_SrcMEP_LT                        CHOICES 0 1]
#x       [-sourceMp_Mac_LT                      MAC]
#x       [-all_DstMEP_LT                        CHOICES 0 1]
#x       [-destinationMp_Mac_LT                 MAC]
#x       [-auto_VLAN_LT                         CHOICES 0 1]
#x       [-vlan_Stacking_LT                     CHOICES novlan singlevlan qinq]
#x       [-vlanId_Filter_LT                     NUMERIC]
#x       [-vlan_Priority_Filter_LT              NUMERIC]
#x       [-vlan_Tpid_Filter_LT                  CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#x       [-sVlanId_Filter_LT                    NUMERIC]
#x       [-sVlan_Priority_Filter_LT             NUMERIC]
#x       [-sVlan_Tpid_Filter_LT                 CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#x       [-cVlanId_Filter_LT                    NUMERIC]
#x       [-cVlan_Priority_Filter_LT             NUMERIC]
#x       [-cVlan_Tpid_Filter_LT                 CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#x       [-timeout_Lb                           NUMERIC]
#x       [-transaction_Id_Lb                    NUMERIC]
#x       [-mdlevel_Lb                           CHOICES level0
#x                                              CHOICES level1
#x                                              CHOICES level2
#x                                              CHOICES level3
#x                                              CHOICES level4
#x                                              CHOICES level5
#x                                              CHOICES level6
#x                                              CHOICES level7
#x                                              CHOICES levelall]
#x       [-all_SrcMEP_Lb                        CHOICES 0 1]
#x       [-sourceMp_Mac_Lb                      MAC]
#x       [-all_DstMEP_Lb                        CHOICES 0 1]
#x       [-destinationMp_Mac_Lb                 MAC]
#x       [-auto_VLAN_Lb                         CHOICES 0 1]
#x       [-vlan_Stacking_Lb                     CHOICES novlan singlevlan qinq]
#x       [-vlanId_Filter_Lb                     NUMERIC]
#x       [-vlan_Priority_Filter_Lb              NUMERIC]
#x       [-vlan_Tpid_Filter_Lb                  CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#x       [-sVlanId_Filter_Lb                    NUMERIC]
#x       [-sVlan_Priority_Filter_Lb             NUMERIC]
#x       [-sVlan_Tpid_Filter_Lb                 CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#x       [-cVlanId_Filter_Lb                    NUMERIC]
#x       [-cVlan_Priority_Filter_Lb             NUMERIC]
#x       [-cVlan_Tpid_Filter_Lb                 CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#x       [-method_DM                            CHOICES twoway oneway]
#x       [-type_DM                              CHOICES dm dvm]
#x       [-timeout_Dm                           NUMERIC]
#x       [-mdlevel_DM                           CHOICES level0
#x                                              CHOICES level1
#x                                              CHOICES level2
#x                                              CHOICES level3
#x                                              CHOICES level4
#x                                              CHOICES level5
#x                                              CHOICES level6
#x                                              CHOICES level7
#x                                              CHOICES levelall]
#x       [-all_SrcMEP_DM                        CHOICES 0 1]
#x       [-sourceMp_Mac_DM                      MAC]
#x       [-all_DstMEP_DM                        CHOICES 0 1]
#x       [-destinationMp_Mac_DM                 MAC]
#x       [-auto_VLAN_DM                         CHOICES 0 1]
#x       [-vlan_Stacking_DM                     CHOICES novlan singlevlan qinq]
#x       [-vlanId_Filter_DM                     NUMERIC]
#x       [-vlan_Priority_Filter_DM              NUMERIC]
#x       [-vlan_Tpid_Filter_DM                  CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#x       [-sVlanId_Filter_DM                    NUMERIC]
#x       [-sVlan_Priority_Filter_DM             NUMERIC]
#x       [-sVlan_Tpid_Filter_DM                 CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#x       [-cVlanId_Filter_DM                    NUMERIC]
#x       [-cVlan_Priority_Filter_DM             NUMERIC]
#x       [-cVlan_Tpid_Filter_DM                 CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#x       [-timeout_LM                           NUMERIC]
#x       [-mdlevel_LM                           CHOICES level0
#x                                              CHOICES level1
#x                                              CHOICES level2
#x                                              CHOICES level3
#x                                              CHOICES level4
#x                                              CHOICES level5
#x                                              CHOICES level6
#x                                              CHOICES level7
#x                                              CHOICES levelall]
#x       [-all_SrcMEP_LM                        CHOICES 0 1]
#x       [-sourceMp_Mac_LM                      MAC]
#x       [-all_DstMEP_LM                        CHOICES 0 1]
#x       [-destinationMp_Mac_LM                 MAC]
#x       [-auto_VLAN_LM                         CHOICES 0 1]
#x       [-vlan_Stacking_LM                     CHOICES novlan singlevlan qinq]
#x       [-vlanId_Filter_LM                     NUMERIC]
#x       [-vlan_Priority_Filter_LM              NUMERIC]
#x       [-vlan_Tpid_Filter_LM                  CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#x       [-sVlanId_Filter_LM                    NUMERIC]
#x       [-sVlan_Priority_Filter_LM             NUMERIC]
#x       [-sVlan_Tpid_Filter_LM                 CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#x       [-cVlanId_Filter_LM                    NUMERIC]
#x       [-cVlan_Priority_Filter_LM             NUMERIC]
#x       [-cVlan_Tpid_Filter_LM                 CHOICES vlantpid8100
#x                                              CHOICES vlantpid9100
#x                                              CHOICES vlantpid9200
#x                                              CHOICES vlantpid88a8]
#
# Arguments:
#    -handle
#        Valid values are:
#        CFM Bridge
#        For create and modify -mode, handle should be its parent Ethernet node handle.
#        For delete -mode, -handle should be its own handle i.e CFM Bridge node handle.
#        MP:
#        For create and modifiy -mode, hnadle should be its parent Bridge node handle.
#        For delete -mode, -handle should be its own handle i.e MP node handle.
#    -mode
#        This option defines the action to be taken on the CFM Bridge.
#    -count
#        The number of CFM Bridge to configure
#x   -protocol_name
#x       This is the name of the protocol stack as it appears in the GUI.
#x       Name of NGPF element, guaranteed to be unique in Scenario.
#x   -active
#x       Activates the item(like CFM Bridge, MP/MEPs)
#    -bridge_count
#        Number of CFM Bridge/Mps to be created.
#x   -allow_cfm_maid_formats_in_y1731
#x   -enable_out_of_sequence_ccm_detection
#x   -encapsulation_type
#x   -ether_type
#x   -operation_mode
#x   -mp_type
#x   -mep_id
#x   -md_mg_level
#x   -rd_i
#x   -md_name_format
#x   -md_name
#x   -cci_interval
#x   -short_ma_name_format
#x   -short_ma_name
#x       Short MA Name
#x   -meg_id_format
#x   -meg_id
#x       MEG ID
#x   -dm_method
#x   -ais_mode
#x   -ais_interval
#x   -ais_enable_unicast_mac
#x   -ais_unicast_mac
#x   -enable_ais_rx
#x   -lck_mode
#x   -lck_interval
#x   -lck_support_ais_generation
#x   -lck_enable_unicast_mac
#x   -lck_unicast_mac
#x   -enable_lck_rx
#x   -tst_mode
#x   -tst_interval
#x   -tst_test_type
#x   -tst_enable_unicast_mac
#x   -tst_unicast_mac
#x   -tst_sequence_number
#x   -tst_overwrite_seq_number
#x   -tst_pattern_type
#x   -tst_initial_pattern_value
#x   -enable_tst_rx
#x   -tst_packet_length
#x   -tst_increment_packet_length
#x   -tst_increment_packet_length_step
#x   -enable_lm_counter_update
#x   -lm_method_type
#x   -ccm_lmm_txfcf
#x   -ccm_lmm_txFcf_step_per100mSec
#x   -ccm_rx_fcb
#x   -ccm_rx_fcb_step_per100mSec
#x   -lmr_tx_fcb
#x   -lmr_tx_fcb_step_per100mSec
#x   -lmr_rx_fcf
#x   -lmr_rx_fcf_step_per100mSec
#x   -inter_remote_mep_tx_increment_step
#x   -inter_remote_mep_rx_increment_step
#x   -overrride_vlan_priority
#x   -ccm_priority
#x   -ltm_priority
#x   -lbm_priority
#x   -dm_priority
#x   -ais_priority
#x   -lck_priority
#x   -tst_priority
#x   -lmm_priority
#x   -lmr_priority
#x   -enable_auto_lt
#x   -auto_lt_timer_in_sec
#x   -auto_lt_iteration
#x   -auto_lt_timeout_in_sec
#x   -auto_lt_ttl
#x   -lt_all_remote_meps
#x   -lt_destination_mac_address
#x   -enable_auto_lb
#x   -auto_lb_timer_in_sec
#x   -auto_lb_iteration
#x   -auto_lb_timeout_in_sec
#x   -lb_all_remote_meps
#x   -lb_destination_mac_address
#x   -enable_auto_dm
#x   -auto_dm_timer_in_sec
#x   -auto_dm_iteration
#x   -auto_dm_timeout_in_sec
#x   -dm_all_remote_meps
#x   -dm_destination_mac_address
#x   -enable_auto_lm
#x   -auto_lm_timer_in_sec
#x   -auto_lm_iteration
#x   -auto_lm_timeout_in_sec
#x   -lm_all_remote_meps
#x   -lm_destination_mac_address
#x   -enable_sender_id_tlv
#x   -chassis_id_sub_type
#x   -chassis_id_length
#x   -chassis_id
#x   -management_address_domain_length
#x   -management_address_domain
#x   -management_address_length
#x   -management_address
#x   -enable_interface_status_tlv
#x   -enable_port_status_tlv
#x   -enable_data_tlv
#x   -data_tlv_length
#x   -data_tlv_value
#x   -enable_organization_specific_tlv
#x   -organization_specific_tlv_length
#x   -organization_data_tlv_value
#x   -number_of_custom_tlvs
#x       Number Of TLVs
#x   -type
#x       Type
#x   -tlv_length
#x       Length
#x   -value
#x       Value
#x   -include_tlv_in_ccm
#x   -include_tlv_in_ltm
#x   -include_tlv_in_ltr
#x   -include_tlv_in_lbm
#x   -include_tlv_in_lbr
#x   -include_tlv_in_lmm
#x   -include_tlv_in_lmr
#x   -md_Meg_Level_CCM
#x   -enable_VLANFilter_CCM
#x   -vlan_Stacking_CCM
#x   -all_Vlan_CCM
#x   -vlanId_Filter_CCM
#x   -vlan_Priority_Filter_CCM
#x   -vlan_Tpid_Filter_CCM
#x   -all_SVlan_CCM
#x   -sVlanId_Filter_CCM
#x   -sVlan_Priority_Filter_CCM
#x   -sVlan_Tpid_Filter_CCM
#x   -all_CVlan_CCM
#x   -cVlanId_Filter_CCM
#x   -cVlan_Priority_Filter_CCM
#x   -cVlan_Tpid_Filter_CCM
#x   -ttl_LT
#x   -timeout_LT
#x   -transaction_Id_LT
#x   -mdlevel_LT
#x   -all_SrcMEP_LT
#x   -sourceMp_Mac_LT
#x   -all_DstMEP_LT
#x   -destinationMp_Mac_LT
#x   -auto_VLAN_LT
#x   -vlan_Stacking_LT
#x   -vlanId_Filter_LT
#x   -vlan_Priority_Filter_LT
#x   -vlan_Tpid_Filter_LT
#x   -sVlanId_Filter_LT
#x   -sVlan_Priority_Filter_LT
#x   -sVlan_Tpid_Filter_LT
#x   -cVlanId_Filter_LT
#x   -cVlan_Priority_Filter_LT
#x   -cVlan_Tpid_Filter_LT
#x   -timeout_Lb
#x   -transaction_Id_Lb
#x   -mdlevel_Lb
#x   -all_SrcMEP_Lb
#x   -sourceMp_Mac_Lb
#x   -all_DstMEP_Lb
#x   -destinationMp_Mac_Lb
#x   -auto_VLAN_Lb
#x   -vlan_Stacking_Lb
#x   -vlanId_Filter_Lb
#x   -vlan_Priority_Filter_Lb
#x   -vlan_Tpid_Filter_Lb
#x   -sVlanId_Filter_Lb
#x   -sVlan_Priority_Filter_Lb
#x   -sVlan_Tpid_Filter_Lb
#x   -cVlanId_Filter_Lb
#x   -cVlan_Priority_Filter_Lb
#x   -cVlan_Tpid_Filter_Lb
#x   -method_DM
#x   -type_DM
#x   -timeout_Dm
#x   -mdlevel_DM
#x   -all_SrcMEP_DM
#x   -sourceMp_Mac_DM
#x   -all_DstMEP_DM
#x   -destinationMp_Mac_DM
#x   -auto_VLAN_DM
#x   -vlan_Stacking_DM
#x   -vlanId_Filter_DM
#x   -vlan_Priority_Filter_DM
#x   -vlan_Tpid_Filter_DM
#x   -sVlanId_Filter_DM
#x   -sVlan_Priority_Filter_DM
#x   -sVlan_Tpid_Filter_DM
#x   -cVlanId_Filter_DM
#x   -cVlan_Priority_Filter_DM
#x   -cVlan_Tpid_Filter_DM
#x   -timeout_LM
#x   -mdlevel_LM
#x   -all_SrcMEP_LM
#x   -sourceMp_Mac_LM
#x   -all_DstMEP_LM
#x   -destinationMp_Mac_LM
#x   -auto_VLAN_LM
#x   -vlan_Stacking_LM
#x   -vlanId_Filter_LM
#x   -vlan_Priority_Filter_LM
#x   -vlan_Tpid_Filter_LM
#x   -sVlanId_Filter_LM
#x   -sVlan_Priority_Filter_LM
#x   -sVlan_Tpid_Filter_LM
#x   -cVlanId_Filter_LM
#x   -cVlan_Priority_Filter_LM
#x   -cVlan_Tpid_Filter_LM
#
# Return Values:
#    A list containing the network group protocol stack handles that were added by the command (if any).
#x   key:network_group_handle     value:A list containing the network group protocol stack handles that were added by the command (if any).
#    A list containing the cfm emulated protocol stack handles that were added by the command (if any).
#x   key:cfm_emulated             value:A list containing the cfm emulated protocol stack handles that were added by the command (if any).
#    A list containing the cfm emulated mp protocol stack handles that were added by the command (if any).
#x   key:cfm_emulated_mp          value:A list containing the cfm emulated mp protocol stack handles that were added by the command (if any).
#    A list containing the cfm emulated mp tlvlist protocol stack handles that were added by the command (if any).
#x   key:cfm_emulated_mp_tlvlist  value:A list containing the cfm emulated mp tlvlist protocol stack handles that were added by the command (if any).
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    Coded versus functional specification.
#    1) You can configure multiple CFM on each Ixia interface.
#    2) You can configure multiple Y1731.
#
# See Also:
#

proc ::ixiangpf::emulation_ngpf_cfm_config { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_ngpf_cfm_config" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
