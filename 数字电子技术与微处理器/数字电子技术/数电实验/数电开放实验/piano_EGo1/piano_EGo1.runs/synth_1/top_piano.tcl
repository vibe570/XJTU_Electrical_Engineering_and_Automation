# 
# Synthesis run script generated by Vivado
# 

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
set_param xicom.use_bs_reader 1
set_param synth.incrementalSynthesisCache C:/Users/AlexD/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-11652-AlexD-Desktop/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.cache/wt [current_project]
set_property parent.project_path D:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  D:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/imports/new/keyboard.v
  D:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/imports/new/play.v
  D:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/imports/new/ps2_rx.v
  D:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/imports/new/sound.v
  D:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/imports/new/vga_draw.v
  D:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/imports/new/vga_sync.v
  D:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/imports/new/top_piano.v
}
read_ip -quiet D:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/ip/dcm_clk/dcm_clk.xci
set_property used_in_implementation false [get_files -all d:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/ip/dcm_clk/dcm_clk_board.xdc]
set_property used_in_implementation false [get_files -all d:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/ip/dcm_clk/dcm_clk.xdc]
set_property used_in_implementation false [get_files -all d:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/ip/dcm_clk/dcm_clk_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/constrs_1/new/piano_EGo1.xdc
set_property used_in_implementation false [get_files D:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/constrs_1/new/piano_EGo1.xdc]


synth_design -top top_piano -part xc7a35tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top_piano.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_piano_utilization_synth.rpt -pb top_piano_utilization_synth.pb"
