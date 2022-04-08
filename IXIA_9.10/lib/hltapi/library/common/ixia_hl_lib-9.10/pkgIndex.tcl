#
# ixiahltgenerated
#
proc _load_ixiahltgenerated_9.10 {dir} {
    foreach {f} [lsort [glob $dir/*.x.tcl]] { uplevel #0 [list source $f] }
    uplevel #0 {package provide ixiahltgenerated 9.10}
}
package ifneeded ixiahltgenerated 9.10 [list _load_ixiahltgenerated_9.10 $dir]

