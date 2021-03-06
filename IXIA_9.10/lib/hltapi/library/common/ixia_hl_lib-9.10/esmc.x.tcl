#
# ** Do not edit this file ** 
# This file was generated by the HAG
#

#R End of relative type declaration(s)

#? master type "::hag::ixnmeta::/vport/protocolStack/ethernetEndpoint/range/esmcRange"..
#------------------------------------------------------------------
# Prolog for: /vport/protocolStack/ethernetEndpoint/range/esmcRange
package require snit
foreach {ns} {
  ::ixia::hag::ixn ::ixia::hag::ixn::auto ::ixia::hag::ixn::types
} {
  if {![namespace exists $ns]} { namespace eval $ns {} }
}
if {[llength [info commands ::ixia::hag::ixn::types::/vport/protocolStack/ethernetEndpoint/range/esmcRange]]} {
    #puts stderr "Note: There was already a command called 'snit::type ::ixia::hag::ixn::types::/vport/protocolStack/ethernetEndpoint/range/esmcRange'"
}

snit::type ::ixia::hag::ixn::types::/vport/protocolStack/ethernetEndpoint/range/esmcRange {
  
  # Options used to generate this code
  typevariable GenerateOptions {
    -ancestor-include-level-for-add 0
    -ancestor-include-level-for-create 0
    -anx2hlt-file auto
    -anx2hlt-hltapi-command-element-attrs {}
    -anx2hlt-hltapi-param-element-attrs {}
    -anx2hlt-typepath-links {}
    -children-processing include-all
    -children-processing-for-types {}
    -command-name esmc
    -docs-chapter-name {ESMC APIs}
    -input-include-items-with-typepath {}
    -input-include-items-with-typepath-anx2hlt {}
    -input-ixnmetadata-file ./lib/ixnmetadata-9.10/vport-ixnmetadata.xml,./lib/ixnmetadata-9.10/globals-ixnmetadata.xml
    -input-ixnmetadata-typepath /vport
    -input-skip-items-with-typepath {}
    -input-skip-items-with-typepath-anx2hlt {}
    -input-tailor-file {}
    -input-tailor-file-mandatory 1
    -ixn-tclserver-hostname localhost
    -option-prefixes-for-types {}
    -output-directory ./directions
    -output-library-file {}
    -output-multiplier-option-groups 1
    -output-package-name {}
    -output-package-version 1.0
    -output-package-write-mode w+
    -parent-binding-mode always
    -parent-binding-style none
    -parent-handle-typepath {ancestor range macRange}
    -relative-includes {}
    -rules-file {}
    -shared-includes {}
    -sub-commands {config control stats}
    -type-for-command ethernetEndpoint/range/esmcRange
    -use-settings-for typical_ethernet_based_stackmanager_extension_command
  }
  
  # ixn typepath associated w/ this obj
  variable TypePath /vport/protocolStack/ethernetEndpoint/range/esmcRange
  variable AncestorIncludeLevelForCreate  0
  variable AncestorIncludeLevelForAdd  0
  # Ancestors that we auto-created and are managing ourselves
  # as opposed to those linked in via -parent_handle or some other
  # linkage option
  variable Ancestors {}
  # relatives of these types must be made along w/ the 
  # direct ancestry elements
  variable Relatives {}
  # carried thru from ixn SDM. kList, kManaged, kRequired, etc...
  variable Multiplicity kOptional
  # if this an element with a kManaged Mutiplicity, this contains
  # the managed index used by the enclosing container for ::my_codegen
  # if this thing is not kManaged, it is the empty string
  option -element_index -default ""
  # shell obj that holds utils like _create_instance, etc..
  typevariable Shell ::ixia::hag::ixn::types::shell
  # see _create
  typevariable ParentBindingStyle none
  typevariable ParentBindingMode always
  
  # A place for data managed by custom overrides
  # in tailor files
  variable UserInstanceData -array {}
  
  variable _REQUIRED_OPT "\x1"
  variable OwnIxnHandle ""
  method _own_ixn_handle {} {return $OwnIxnHandle}
  # underlying 'low level' ixn tcl handle for self
  variable IxnHandle ""
  method _ixn_handle {} {return $IxnHandle}
  method _set_ixn_handle {i_ixn_handle {i_own_ixn_handle 1}} {
      if {[string length $IxnHandle]} {
         return -code error  "Can't set to \"$i_ixn_handle\". IxnHandle is already set to $IxnHandle"
      }
      set IxnHandle $i_ixn_handle
      set OwnIxnHandle $i_own_ixn_handle
  }
  variable Parent ""
  #
  # Children: 
  # A paired list of form:
  #
  # {child_obj_0 tight ... child_obj_N loose}
  #
  # tight/loose indicated a tight binding , meaning that the child
  # should be destroyed are part of $self's destruction process
  variable Children {}
  
  typemethod _get_typevar {n} {set $n}
  method _get_var {n} {set $n}
  method _set_var {n v} {
      if {![info exists $n]} {
          return -code error "No such variable \"$n\""
      }
      set $n $v
  }
  method _parent {} {return $Parent}
  method _top_ancestor {} {
      if {[string length $Parent] == 0} {
          return -code error "$self: parent is undefined"
      }
      set x_obj $Parent
      while {[string length $x_obj]} {
          set rval $x_obj
          set x_obj [$x_obj _parent]
      }
      return $rval;
  }
  method _ancestor {lvl} {
      if {$lvl<0} {
          return -code error  "$self: Level ($lvl) must be a positive #"
      } elseif {$lvl == 0} {
          return $self
      }
      incr lvl -1; set rval $Parent
      #puts stderr "$self parent -> $Parent"
      for {} {$lvl>0} {incr lvl -1} {
          set rval [$rval _parent]
      }
      return $rval
  }
  method _descendant {i_typepath} {
      set rval $self
      foreach {elem} [$self _typepath_split $i_typepath] {
          set found 0
          foreach {child child_mode} [$rval _get_var Children] {
              set t [$child _typepath_tail [$child _typepath]]
              if {[string equal $t  $elem]} {
                  set rval $child
                  set found 1
                  break;
              }
          }
          if {$found == 0} {
              return -code error  "$self: cannot find descendant $i_typepath"
          }
      }
      return $rval
  }
  
  method _relative {i_relative_tp {include_ancestors 0}} {
      set rval ""
      foreach {relative_tp share_tp inst} $Relatives {
          if {[string equal $relative_tp  $i_relative_tp]} {
              # sanity check..
              if {[string length $rval]} {
                  return -code error  "more than one relative \"$i_relative_tp\""
              }
              set rval $inst
          }
      }
      if {$include_ancestors} {
        set fq_tp [$self _typepath_normalize  [$self _typepath_join [$self _typepath] $i_relative_tp]]
        set alist {}
        foreach {a} $Ancestors {
          set ap [$a _typepath]
          lappend alist $ap
          if {[string equal $ap $fq_tp]} {
              # sanity check..
              if {[string length $rval]} {
                return -code error  "more than one relative/ancestor \"$i_relative_tp\""
              }
              set rval $a
          }
        }
      }
      if {[string length $rval] == 0} {
          if {$include_ancestors} {
              set what "relatives/ancestors"
              set astuff "with ancestors $alist"
          } else {
              set what "relatives"
              set astuff ""
          }
          return -code error  "$self: Cannot find relative $i_relative_tp: existing $what are:\n------\n$Relatives\n$astuff\n-----\n"
      }
      return $rval
  }
  
  
  method abort        {} { $Shell abort $self }
  method abort_async  {} { $Shell abort_async $self}
  method start        {} { $Shell start $self }
  method stop         {} { $Shell stop  $self }
  
  #--------------------------------------------------------------------
  # ixn handle creation support methods
  method _trace {args} {
      if [set ${Shell}::_TRACE(HAG)] {puts stderr "$self: [join $args]"}
  }
  method _tr {args} {
      if [set ${Shell}::_TRACE(HAG)] {puts stderr "    [join $args]"}
  }
  method _typepath_split {p} { file split $p }
  method _typepath_parent {p} { file dirname $p }
  method _typepath_join {args} { eval [concat {file join} $args] }
  method _typepath_tail {p} { file tail $p}
  method _typepath {} { return $TypePath }
  method _typepath_normalize {p} { regsub {^[^/]+} [file normalize $p] {} }
  method _typepath_relativity {p} {
      set l 0; foreach {x} [$self _typepath_split $p] {
          if {$x !=  ".."} {break} else {incr l}
      }
      return $l
  }
  
  method _delete_ixn_subelement {i_ixn_handle} {
      $Shell _delete_ixn_subelement $self $i_ixn_handle
  }
  method _add_ixn_subelement {element_inst element_name} {
      $Shell _add_ixn_subelement $self $element_inst $element_name
  }
  
  method _bind_to_parent {args} {
      array set opts {
          -parent "" -tight-binding 0 -ixn-handle ""
          -binding-mode ""
      }; array set opts $args
      if {[string length $opts(-binding-mode)] == 0} {
          set opts(-binding-mode) $ParentBindingMode
      }
      set child $self
      if {[lsearch {internal_default tight loose none}  $opts(-tight-binding)] >= 0} {
          set child_mode $opts(-tight-binding)
      } else {
          if {[string length $opts(-tight-binding)] == 0} {
              set child_mode "none"
          } elseif {$opts(-tight-binding)} {
              set child_mode "tight"
          } else {
              set child_mode "loose"
          }
      }
      if {[string equal $child_mode "internal_default"]} {
          set child_mode $ParentBindingStyle
      }
      unset opts(-tight-binding)
      if {$child_mode == "none"} {
          return
      }                
      
      $self _tr "$opts(-parent) <- Binding to"
      if {[string length $Parent]} {
          if {$opts(-binding-mode) != "ifneeded"} {
              set msg  "$opts(-parent) <- Binding to already has parent $Parent"
              $self _tr $msg
              return -code error $msg
          } else {
              return
          }
      }
      set Parent $opts(-parent)
      if {[llength [info commands $Parent]] != 1} {
          return -code error  "$self:Parent \"$Parent\" is not a legal object"
      }
  
      if {[string length $opts(-ixn-handle)] == 0} {
          if {[string length [$self _ixn_handle]]} {
            set msg "Already have _ixn_handle \"[$self _ixn_handle]\""
            return -code error $msg
          }
          $self _set_ixn_handle [$Parent  _add_ixn_subelement  $self  [$self _typepath_tail $TypePath]]
      } else {
          $self _set_ixn_handle $opts(-ixn-handle)
      }
  
      $self configurelist [$self _alterations_to_option_defaults]
      $Parent _set_var Children [concat  [$Parent _get_var Children] [list $child $child_mode]  ]
  }
  
  
  method _configure_args_multiplier {m n args} {
      if {[llength $args] == 1} {set args [lindex $args 0]}
      $Shell _configure_args_multiplier $self $m $n $args
  }
  
  typemethod _pluck_o {main_opt opt default alistN} {
      upvar 1 $alistN alist
      set li [lsearch -exact $alist $opt]
      set ll [llength $alist]
      if {($li < 0)} {
          if {$default == $_REQUIRED_OPT} {
              return -code error  "Option \"$main_opt\" requires the option \"$opt\" to also be specified."
          }
      }
      set rval [lindex $alist [expr $li+1]]
      set alist [lreplace $alist $li [expr $li+1]]
      return $rval
  }
  #
  # a return of empty list means there is no option group
  # for the supplied option $opt 
  #
  # the arglistN reference will be
  # modfied (found modifier options will removed) 
  # if an option group is found for $opt
  #
  method _multiplier_opt_group {i_opt arglistN} {
      set rval {}
      upvar 1 $arglistN arglist
      foreach {mcmd mog} $MultiplierOptionGroups {
          if {[lsearch -exact $mog $i_opt] != -1} {
              lappend rval $mcmd
              set expanded_mog {} 
              # remove the mog options from args
              foreach {mo} $mog {
                  set mv [$type _pluck_o  $i_opt $mo $_REQUIRED_OPT arglist]
                  lappend expanded_mog $mo $mv
              }
              lappend rval $expanded_mog
              break
          }
      }
      return $rval
  }
  
  # Do any special initialization that should occur 
  # after the instance has been created via xxx_config create|add
  # and it's initial properties have been configured
  #
  # Intended to be overrideable
  method _post_construct_callback {args} {}
  
  #
  # callback to do any conversion needed to make what we are passed
  # an XYZ object w/ a proper ixn handle associated w/ it
  # By default, the handle passed is used as is
  #
  # Intended to be overrideable
  method _cast_handle_to_parent_obj {initial_parent_handle args} {
      return $initial_parent_handle
  }
  method _create_clan {initial_parent_handle ancestor_inc_level} {
    $Shell _create_clan $self $initial_parent_handle $ancestor_inc_level
  }
  method _create_relatives {} {$Shell _create_relatives $self}
  method _create_ancestry {args} {
      if {[llength $args] == 1} {set args [lindex $args 0]}
      $Shell _create_ancestry $self $args
  }
  method _destroy_clan {} {$Shell _destroy_clan $self}
  method _destroy_children {} {$Shell _destroy_children $self}
  method _destroy_relatives {} {$Shell _destroy_relatives $self}
  method _destroy_ancestry {} {$Shell _destroy_ancestry $self}
  
  method _cget_kBool {t} {
      # ixn is arbitrary on this. return normalized True/False 
      $Shell _check_ixnhandle $self
      if {[$Shell _ixn_eval ixNet getAttribute  [$self _ixn_handle] -$Opt2IxnName($t)]} {
          return True
      }
      return False
  }
  method _cget_basic {t} {
      $Shell _check_ixnhandle $self
      $Shell _ixn_eval ixNet getAttribute  [$self _ixn_handle] -$Opt2IxnName($t)
  }
  method _configure_basic {t v} {
      $Shell _check_ixnhandle $self
      $Shell _ixn_eval ixNet setAttribute  [$self _ixn_handle] -$Opt2IxnName($t) $v
  }
  method _validate_basic {t v} {
      if {false} { 
          return -code error "expected a ??? value, got $v"
      }
  }
  
  method _configure_kManaged_as_list {ixn_typepath t v} {
      # Clear existing list (if any)
      $self _destroy_children
      # (Re)build list w/ supplied items
      foreach {subobj_tv_list} $v {
          set err ""
          set element_index ""
          catch {set element_index  [$Shell arg_pluck -element_index subobj_tv_list $err]} err
          set inst [$Shell _create_instance $ixn_typepath  -element_index $element_index]
          $inst _bind_to_parent -parent $self -tight-binding 1
          $inst _create_relatives
          $Shell _configure_instance $inst $subobj_tv_list
      }
  }
  method _validate_kManaged_as_list {ixn_typepath t v} {
  }
  
  method _configure_kList_as_list {ixn_typepath t v} {
      # Clear existing list (if any)
      $self _destroy_children
      # (Re)build list w/ supplied items
      foreach {subobj_tv_list} $v {
          set inst [$Shell _create_instance $ixn_typepath]
          $inst _bind_to_parent -parent $self -tight-binding 1
          $inst _create_relatives
          $Shell _configure_instance $inst $subobj_tv_list
      }
  }
  method _validate_kList_as_list {ixn_typepath t v} {
  }
  
  method _configure_kList_as_multiplier {ixn_typepath t v} {
      # "Tighten on up !" -- James Brown
      set subobj_args [concat {-tight-binding 1} $v]
      set err "missing -count option."
      set parent_handle $self
      set count [$Shell arg_pluck -count subobj_args $err]
      # Clear existing list (if any)
      $self _destroy_children
      # (Re)build list w/ supplied items
      $Shell _multi_create $count $parent_handle  $ixn_typepath $subobj_args
  }
  method _validate_kList_as_multiplier {ixn_typepath t v} {
  }
  
  method _cget_relative {relative_typepath t} {
      set inst [$self _relative $relative_typepath 1];#include ancestors
      $Shell _cget_instance $inst $t
  }
  method _configure_relative {relative_typepath t v} {
      set inst [$self _relative $relative_typepath 1];#include ancestors
      $Shell _configure_instance $inst [list $t $v]
  }
  
  #------------------------------------------------------
  # options that are mapped to ixn properties
  #
  
  option -object_id \
    -cgetmethod _g_object_id -configuremethod _c_object_id -validatemethod _v_object_id \
    -default "" \
    -readonly false
  method _c_object_id {t v} {  }
  method _v_object_id {t v} { ::ixia::hag::ixn::validate::kString $t $v }
  method _g_object_id {t} { $self _cget_basic $t }
  # multiplier 
  method _m_object_id {mog_args m n other_args} {  $Shell _m_kString  $self $mog_args $m $n $other_args -object_id }
  
  option -rate \
    -cgetmethod _g_rate -configuremethod _c_rate -validatemethod _v_rate \
    -default "" \
    -readonly false
  method _c_rate {t v} { $self _configure_basic $t $v }
  method _v_rate {t v} { ::ixia::hag::ixn::validate::kInteger64 $t $v }
  method _g_rate {t} { $self _cget_basic $t }
  # multiplier 
  method _m_rate {mog_args m n other_args} {  $Shell _m_kInteger64  $self $mog_args $m $n $other_args -rate }
  
  option -name \
    -cgetmethod _g_name -configuremethod _c_name -validatemethod _v_name \
    -default "" \
    -readonly false
  method _c_name {t v} { $self _configure_basic $t $v }
  method _v_name {t v} { ::ixia::hag::ixn::validate::kString $t $v }
  method _g_name {t} { $self _cget_basic $t }
  # multiplier 
  method _m_name {mog_args m n other_args} {  $Shell _m_kString  $self $mog_args $m $n $other_args -name }
  
  option -ql \
    -cgetmethod _g_ql -configuremethod _c_ql -validatemethod _v_ql \
    -default "" \
    -readonly false
  method _c_ql {t v} { $self _configure_basic $t $v }
  method _v_ql {t v} { ::ixia::hag::ixn::validate::kString $t $v }
  method _g_ql {t} { $self _cget_basic $t }
  # multiplier 
  method _m_ql {mog_args m n other_args} {  $Shell _m_kString  $self $mog_args $m $n $other_args -ql }
  
  option -wait_id \
    -cgetmethod _g_wait_id -configuremethod _c_wait_id -validatemethod _v_wait_id \
    -default "" \
    -readonly false
  method _c_wait_id {t v} { $self _configure_basic $t $v }
  method _v_wait_id {t v} { ::ixia::hag::ixn::validate::kBool $t $v }
  method _g_wait_id {t} { $self _cget_kBool $t }
  option -enabled \
    -cgetmethod _g_enabled -configuremethod _c_enabled -validatemethod _v_enabled \
    -default "" \
    -readonly false
  method _c_enabled {t v} { $self _configure_basic $t $v }
  method _v_enabled {t v} { ::ixia::hag::ixn::validate::kBool $t $v }
  method _g_enabled {t} { $self _cget_kBool $t }
  option -flag_mode \
    -cgetmethod _g_flag_mode -configuremethod _c_flag_mode -validatemethod _v_flag_mode \
    -default "" \
    -readonly false
  method _c_flag_mode {t v} { $self _configure_basic $t $v }
  method _v_flag_mode {t v} { ::ixia::hag::ixn::validate::kString $t $v }
  method _g_flag_mode {t} { $self _cget_basic $t }
  # multiplier 
  method _m_flag_mode {mog_args m n other_args} {  $Shell _m_kString  $self $mog_args $m $n $other_args -flag_mode }
  
  # End options that are mapped to ixn properties
  #------------------------------------------------------
  
  option -shell -default "" -readonly true
  
  #
  # constructor/destructor section
  #
  delegate option * to CustomOptionHandler
  constructor {args} {
      $self configurelist $args
      catch {$self _post_constructor} err
      set result ""
      set failed [catch {$self _construct_custom_option_handler} res]
      if {!$failed} {
          set CustomOptionHandler $res
      }
      if {$failed} {
          set msg "warning: _construct_custom_options_handler error: "
          append msg "$res:\n$::errorInfo" 
          puts stderr $msg
      }
      set failed [catch {
          set MultiplierOptionGroups [concat  [$self _custom_multiplier_option_groups]  $MultiplierOptionGroups]
      } err]
      if {$failed} {
          set msg "warning: _custom_multiplier_option_groups error: "
          append msg "$res:\n$::errorInfo" 
          puts stderr $msg
      }
  }
  destructor {
      set failed [catch {$self _pre_destructor} err]
      if {$failed} {
          puts stderr  "warning: _pre_destructor error: $err:\n$::errorInfo"
      }
      set failed [catch {$self _destroy_clan} err]
      if {$failed} {
          puts stderr  "----\nwarning: _destroy_clan error: $err:\n$::errorInfo\n---"
      }
      # if it's the dummy custom option handler
      # leave it alone it's shared by everyone..
      if {$CustomOptionHandler !=  "::ixia::hag::ixn::types::nooptionhandler"} {
          set failed [catch {$CustomOptionHandler destroy} err]
          if {$failed} {
              puts stderr  "warning: _destroy_clan err: $err:\n$::errorInfo"
          }
      }
  }
  method _configlist {args} {
      if {[llength $args] == 1} {set args [lindex $args 0]}
      set last_n "?"
      foreach {t v} $args {
          if {($last_n != "?") && [info exists Opt2IxnName($t)]} {
              set n [file dirname $Opt2IxnName($t)]
              if {$n != $last_n} {
                  # puts stderr "ZZZZZZ $n != $last_n, commit"
                  $Shell _ixn_eval ixNet commit
                  set last_n $n
              }
          } elseif {[info exists Opt2IxnName($t)]} {
              set last_n [file dirname $Opt2IxnName($t)]
          }
          $self configure $t $v
      }
  }
  # Intended to be overrideable
  method _post_constructor {} {
      # place holder to allow for interposing of code after
      # construction takes place
  }
  # Intended to be overrideable
  method _pre_destructor {} {
      # place holder to allow for interposing of code before
      # destruction of object takes place
  }
  # Intended to be overrideable
  method _alterations_to_option_defaults {} {
      # place holder to allow for option defaults different from
      # ixn meta schema
      return {}
  }
  # Intended to be overrideable
  method _custom_multiplier_option_groups {} {
      return {}
  }
  variable CustomOptionHandler ""
  # Intended to be overrideable
  method _construct_custom_option_handler {} {
      return ::ixia::hag::ixn::types::nooptionhandler
  }
  
  # Intended to be overrideable
  typemethod _aggregate_stat_keyed_list_add {
   inst port_str bank_tag bank_name alias_array_N rows_array_N rval_N
  } {
      upvar 1 $alias_array_N alias_array
      upvar 1 $rows_array_N rows_array
      upvar 1 $rval_N rval
      foreach {n} [array names rows_array {[0-9]*,*}] {
          set v $rows_array($n)
          set nn [join [lrange [split $n ","] 1 end] ","]
          # if an alias is not defined, generate one
          # map dashes spaces dots. etc.. to underscore
          # and lower case everything
          if {![info exists alias_array($nn)]} {
              set alias_array($nn) [string map  { "-" "_" " " "_" "." "_" "/" "_"}  [string tolower $nn]]
          }
          set alias $alias_array($nn)
          keylset rval ${port_str}.aggregate.${bank_tag}.${alias} $v
      }
  }
  
  # Intended to be overrideable
  typemethod _aggregate_stat_decl {inst} {
      puts stderr "*** Note! no _aggregate_stat_decl override declared for:\n***\t$inst"
      puts stderr "*** check the tailor_XXX.tcl file associated w/ $inst"
      return {}
  }
  typemethod _stat_doc_decl {} {
      puts stderr "*** Note! no _stat_doc_decl override declared for:\n***\t$type"
      puts stderr "*** check the tailor_XXX.tcl file associated w/ $type"
      return {}   
  }
  typemethod _gen_config_arg_callback {param_name param_desc_ref} {
      #puts stderr "*** Note! no _gen_config_arg_callback override declared for:\n***\t$type"
      #puts stderr "*** check the tailor_XXX.tcl file associated w/ $type"
  }
  
  typemethod _aggregate_stats {inst_list} {
      set rval {}
      if {[llength $inst_list] == 0} {
          return -code error "no instances supplied"
      }
  
      set trobj [lindex $inst_list 0]
      #---
      # (Get) list of chassis ip from ixn. this is used to 
      # so we can convert chassis address to chassis number
      # see (Parse) comment below
      #
      set ch_list [$Shell _ixn_chassis_ip_list]
      #---
      foreach {inst} $inst_list {
          set hlt_port_str [$Shell _hlt_port_string_for_inst $inst]
  
          set decl [$type _aggregate_stat_decl $inst]
          #array set statViewBrowserNamesArray $statistic_types
          set statViewBrowserNamesList {}
          foreach { bank_tag bank_name bank_items } $decl {
              if {[string match "#*" $bank_tag]} {
                  continue
              }
              lappend statViewBrowserNamesList $bank_name
          }
  
          # TBD: classic code had this after
          # apparently enabling stats is buggy
          #after 10000
          $Shell _stats_enable_view_list $statViewBrowserNamesList
  
          array set alias_array {};
          array set rows_array {}; unset rows_array
          array set rows_array {}
          foreach {bank_tag bank_name bank_items} $decl {
              set stats_list {};
              unset alias_array; array set alias_array {}
              foreach {t v}  $bank_items {
                  lappend stats_list $t
                  if {[string equal $v "-"]} {
                    set v [string map {" " "_"} [string tolower $t]]
                  }
                  set alias_array($t) $v
              }
              # (re)init stats array to empty;
              unset rows_array; array set rows_array {};
              set row_count [$Shell  _stats_get rows_array $bank_name $stats_list $inst]
              if {1} {
                  $trobj _trace "Got $row_count stat rows"
                  foreach {n} [lsort [array names rows_array]] {
                      $trobj _tr "RRR <$hlt_port_str,$bank_tag,$bank_name>\t$n: $rows_array($n)"
                  }
              }
              $type _aggregate_stat_keyed_list_add  $inst  $hlt_port_str $bank_tag $bank_name  alias_array  rows_array  rval
          }
      } 
      return $rval
  }
  
  
  # Map of hlt option name --> ixnetwork attribute name
  typemethod getOpt2IxnName {} {array get Opt2IxnName}
  typevariable Opt2IxnName -array {
    -object_id objectId
    -rate rate
    -name name
    -ql ql
    -wait_id waitId
    -enabled enabled
    -flag_mode flagMode
  }
  #
  variable MultiplierOptionGroups {
    _m_object_id {-object_id_format -object_id_base -object_id_incr}
    _m_rate {-rate_base -rate_incr}
    _m_name {-name_format -name_base -name_incr}
    _m_ql {-ql_format -ql_base -ql_incr}
    _m_flag_mode {-flag_mode_format -flag_mode_base -flag_mode_incr}
  }
}

