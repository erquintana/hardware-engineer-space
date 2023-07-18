class sequencer extends uvm_sequencer #(alu_seq_packet);
    `uvm_component_utils(sequencer);

    // Class constructor:
    function new(string name = "sequencer", uvm_component parent = null);
        super.new(name, parent);
        `uvm_info(this.get_name(),"sequencer instance created", UVM_MEDIUM);
    endfunction
endclass