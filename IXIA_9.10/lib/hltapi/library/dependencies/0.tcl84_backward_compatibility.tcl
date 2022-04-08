if {[info tclversion] < 8.5} { 
    
    proc mpincr {Value {incrAmt 1}} {
        upvar $Value value
        set value [mpexpr $value + $incrAmt]
        return $value
    }
    
    if {[info commands lrepeat]==""} {
        proc lrepeat {positiveCount value args} {
            if {![string is integer -strict $positiveCount]} {
                return -code error "expected integer but got \"$positiveCount\""
            } elseif {$positiveCount < 1} {
                return -code error {must have a count of at least 1}
            }
            set args   [linsert $args 0 $value]
            if {$positiveCount == 1} {
                return $args
            }
            set result [::list]
            while {$positiveCount > 0} {
                if {($positiveCount % 2) == 0} {
                set args [concat $args $args]
                set positiveCount [expr {$positiveCount/2}]
                } else {
                set result [concat $result $args]
                incr positiveCount -1
                }
            }
            return $result
            }
        }
}