#@ ancestors for ::hag::ixnmeta::/vport/protocolStack/ethernetEndpoint/range/esmcRange
#@ end of ancestors for ::hag::ixnmeta::/vport/protocolStack/ethernetEndpoint/range/esmcRange

#
# Source in an optional tailor file that allows
# customization for the generated snit objects
#
set file_found 0
set dir [file normalize [file dirname [info script]]]
if {[file exists [set dir]/tailor_ethernetEndpoint_range_esmcRange.tcl]} {
    set fn [set dir]/tailor_ethernetEndpoint_range_esmcRange.tcl
    uplevel #0 [list namespace eval :: [list source [set fn]]]
    set file_found 1
} elseif {[file exists [set dir]/../tailor_ethernetEndpoint_range_esmcRange.tcl]} {
    set fn [set dir]/../tailor_ethernetEndpoint_range_esmcRange.tcl
    uplevel #0 [list namespace eval :: [list source [set fn]]]
    set file_found 1
}
# if -input-tailor-file-mandatory
if 1 { 
    if {![set file_found]} {
      return -code error  "Could not find required tailorfile 'tailor_ethernetEndpoint_range_esmcRange.tcl'"
    }
}

#-------------------------------------------------------------
# Generated by the hag on 
#     Fri Aug 07 13:37:03 PDT 2020
#-------------------------------------------------------------
# package requires, etc.
package require snit
#-------------------------------------------------------------

