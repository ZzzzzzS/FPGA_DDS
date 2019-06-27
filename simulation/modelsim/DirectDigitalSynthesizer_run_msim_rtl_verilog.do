transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/m1899/Desktop/DDSProject {C:/Users/m1899/Desktop/DDSProject/Button.v}
vlog -vlog01compat -work work +incdir+C:/Users/m1899/Desktop/DDSProject {C:/Users/m1899/Desktop/DDSProject/phase.v}
vlog -vlog01compat -work work +incdir+C:/Users/m1899/Desktop/DDSProject {C:/Users/m1899/Desktop/DDSProject/TriangularWave.v}
vlog -vlog01compat -work work +incdir+C:/Users/m1899/Desktop/DDSProject {C:/Users/m1899/Desktop/DDSProject/top.v}
vlog -vlog01compat -work work +incdir+C:/Users/m1899/Desktop/DDSProject {C:/Users/m1899/Desktop/DDSProject/SinWave.v}
vlog -vlog01compat -work work +incdir+C:/Users/m1899/Desktop/DDSProject {C:/Users/m1899/Desktop/DDSProject/PWMWave.v}
vlog -vlog01compat -work work +incdir+C:/Users/m1899/Desktop/DDSProject {C:/Users/m1899/Desktop/DDSProject/ControlPanel.v}
vlog -vlog01compat -work work +incdir+C:/Users/m1899/Desktop/DDSProject {C:/Users/m1899/Desktop/DDSProject/ClockGenerator.v}
vlog -vlog01compat -work work +incdir+C:/Users/m1899/Desktop/DDSProject {C:/Users/m1899/Desktop/DDSProject/SinROM.v}
vlog -vlog01compat -work work +incdir+C:/Users/m1899/Desktop/DDSProject {C:/Users/m1899/Desktop/DDSProject/TriangularROM.v}

vlog -vlog01compat -work work +incdir+C:/Users/m1899/Desktop/DDSProject/simulation/modelsim {C:/Users/m1899/Desktop/DDSProject/simulation/modelsim/top.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  top_vlg_tst

add wave *
view structure
view signals
run -all
