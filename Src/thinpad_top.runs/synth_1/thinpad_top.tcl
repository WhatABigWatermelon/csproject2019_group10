# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a100tfgg676-2L

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/Totoro/Src/thinpad_top.cache/wt [current_project]
set_property parent.project_path D:/Totoro/Src/thinpad_top.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/Totoro/Src/thinpad_top.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_mem {
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/inst_rom.mem
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/fun.mem
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/reginit.mem
}
read_verilog -library xil_defaultlib {
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/SEG7_LUT.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/async.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/bus/bus.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/cp0_reg.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/ctrl.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/defines.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/div.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/ex.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/ex_mem.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/flash_control.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/hilo_reg.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/id.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/id_ex.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/if_id.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/mem.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/mem_wb.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/mmu/mmu_interface.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/mux_for_pc_mem.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/my_sram_control.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/openmips.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/openmips_min_sopc.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/pc_reg.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/regfile.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/mmu/tlb.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/uart_control.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/vga.v
  D:/Totoro/Src/thinpad_top.srcs/sources_1/new/thinpad_top.v
}
read_ip -quiet D:/Totoro/Src/thinpad_top.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci
set_property used_in_implementation false [get_files -all d:/Totoro/Src/thinpad_top.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc]

read_ip -quiet D:/Totoro/Src/thinpad_top.srcs/sources_1/ip/pll_example/pll_example.xci
set_property used_in_implementation false [get_files -all d:/Totoro/Src/thinpad_top.srcs/sources_1/ip/pll_example/pll_example_board.xdc]
set_property used_in_implementation false [get_files -all d:/Totoro/Src/thinpad_top.srcs/sources_1/ip/pll_example/pll_example.xdc]
set_property used_in_implementation false [get_files -all d:/Totoro/Src/thinpad_top.srcs/sources_1/ip/pll_example/pll_example_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/Totoro/Src/thinpad_top.srcs/constrs_1/new/thinpad_top.xdc
set_property used_in_implementation false [get_files D:/Totoro/Src/thinpad_top.srcs/constrs_1/new/thinpad_top.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top thinpad_top -part xc7a100tfgg676-2L -flatten_hierarchy none


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef thinpad_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file thinpad_top_utilization_synth.rpt -pb thinpad_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]