if {[llength [info commands ::ixia::esmc]]} {
    rename ::ixia::esmc ""
}
::ixia::hag::ixn::types::shell ::ixia::esmc  -config-multiplier-option-groups 1  -config-typepathways  [list /vport/protocolStack/ethernetEndpoint/range/esmcRange]
#
# Shell level commands
# - XXX_config
# - XXX_control
# - XXX_stats
#

proc ::ixia::esmc_config {args} {
  set procName [lindex [info level [info level]] 0]
  ::ixia::logHltapiCommand $procName $args
  ::ixia::utrackerLog $procName $args
  if {$::ixia::hag::ixn::Opts(keyedListReturnValues)} {
    set fail [catch  [concat ::ixia::esmc config [set args]] r]
    if {$fail} {
      return [list [list status 0] [list log $r\n$::errorInfo]]
    } else {
      return [list [list status 1] [list handles $r] [list log ""]]
    }
  } else {
    eval [concat {::ixia::esmc config} [set args]]
  }
}

proc ::ixia::esmc_control {args} {
  set procName [lindex [info level [info level]] 0]
  ::ixia::logHltapiCommand $procName $args
  ::ixia::utrackerLog $procName $args
  if {$::ixia::hag::ixn::Opts(keyedListReturnValues)} {
    set fail [catch  [concat ::ixia::esmc control [set args]] r]
    if {$fail} {
      return [list [list status 0] [list log $r\n$::errorInfo]]
    } else {
      return [list [list status 1] [list inner_results $r] [list log ""]]
    }
  } else {
    eval [concat {::ixia::esmc config} [set args]]
  }
}

proc ::ixia::esmc_stats {args} {
  set procName [lindex [info level [info level]] 0]
  ::ixia::logHltapiCommand $procName $args
  ::ixia::utrackerLog $procName $args
  if {$::ixia::hag::ixn::Opts(keyedListReturnValues)} {
    set fail  [catch [concat {::ixia::esmc stats} [set args]] r]
    if {$fail} {
      return [list [list status 0] [list log $r\n$::errorInfo]]
    } else {
      return [concat  [list [list status 1] [list log ""]]  $r  ]
    }
  } else {
    eval [concat {::ixia::esmc stats} [set args]]
  }
}

